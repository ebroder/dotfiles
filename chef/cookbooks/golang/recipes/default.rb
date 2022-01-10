if platform_family?('mac_os_x')
  homebrew_package 'go'
elsif platform_family?('debian')
  # TODO
else
  raise 'Unsupported platform family'
end
