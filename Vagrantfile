# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

# requires  vagrant plugin install vagrant-hostsupdater

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

    config.vm.provider "virtualbox" do |v|
        v.memory = 512
    end

    config.vm.define "clojure" do |clj|
        clj.vm.box = "box-cutter/centos67"
        clj.vm.provision :shell, path: "provision/clojure.sh", privileged: false

        clj.vm.provider "virtualbox" do |vb|
            vb.name = "clojure"
        end

        clj.vm.post_up_message = "Finished installation\n"
    end
end

