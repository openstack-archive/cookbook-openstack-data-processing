Testing with chefspec
=====================

[ChefSpec](http://code.sethvargo.com/chefspec/) is a unit testing framework for testing Chef cookbooks. ChefSpec makes it easy to write examples and get fast feedback on cookbook changes without the need for virtual machines or cloud servers.

To run the chefspec tests:

    $ export COOKBOOK='openstack-orchestration'
    $ bundle exec rspec --format documentation .cookbooks/$COOKBOOK/spec

