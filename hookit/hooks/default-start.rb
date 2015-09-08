
service "cache" do
  action :enable
end

service "sentinel" do
  action :enable
end

service "proxy" do
  action :enable
end

ensure_socket 'db' do
  port '(6379|6380)'
  action :listening
end
