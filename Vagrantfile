# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  if Vagrant.has_plugin?("vagrant-cachier")
    # Configure cached packages to be shared between instances of the same base box.
    # More info on http://fgrehm.viewdocs.io/vagrant-cachier/usage
    config.cache.scope = :box
  end
  config.vm.box = "macbeth76/ubuntu-14-04-amd64-virtualbox"

  # set auto_update to false, if you do NOT want to check the correct
  # additions version when booting this machine
  config.vbguest.auto_update = true

  # do NOT download the iso file from a webserver
  config.vbguest.no_remote = false

  config.vm.provision :shell, :inline => <<-PREPARE

apt-get -y update
apt-get install -y wget unzip curl
apt-get install -y apt-transport-https ca-certificates
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
rm -rf /etc/apt/sources.list.d/docker.list
echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" >> /etc/apt/sources.list.d/docker.list
apt-get -y update
apt-get -y purge lxc-docker
apt-cache policy docker-engine
apt-get -y install linux-image-extra-$(uname -r) linux-image-extra-virtual
apt-get -y install docker-engine
service docker start
groupadd docker
usermod -aG docker vagrant

mkdir /home/vagrant/packer
cd /home/vagrant/packer
wget https://releases.hashicorp.com/packer/0.10.1/packer_0.10.1_linux_amd64.zip
unzip packer_0.10.1_linux_amd64.zip
echo "export PATH=$PATH:/home/vagrant/packer" > /home/vagrant/.bashrc

cd /vagrant
bash -c "packer build machine_ansible.json"
PREPARE
  
end
