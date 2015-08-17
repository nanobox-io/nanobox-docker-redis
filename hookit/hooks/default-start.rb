
service "cache" do
  action :enable
  init 'runit'
end

service "sentinel" do
  action :enable
  only_if { File.exist?('/etc/service/sentinel/run') }
  init 'runit'
end

service "proxy" do
  action :enable
  only_if { File.exist?('/etc/service/proxy/run') }
  init 'runit'
end
