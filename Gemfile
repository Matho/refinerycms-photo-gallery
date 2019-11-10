source "https://rubygems.org"

# this is due to renaming FactoryGirl -> FactoryBot. You do not need to use this version exactly
gem "refinerycms-authentication-devise", '~> 2.0.1',  git: 'https://github.com/refinery/refinerycms-authentication-devise', ref: "4fbe5428ea2fd2bfe033617d50c47dc2ce14351d"

gemspec

gem 'refinerycms', '~> 4.1.0', git: 'https://github.com/refinery/refinerycms.git', branch: 'master'
gem 'actionmailer', '~> 6.0.0'

group :development, :test do
  gem 'listen'
end

group :development, :test do
  # gem 'refinerycms-testing', '~> 4.0.3'
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
