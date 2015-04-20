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

# Create Directory for SSL certificates
directory "#{node['nginx']['dir']}/ssl" do
	action :create
end

# Add SSL Key to Nginx
cookbook_file "#{node['nginx']['dir']}/ssl/#{node['nginx']['keyfile']}" do
	source "#{node['nginx']['keyfile']}"
end

# Add SSL Certs to Nginx
cookbook_file "#{node['nginx']['dir']}/ssl/#{node['nginx']['certfile']}" do
	source "#{node['nginx']['certfile']}"
end

