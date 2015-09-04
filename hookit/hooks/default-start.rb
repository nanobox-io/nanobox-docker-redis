
# the only_if logic is there as an alternative to `sleep 6` (runit service detection)
service "cache" do
  action :enable
  init :runit
  only_if do
    if File.exist?('/etc/service/cache/run')
      6.times { `sv status cache`; break if $?.exitstatus == 0; sleep 1}
      $?.exitstatus == 0
    else
      false
    end
  end
end

service "sentinel" do
  action :enable
  init :runit
  only_if do
    if File.exist?('/etc/service/sentinel/run')
      6.times { `sv status sentinel`; break if $?.exitstatus == 0; sleep 1}
      $?.exitstatus == 0
    else
      false
    end
  end
end

service "proxy" do
  action :enable
  init :runit
  only_if do
    if File.exist?('/etc/service/proxy/run')
      6.times { `sv status proxy`; break if $?.exitstatus == 0; sleep 1}
      $?.exitstatus == 0
    else
      false
    end
  end
end

execute 'ensure socket' do
  command "netstat -an | egrep ':(6379|6380)'"
  only_if do
    5.times { `netstat -an | egrep ':(6379|6380)'`; $?.exitstatus == 0 && break; sleep 1 }
    $?.exitstatus == 0
  end
end
