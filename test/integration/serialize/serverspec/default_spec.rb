# encoding: UTF-8
require 'serverspec'
require 'pathname'
require 'json'

include Serverspec::Helper::Exec

RSpec.configure do |conf|
  conf.path = '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'
end

describe 'writes node attributes to file' do
  describe '/opt/byocm-chef/node.js' do
    it 'has expected values' do
      actual_content = `cat /opt/byocm-chef/node.js`
      expected_content = {
        'rs_sketchy' => 'sketchy.rightscale.com',
        'rs_instance_uuid' => 'uuid'
      }.to_json
      actual_content.should == expected_content
    end
  end
end
