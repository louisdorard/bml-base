# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "louisdorard/mycondabox"

  # Configure vm name and resources
  config.vm.provider :virtualbox do |vb|
    vb.name = "bml-base"
    vb.customize ["modifyvm", :id, "--memory", "512"]
    vb.customize ["modifyvm", :id, "--cpus", "1"]
  end

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network :forwarded_port, guest: 80, host: 8080
  # Here we use it for IPython Notebooks:
  config.vm.network :forwarded_port, host: 8888, guest: 8888
  
  # Provision VM
  config.vm.provision :shell, :path => "provision.sh"
end
