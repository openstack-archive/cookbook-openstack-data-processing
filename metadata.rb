name 'openstack-data-processing'
maintainer 'openstack-chef'
maintainer_email 'openstack-dev@lists.openstack.org'
license 'Apache 2.0'
description 'The OpenStack Data Processing service Sahara.'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '12.0.0'

%w( ubuntu redhat suse ).each do |os|
  supports os
end
