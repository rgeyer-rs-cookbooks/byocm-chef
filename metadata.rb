# encoding: UTF-8
# rubocop:disable SingleSpaceBeforeFirstArg, HashSyntax
name             'byocm-chef'
maintainer       'Ryan J. Geyer'
maintainer_email 'me@ryangeyer.com'
license          'All rights reserved'
description      'Installs/Configures byocm-chef'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'marker'

recipe 'byocm-chef::serialize', <<EOF
Accepts some RightScale environment variables as inputs, and serializes them to
a JSON file.
EOF

recipe 'byocm-chef::deserialize', <<EOF
Consumes the JSON file created by byocm-chef::serialize and turns the values
into node attributes.
EOF

attribute 'byocm-chef/rs_sketchy',
          :display_name => 'RightScale Sketchy Hostname',
          :description => 'Should alwas be set to env:RS_SKETCHY',
          :recipes => ['byocm-chef::serialize'],
          :required => 'required'

attribute 'byocm-chef/rs_instance_uuid',
          :display_name => 'RightScale Instance UUID',
          :description => 'Should alwas be set to env:RS_INSTANCE_UUID',
          :recipes => ['byocm-chef::serialize'],
          :required => 'required'
