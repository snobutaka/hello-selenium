# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.provider("virtualbox") do |vb|
    # vb.gui = true
    vb.cpus = 1
    vb.memory = "1024"
  end

  config.vm.provision("shell", privileged: false) do |shell|
    shell.path = "provision.sh"
  end
end
