
service "cache" do
  action :enable
end

service "sentinel" do
  action :enable
  only_if { File.exist?('/etc/service/sentinel/run') }
end

service "proxy" do
  action :enable
  only_if { File.exist?('/etc/service/proxy/run') }
end

ensure_socket 'db' do
  port '(6379|6380)'
  action :listening
end
