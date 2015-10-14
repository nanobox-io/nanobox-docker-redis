
service "flip" do
  action :disable
  only_if { File.exist?('/etc/service/flip/run') }
  init :runit
end
