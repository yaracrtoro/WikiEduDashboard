# encoding: utf-8
# -*- mode: ruby -*-

$script = <<SCRIPT
cd /vagrant

export DEBIAN_FRONTEND=noninteractive

#### basic
sudo apt-get update
sudo apt-get install -y software-properties-common python-software-properties build-essential git curl libxslt1-dev libxml2-dev libssl-dev

#### rvm/ruby
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable
source $HOME/.rvm/scripts/rvm
rvm use --default --install 2.1.5

#### mysql
sudo apt-get install -y debconf-utils
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
sudo apt-get install -y mysql-server

#### node
curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
sudo apt-get install -y nodejs

#### some gem dependencies
sudo apt-get install -y libmysqlclient-dev
sudo apt-get install -y libpq-dev libqtwebkit-dev qt5-default gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-x

#### gems
gem install bundler
bundle install

#### npm/bower modules
mkdir ~/.npm-global
npm config set prefix "~/.npm-global"
echo "export PATH=~/.npm-global/bin:$PATH" >> ~/.bash_profile
source ~/.bash_profile
npm install
npm install bower gulp -g
bower install

#### provision db
sudo mysql -uroot -proot -e "CREATE DATABASE dashboard DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci";
sudo mysql -uroot -proot -e "CREATE DATABASE dashboard_testing DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;"
sudo mysql -uroot -proot -e "GRANT ALL ON dashboard.* TO 'root'@'localhost' identified by 'root';"
sudo mysql -uroot -proot -e "GRANT ALL ON dashboard_testing.* TO 'root'@'localhost' identified by 'root';"

#### application.yml
# TODO: check if application.yml exists?
# overwrite it
# sed it with root/root, etc
# run db migrations
bundle exec rake db:migrate

echo "Provisioning complete!

In one tab, start rails:

$ vagrant ssh
$ cd /vagrant
$ rails s -b 0.0.0.0

In another tab, start gulp:

$ vagrant ssh
$ cd /vagrant
$ gulp

Then visit http://localhost:3000 in your browser!"

SCRIPT

Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/precise64"
  config.ssh.forward_agent = true

  config.vm.network "private_network", ip: "192.168.50.4"
  config.vm.synced_folder ".", "/vagrant", type: "nfs"

  config.vm.network :forwarded_port, guest: 3000, host: 3000

  config.vm.provision "shell", inline: $script, privileged: false
end
