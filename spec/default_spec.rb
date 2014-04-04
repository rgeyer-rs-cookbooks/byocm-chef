# encoding: UTF-8
require 'chefspec'
require 'chefspec/berkshelf'

describe 'byocm-chef::serialize' do
  let(:chef_run) do
    ChefSpec::Runner.new do |node|
      node.set['byocm-chef']['rs_sketchy'] = 'sketchy.rightscale.com'
      node.set['byocm-chef']['rs_instance_uuid'] = 'uuid'
    end.converge(described_recipe)
  end

  it 'creates the byocm-chef home directory' do
    expect(chef_run).to create_directory('/opt/byocm-chef')
  end

  it 'serializes stuff to a json file' do
    expect(chef_run).to create_template('/opt/byocm-chef/node.js').with(
        variables: {
          'rs_sketchy' => 'sketchy.rightscale.com',
          'rs_instance_uuid' => 'uuid'
        }
      )
  end
end
