Vagrant.configure("2") do |config|
    config.vm.box = "fredrikhgrelland/hashistack"
    config.vm.box_version = "~> 0.2"
    config.vm.provider "virtualbox" do |vb|
        vb.linked_clone = true
        vb.memory = 2048
    end
end
