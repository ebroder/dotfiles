chef_guid '4c200209-0123-48b6-9892-3be42f26cacc'
minimal_ohai true
cookbook_path [File.join(__dir__, 'cookbooks')]
data_bag_path File.join(__dir__, 'data_bags')
file_cache_path File.expand_path('~/.cache/chezmoi-chef/files')
node_path File.expand_path('~/.cache/chezmoi-chef/nodes')
file_backup_path File.expand_path('~/.local/share/chezmoi-chef/backup')
