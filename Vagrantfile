Vagrant.configure("2") do |config|
    config.vm.box = "local/hashistack"
    # Working directory is `[project-root]/template/test` will pick box built locally in order to run test
    config.vm.box_url = "file://../vagrant-hashistack/packer/output-hashistack/package.box"
    #config.vm.box = "fredrikhgrelland/hashistack"
    #config.vm.box_version = ">= 0.2, < 0.3"
    config.vm.provider "virtualbox" do |vb|
        vb.linked_clone = true
        vb.memory = 2048
    end
        config.vm.provision "ansible_local" do |ansible|
            ansible.provisioning_path = "/vagrant/dev/ansible"
            ansible.playbook = "playbook.yml" # Note this playbook is, in this context, /ansible/playbook.yml
        end
end
