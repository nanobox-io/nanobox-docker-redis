
# the only_if logic is there as an alternative to `sleep 6` (runit service detection)
service "cache" do
  action :enable
  init :runit
  only_if { ( File.exist?('/etc/service/cache/run') ) && ( 6.times { `sv status cache`; $?.exitstatus == 0 && break; sleep 1; }; $?.exitstatus == 0 ) }
end

service "sentinel" do
  action :enable
  only_if { ( File.exist?('/etc/service/sentinel/run') ) && ( 6.times { `sv status sentinel`; $?.exitstatus == 0 && break; sleep 1; }; $?.exitstatus == 0 ) }
  init :runit
end

service "proxy" do
  action :enable
  only_if { ( File.exist?('/etc/service/proxy/run') ) && ( 6.times { `sv status proxy`; $?.exitstatus == 0 && break; sleep 1; }; $?.exitstatus == 0 ) }
  init :runit
end

execute 'ensure socket' do
  command "netstat -an | egrep ':(6379|6380)'"
  only_if { 5.times { `netstat -an | egrep ':(6379|6380)'`; $?.exitstatus == 0 && break; sleep 1; } }
end
