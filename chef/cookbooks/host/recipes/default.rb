if node['chezmoi']['nvm']
  include_recipe 'nvm'
  nvm_install 'v17.0.1'
end
