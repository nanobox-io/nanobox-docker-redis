
service "flip" do
  action :enable
  only_if { File.exist?('/etc/service/flip/run') }
  init :runit
end
