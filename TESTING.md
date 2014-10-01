# Testing the Cookbook #

This cookbook uses [bundler](http://gembundler.com/) and [berkshelf](http://berkshelf.com/) to isolate dependencies.

## Using Rake ##

Make sure you have `ruby 1.9.x`, `bundler`, `rake`, build essentials and the header files for `gecode` installed before continuing. Make sure that you're using gecode version 3. More info [here](https://github.com/opscode/dep-selector-libgecode/tree/0bad63fea305ede624c58506423ced697dd2545e#using-a-system-gecode-instead).

We have three test suites which you can run either, individually (there are three rake tasks):

    $ rake lint
    $ rake style
    $ rake unit

or altogether:

    $ rake test

The `rake` tasks will take care of installing the needed gem dependencies and cookbooks with `berkshelf`.

## Using Berkshelf directly ##

``Rake`` simplifies the use of ``berkshelf``, you can still use ``berkshelf`` directly but it will require more substantial efforts:

To setup the dependencies:

    $ bundle install --path=.bundle # install gem dependencies
    $ bundle exec berks vendor .cookbooks # install cookbook dependencies and create the folder .cookbooks

To run the tests:

    $ export COOKBOOK='openstack-compute'
    $ bundle exec foodcritic -f any -t ~FC003 -t ~FC023 .cookbooks/$COOKBOOK
    $ bundle exec rubocop .cookbooks/$COOKBOOK
    $ bundle exec rspec --format documentation .cookbooks/$COOKBOOK/spec

## Rubocop  ##

[Rubocop](https://github.com/bbatsov/rubocop) is a static Ruby code analyzer, based on the community [Ruby style guide](https://github.com/bbatsov/ruby-style-guide). We are attempting to adhere to this where applicable, slowly cleaning up the cookbooks until we can turn on Rubocop for gating the commits.

## Foodcritic ##

[Foodcritic](http://acrmp.github.io/foodcritic/) is a lint tool for Chef cookbooks. We ignore the following rules:

* [FC003](http://acrmp.github.io/foodcritic/#FC003) These cookbooks are not intended for Chef Solo.
* [FC023](http://acrmp.github.io/foodcritic/#FC023) Prefer conditional attributes.

## Chefspec

[ChefSpec](http://code.sethvargo.com/chefspec/) is a unit testing framework for testing Chef cookbooks. ChefSpec makes it easy to write examples and get fast feedback on cookbook changes without the need for virtual machines or cloud servers.
