if node['chezmoi']['nvm']
  include_recipe 'nvm'
  nvm_install 'v17.0.1'
end
if node['chezmoi']['golang']
  include_recipe 'golang'
end
