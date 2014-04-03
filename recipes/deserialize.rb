# encoding: UTF-8
#
# Cookbook Name:: byocm-chef
# Recipe:: deserialize
#
# Copyright 2014, Ryan J. Geyer <me@ryangeyer.com>
#
# All rights reserved - Do Not Redistribute
#

marker 'recipe_start_rightscale' do
  template 'rightscale_audit_entry.erb'
end

ruby_block 'deserialize byocm-chef attributes' do
  block do
    if ::File.exist?('/opt/byocm-chef/node.js')
      ::File.open('/opt/byocm-chef/node.js', 'r') do |f|
        vars = JSON.load(f)
        node.override['rs-base']['collectd_server'] = vars['rs_sketchy']
        node.override['collectd']['fqdn'] = vars['rs_instance_uuid']
      end
    end
  end
end
