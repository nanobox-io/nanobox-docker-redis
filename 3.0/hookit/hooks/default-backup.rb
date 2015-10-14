
# issue save to the local redis
# 'save' rather than 'bgsave' so it blocks
if payload[:service][:topology] == 'redundant'
  execute 'execute save' do
    command '/data/bin/redis-cli -p 6380 save'
  end
else
  execute 'execute save' do
    command '/data/bin/redis-cli save'
  end
end

# TODO: assuming we can scp backups to a backup container
execute "send data to backup container" do
  command <<-EOF
    gzip -c /data/var/db/redis/dump.rdb \
      | tee >(md5sum | cut -f1 -d" " > /tmp/md5sum) \
      | ssh #{payload[:backup][:local_ip]} \
      > /data/var/db/redis/#{payload[:backup][:backup_id]}.gz
  EOF
end

remote_sum = `ssh #{payload[:backup][:local_ip]} "md5sum /data/var/db/redis/#{payload[:backup][:backup_id]}.gz | awk \'{print $1}\'"`.to_s.strip

# Read POST results
local_sum = File.open('/tmp/md5sum') {|f| f.readline}.strip

# Ensure checksum match
if remote_sum != local_sum
  puts 'checksum mismatch'
  exit 1
end
