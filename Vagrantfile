Vagrant.configure("2") do |config|


	image1="centos/7"
	image2="ubuntu/bionic64"
	NodeCount = 1
	(1..NodeCount).each do |i|		
		config.vm.define "web_#{i+1}" do |web|
			web.vm.box = "#{image1}"
			web.vbguest.auto_update = false
    	  	web.vbguest.installer_options = { allow_kernel_upgrade: true }
			web.vm.network "private_network", ip: "192.168.15.15#{i+1}", name: "vboxnet1"
			web.vm.network "forwarded_port", guest: 80, host: "808#{i+1}", host_ip: "127.0.0.#{i+1}"
			web.vm.hostname = "web#{i}"

			web.vm.provision "shell", path: "script.sh"

			web.vm.provider "virtualbox" do |v|
				v.cpus = 4
				v.memory = 2048
				v.name = "web#{i}"
				v.customize ["modifyvm", :id, "--groups", "/DevOpsLabs"]
			end
		end

		config.vm.define "db_#{i+2}" do |db|
			db.vm.box = "#{image2}"
			db.vbguest.auto_update = false
			db.vbguest.installer_options = { allow_kernel_upgrade: true }
			db.vm.network "private_network", ip: "192.168.15.15#{i+3}", name: "vboxnet1"
			db.vm.network "forwarded_port", guest: 80, host: "808#{i+3}", host_ip: "127.0.0.#{i+2}"
			db.vm.hostname = "db#{i+1}"
			
			db.vm.provider "virtualbox" do |v|
				v.cpus = 4
				v.memory = 2048
				v.name = "db#{i+1}"
				v.customize ["modifyvm",:id, "--groups", "/DevOpsLabs"]
			
			if "#{image2}" == "ubuntu/bionic64"
				db.vm.provision "shell", inline: "apt install mysql-server -y"
			end
			end			
		end
	end
end