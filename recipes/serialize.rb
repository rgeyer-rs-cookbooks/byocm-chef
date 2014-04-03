# encoding: UTF-8
#
# Cookbook Name:: byocm-chef
# Recipe:: serialize
#
# Copyright 2014, Ryan J. Geyer <me@ryangeyer.com>
#
# All rights reserved - Do Not Redistribute
#

marker 'recipe_start_rightscale' do
  template 'rightscale_audit_entry.erb'
end

directory '/opt/byocm-chef'

template '/opt/byocm-chef/node.js' do
  source 'node.js.erb'
  variables(
    rs_sketchy: node['byocm-chef']['rs_sketchy'],
    rs_instance_uuid: node['byocm-chef']['rs_instance_uuid']
  )
end
