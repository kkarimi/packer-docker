# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  if Vagrant.has_plugin?("vagrant-cachier")
    # Configure cached packages to be shared between instances of the same base box.
    # More info on http://fgrehm.viewdocs.io/vagrant-cachier/usage
    config.cache.scope = :box
  end
  config.vm.box = "ubuntu/yakkety64"

  # set auto_update to false, if you do NOT want to check the correct
  # additions version when booting this machine
  config.vbguest.auto_update = true

  # do NOT download the iso file from a webserver
  config.vbguest.no_remote = false

  config.vm.provision :shell, :inline => <<-PREPARE

apt-get -y update
apt-get install -y wget unzip curl

mkdir /home/vagrant/packer
cd /home/vagrant/packer
wget https://releases.hashicorp.com/packer/0.12.1/packer_0.12.1_linux_amd64.zip
unzip packer_0.12.1_linux_amd64.zip
echo "export PATH=$PATH:/home/vagrant/packer" > /home/vagrant/.bashrc
PREPARE
end
