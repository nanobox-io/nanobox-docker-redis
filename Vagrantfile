# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box     = "ubuntu/trusty64"

  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--memory", "2048", "--ioapic", "on"]
  end

  config.vm.synced_folder ".", "/vagrant"

  # install docker
  config.vm.provision "shell", inline: <<-SCRIPT
    if [[ ! `which docker > /dev/null 2>&1` ]]; then
      sudo apt-get -y purge docker-engine
      bash <(curl -fsSL https://get.docker.com/)
      # clean up packages that aren't needed
      apt-get -y autoremove
      # add the vagrant user to the docker group
      usermod -aG docker vagrant
    fi
  SCRIPT

  # start docker
  config.vm.provision "shell", inline: <<-SCRIPT
    if [[ ! `service docker status | grep "start/running"` ]]; then
      # start the docker daemon
      service docker start
    fi
  SCRIPT

  # wait for docker to be running
  config.vm.provision "shell", inline: <<-SCRIPT
    echo "Waiting for docker sock file"
    while [ ! -S /var/run/docker.sock ]; do
      sleep 1
    done
  SCRIPT

  # build the docker image
  config.vm.provision "shell", inline: <<-SCRIPT
    echo "Building docker image..."
    cd /vagrant
    docker build -t nanobox/redis:2.8 --no-cache=true 2.8
    docker tag -f nanobox/redis:2.8 nanobox/redis:2.8
      docker build -t nanobox/redis:3.0 --no-cache=true 3.0
    docker tag -f nanobox/redis:3.0 nanobox/redis:3.0
  SCRIPT

end
