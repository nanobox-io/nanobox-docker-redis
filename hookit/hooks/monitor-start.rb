
service "sentinel" do
  action :enable
  only_if { File.exist?('/etc/service/sentinel/run') }
  init 'runit'
end
