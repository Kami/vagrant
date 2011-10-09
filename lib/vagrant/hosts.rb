module Vagrant
  module Hosts
    autoload :Base,  'vagrant/hosts/base'
    autoload :Arch,  'vagrant/hosts/arch'
    autoload :BSD,   'vagrant/hosts/bsd'
    autoload :Fedora, 'vagrant/hosts/fedora'
    autoload :Fedora16, 'vagrant/hosts/fedora16'
    autoload :Linux, 'vagrant/hosts/linux'
  end
end
