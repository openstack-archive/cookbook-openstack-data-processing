task default: ["test"]

task :test => [:lint, :style, :unit]

task :bundler_prep do
  mkdir_p '.bundle'
  sh %{bundle install --path=.bundle --jobs 1 --retry 3 --verbose}
end

task :berks_prep => :bundler_prep do
  sh %{bundle exec berks vendor .cookbooks}
end

task :lint => :bundler_prep do
  sh %{bundle exec foodcritic --epic-fail any --tags ~FC003 --tags ~FC023 .cookbooks/openstack-data-processing}
end

task :style => :bundler_prep do
  sh %{bundle exec rubocop .cookbooks/openstack-data-processing}
end

task :unit => :berks_prep do
  sh %{bundle exec rspec --format documentation .cookbooks/openstack-data-processing/spec}
end

task :clean do
  rm_rf [
    '.bundle',
    '.cookbooks/openstack-data-processing',
    'Gemfile.lock',
    'Berksfile.lock'
  ]
end
