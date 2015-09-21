
execute 'execute save' do
  command '/data/bin/redis-cli -p 6380 save'
end

payload[:generation][:members].each do |member|

  if member[:member_type] == 'default'

    execute "send bulk data to new member" do
      command "tar -cf - /datas | ssh #{member[:local_ip]} tar -xpf -"
    end

  end
end
