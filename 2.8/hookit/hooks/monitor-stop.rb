
service "sentinel" do
  action :disable
  only_if { File.exist?('/etc/service/sentinel/run') }
  init :runit
end
