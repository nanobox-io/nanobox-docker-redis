
directory '/data/etc/flip'

# set flip.conf
template '/data/etc/flip/flip.conf' do
  mode 0644
  variables ({
    payload: payload
  })
end

template '/etc/service/flip/log/run' do
  mode 0755
  source 'log-run.erb'
  variables ({ svc: "flip" })
end

template '/etc/service/flip/run' do
  mode 0755
  variables ({ exec: "/data/flip/flipd /data/etc/flip/flip.conf 2>&1" })
end

execute 'multicast route' do
  command 'route add -net 224.0.0.0/3 dev eth0 || true'
end

file '/etc/nanoinit.d/mroute' do
  content 'route add -net 224.0.0.0/3 dev eth0'
  mode 0755
end
