
execute "retrieve data from backup container" do
  command <<-EOF
    ssh #{payload[:backup][:local_ip]} \
    'cat /data/var/db/redis/#{payload[:backup][:backup_id]}.gz' \
      | gunzip \
      > /dump.rdb.tmp
  EOF
end

# forced 'appendonly no'
execute 'clean data dir from failed saves' do
  command 'rm -rf /data/var/db/redis/temp*.rdb'
end

execute 'flush redis' do
  command '/data/bin/redis-cli flushall'
end

# TODO: requires `pip install rdbtools`
execute 'replay dump to redis' do
  command '/usr/local/bin/rdb --command protocol /dump.rdb.tmp | nc localhost 6379'
end

execute 'cleanup dump' do
  command 'rm -f /dump.rdb.tmp'
end

