module Vagrant
  module Hosts
    class Fedora16 < Fedora
      def initialize(*args)
        super

        @nfs_server_binary = "nfs-server.service"
      end

      def nfs_export(ip, folders)
        output = TemplateRenderer.render('nfs/exports_fedora16',
                                         :uuid => env.vm.uuid,
                                         :ip => ip,
                                         :folders => folders)

        env.ui.info I18n.t("vagrant.hosts.linux.nfs_export.prepare")
        sleep 0.5

        output.split("\n").each do |line|
          # This should only ask for administrative permission once, even
          # though its executed in multiple subshells.
          system(%Q[sudo su root -c "echo '#{line}' >> /etc/exports"])
        end

        # We run restart here instead of "update" just in case nfsd
        # is not starting
        system("sudo systemctl restart #{@nfs_server_binary}")
      end
    end
  end
end
