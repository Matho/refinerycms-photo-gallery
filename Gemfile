source "https://rubygems.org"

gem "refinerycms-authentication-devise", '~> 1.0.4'

gemspec

gem 'refinerycms', '~> 3.0.5'

group :development, :test do
  gem 'refinerycms-testing', '~> 3.0.5'
end

# Add the default visual editor, for now.
gem 'refinerycms-wymeditor', ['~> 1.0', '>= 1.0.6']

group :test do
  gem 'pry'
  gem 'launchy'
  gem 'poltergeist'
  gem 'capybara-screenshot'
end

# Database Configuration
unless ENV['TRAVIS']
  gem 'activerecord-jdbcsqlite3-adapter', :platform => :jruby
  gem 'sqlite3', :platform => :ruby
end


if !ENV['TRAVIS'] || ENV['DB'] == 'postgresql'
  gem 'activerecord-jdbcpostgresql-adapter', :platform => :jruby
  gem 'pg', :platform => :ruby
end

# Refinery/rails should pull in the proper versions of these
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
end

# Load local gems according to Refinery developer preference.
if File.exist? local_gemfile = File.expand_path('../.gemfile', __FILE__)
  eval File.read(local_gemfile)
end
