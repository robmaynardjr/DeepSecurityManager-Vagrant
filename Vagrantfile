# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|

  config.vm.box = "generic/rhel7"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  config.vm.box_check_update = true

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 4119, host: 4119
  config.vm.network "forwarded_port", guest: 4120, host: 4120
  config.vm.network "forwarded_port", guest: 443, host: 4430
  config.vm.network "forwarded_port", guest: 4118, host: 4118
  config.vm.network "forwarded_port", guest: 4122, host: 4122
  config.vm.network "forwarded_port", guest: 514, host: 514

  


  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder "./bin/vagrant_data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = false
  
    # Customize the amount of memory on the VM:
    vb.memory = "8096"
    vb.name = "dsm"
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.

  config.vm.provision "chef_zero" do |chef|
    # Specify the local paths where Chef data is stored
    chef.cookbooks_path = "bin/cookbooks"
    # chef.data_bags_path = "data_bags"
    chef.nodes_path = "bin/nodes"
    # Add a recipe
    chef.add_recipe "postgresql"
  end

  config.vm.provision "shell", inline: <<-SHELL
    cd /vagrant_data
    sudo -u postgres psql -c "CREATE DATABASE dsm;"
    sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE dsm TO dsm;"
    
    curl -O 'https://files.trendmicro.com/products/deepsecurity/en/11.3/Manager-Linux-11.3.184.x64.sh'

    chmod 750 ./Manager-Linux-11.3.184.x64.sh

    sudo ./Manager-Linux-11.3.184.x64.sh -q -console -varfile ./answer.txt

    rm ./Manager-Linux-11.3.184.x64.sh

    rm ./*.csv

  SHELL
end