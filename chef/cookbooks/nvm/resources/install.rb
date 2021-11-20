unified_mode true

property :version, String, name_property: true

action_class do
  def install_directory
    ::File.expand_path("~/.nvm/versions/node/#{new_resource.version}")
  end
end

action :create do
  bash 'install' do
    code <<-EOH
      . ~/.nvm/nvm.sh
      nvm install #{Shellwords.shellescape(new_resource.version)}
    EOH
    creates install_directory
  end
end

action :delete do
  bash 'uninstall' do
    code <<-EOH
      . ~/.nvm/nvm.sh
      nvm uninstall #{Shellwords.shellescape(new_resource.version)}
    EOH
    only_if { ::File.exist?(install_directory) }
  end
end
