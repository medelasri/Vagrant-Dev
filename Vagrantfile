Vagrant.configure("2") do |config|
  
  config.vm.box = "hashicorp/precise32"
  config.vm.hostname = "localhost"

  config.vm.network "forwarded_port", guest: 80, host: 8080
  #config.vm.network "forwarded_port", guest: 81, host: 8181
  config.vm.network "forwarded_port", guest: 443, host: 44300
  config.vm.network "forwarded_port", guest: 3306, host: 33060

  config.vm.synced_folder "./", "/home/vagrant", create: true, group: "vagrant", owner: "www-data"
                                            
  config.vm.provider "virtualbox" do |vb|
      vb.name = "local.dev"
      vb.memory = "512"
      vb.cpus = 1
  end

  config.vm.provision "shell", path: "bootstrap.sh"

# For Laravel Framework
#  config.vm.define "laravel" do |laravel|
#    laravel.vm.provision "shell", path: "laravel.sh"
#  end
end
