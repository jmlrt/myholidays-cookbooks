#
# Cookbook Name:: myholidays
# Recipe:: default
#
# Copyright (c) 2015 JMLRT, All Rights Reserved.

include_recipe 'apt::default'
include_recipe 'myholidays::webapp'
include_recipe 'myholidays::proxy'
