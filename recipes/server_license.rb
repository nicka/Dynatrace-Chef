#
# Cookbook Name:: dynatrace
# Recipes:: server_license
#
# Copyright 2015, Dynatrace
#

include_recipe 'dynatrace::dynatrace_user'

name = 'Dynatrace Server License'

license_file_name = node['dynatrace']['server']['license']['file_name']
license_file_url  = node['dynatrace']['server']['license']['file_url']

dynatrace_owner = node['dynatrace']['owner']
dynatrace_group = node['dynatrace']['group']

if platform_family?('debian', 'fedora', 'rhel')
  installer_prefix_dir = node['dynatrace']['server']['linux']['installer']['prefix_dir']
  license_path = "#{installer_prefix_dir}/dynatrace/server/conf/dtlicense.key"
else
  # Unsupported
end


dynatrace_copy_or_download_file "#{name}" do
  file_name       license_file_name
  file_url        license_file_url
  path            license_path
  dynatrace_owner dynatrace_owner
  dynatrace_group dynatrace_group
end
