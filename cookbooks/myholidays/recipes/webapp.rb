#
# Cookbook Name:: myholidays
# Recipe:: webapp
#
# Copyright (c) 2015 JMLRT, All Rights Reserved.

include_recipe 'java::default'
include_recipe 'tomcat::default'

service 'tomcat6' do
				supports :status => true, :restart => true, :reload => true
				action [ :enable, :start ]
end

remote_file "#{node['tomcat']['webapp_dir']}/myholidays.war" do
				source "#{node['webapp']['source']}"
				notifies :restart, 'service[tomcat6]'
end
