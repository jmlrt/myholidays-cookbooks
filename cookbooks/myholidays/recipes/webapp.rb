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

remote_file '/var/lib/tomcat6/webapps/sample.war' do
				source "https://tomcat.apache.org/tomcat-6.0-doc/appdev/sample/sample.war"
				notifies :restart, 'service[tomcat6]'
end
