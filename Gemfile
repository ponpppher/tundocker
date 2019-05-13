# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.0'

# system gems
gem 'rails', '~> 5.2.3'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'dotenv-rails'
gem 'font-awesome-rails'

# use javascript
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'

# encrypt
gem 'bcrypt', '~> 3.1.7'

# basic util
gem 'devise', '>= 4.6.0'
gem 'bootstrap'
gem 'carrierwave'
gem 'mini_magick', '~> 4.8'
gem 'kaminari'
gem 'kaminari-bootstrap'
gem 'rails_autolink'

# tag generate
gem 'acts-as-taggable-on', '~> 6.0'

# deploy
gem 'capistrano-rails', group: :development

# advanced function
gem 'ransack'
gem 'redcarpet', '~>2.3.0'
gem 'coderay'

# twitter login
gem 'omniauth'
gem 'omniauth-twitter'

# gem 'cocoon'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails', '~> 4.11'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'faker'
  gem 'bullet'

  # aggregate migration files
  gem 'squasher'

  # lint tool
  gem 'rubocop', '~> 0.55.0', require: false
end

group :test do
  gem 'rspec-rails', '~>3.7'
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end
