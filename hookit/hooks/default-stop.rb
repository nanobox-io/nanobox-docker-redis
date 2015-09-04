
execute '/data/bin/redis-cli shutdown save'

service "cache" do
  action :disable
  init :runit
end

service "sentinel" do
  action :disable
  only_if { File.exist?('/etc/service/sentinel/run') }
  init :runit
end

service "proxy" do
  action :disable
  only_if { File.exist?('/etc/service/proxy/run') }
  init :runit
end
