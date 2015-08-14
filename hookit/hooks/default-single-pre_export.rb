if payload[:new_member][:schema][:meta][:disk].to_i < `du -s /datas | awk '{print $1}`.to_i
  puts "Receiving side too small!!"
  exit 1
end #unless payload[:clear_data] == "false"

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

execute "send bulk data to new member" do
  command "tar -cf - /datas | ssh #{payload[:new_member][:local_ip]} tar -xpf -"
end
