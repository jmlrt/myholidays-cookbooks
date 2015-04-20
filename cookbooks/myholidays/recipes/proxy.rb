#
# Cookbook Name:: myholidays
# Recipe:: proxy
#
# Copyright (c) 2015 JMLRT, All Rights Reserved.

include_recipe 'nginx::default'

# Start Nginx
service 'nginx' do
	supports :status => true, :restart => true, :reload => true
	action [ :enable, :start ]
end

# Disable default website
execute 'nxdissite default'

# Configure MyHolidays website with template file
template "#{node['nginx']['dir']}/sites-available/#{node['nginx']['website']}" do
	source 'nginx_website.erb'
	notifies :restart, 'service[nginx]'
end

# Enable MyHolidays website
execute "nxensite #{node['nginx']['website']}"
