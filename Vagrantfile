# -*- mode: ruby -*-
# vi: set ft=ruby :

latest = `curl -s https://api.github.com/repos/pagodabox/nanobox-boot2docker/releases/latest | json name`.strip

$wait = <<SCRIPT
echo "Waiting for docker sock file"
while [ ! -S /var/run/docker.sock ]; do
  sleep 1
done
SCRIPT

Vagrant.configure(2) do |config|
  config.vm.box     = "nanobox/boot2docker"
  config.vm.box_url = "https://github.com/pagodabox/nanobox-boot2docker/releases/download/#{latest}/nanobox-boot2docker.box"

  config.vm.synced_folder ".", "/vagrant"

  # wait for docker to be running
  config.vm.provision "shell", inline: $wait

  # Add docker credentials
  config.vm.provision "file", source: "~/.dockercfg", destination: "/root/.dockercfg"

  # Build image
  config.vm.provision "shell", inline: "docker build -t #{ENV['docker_user']}/redis /vagrant"
  # build different versions (when we support them)
  # config.vm.provision "shell", inline: "docker build -t #{ENV['docker_user']}/redis:2.6 -f Dockerfile-2_6 /vagrant"

  # Tag built images
  config.vm.provision "shell", inline: "docker tag #{ENV['docker_user']}/redis #{ENV['docker_user']}/redis:3.0"
  config.vm.provision "shell", inline: "docker tag #{ENV['docker_user']}/redis #{ENV['docker_user']}/redis:3.0-stable"
  config.vm.provision "shell", inline: "docker tag #{ENV['docker_user']}/redis #{ENV['docker_user']}/redis:3.0-beta"
  config.vm.provision "shell", inline: "docker tag #{ENV['docker_user']}/redis #{ENV['docker_user']}/redis:3.0-alpha"

  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--memory", "768"]
  end

end
