# -*- mode: ruby -*-
# vi: set ft=ruby :

latest = `curl -s https://api.github.com/repos/pagodabox/nanobox-boot2docker/releases/latest | json name`.strip

Vagrant.configure(2) do |config|
  config.vm.box     = "nanobox/boot2docker"
  config.vm.box_url = "https://github.com/pagodabox/nanobox-boot2docker/releases/download/#{latest}/nanobox-boot2docker.box"

  config.vm.synced_folder ".", "/vagrant"

  # Add docker credentials
  config.vm.provision "file", source: "~/.dockercfg", destination: "/root/.dockercfg"

  # Build image
  config.vm.provision "shell", inline: "docker build -t #{ENV['docker_user']}/redis /vagrant"

  # Publish image to dockerhub
  config.vm.provision "shell", inline: "docker push #{ENV['docker_user']}/redis"

  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--memory", "768"]
  end

end
