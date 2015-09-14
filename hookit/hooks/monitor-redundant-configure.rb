
ip        = `ifconfig eth0 | awk '/inet addr/ {print $2}' | cut -f2 -d':'`.to_s.strip
master_ip = payload[:generation][:members].select { |mem| mem[:role] == 'primary'}[0][:local_ip]
sentinel  = (payload[:generation][:members].select { |mem| mem[:role] == 'monitor'}[0][:local_ip] == ip) ? master_ip : '127.0.0.1'

# set redis config
directory '/data/etc/redis' do
  owner 'gopagoda'
  group 'gopagoda'
end

template '/data/etc/redis/sentinel.conf' do
  source 'sentinel.conf.erb'
  mode 0644
  variables ({ master: master_ip })
  owner 'gopagoda'
  group 'gopagoda'
end

# start sentinel
template '/etc/service/sentinel/log/run' do
  mode 0755
  source 'log-run.erb'
  variables ({ svc: "sentinel" })
end

template '/etc/service/sentinel/run' do
  mode 0755
  variables ({ exec: "redis-server /data/etc/redis/sentinel.conf --sentinel 2>&1" })
end

# Narc Setup
template '/opt/local/etc/narc/narc.conf' do
  source 'monitor-narc.conf.erb'
  variables ({
    service: payload[:service],
    app: payload[:app]
  })
end
