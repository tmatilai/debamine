source 'https://rubygems.org'

gem 'chef',         '~> 11'

group :builder do
  gem 'knife-ec2',    '~> 0.6'
  gem 'knife-solo',
    :github => 'tmatilai/knife-solo',
    :branch => 'knife-bootstrap-solo'
  gem 'librarian',    '~> 0.0.26'
end

group :development do
  gem 'guard-foodcritic'
  gem 'rb-fsevent',       :require => false
  gem 'rb-inotify',       :require => false
end

group :development, :test do
  gem 'foodcritic', '~> 1.7'
  gem 'rake'
end
