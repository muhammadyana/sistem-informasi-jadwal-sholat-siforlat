source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.1'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
# gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

#ADDITIONAL GEM
gem 'active_link_to'
gem 'activeadmin'
gem 'active_model_serializers', '~> 0.10.0'
gem 'awesome_print'
gem 'bootstrap', '~> 4.1.3'
gem 'country_select', require: 'country_select_without_sort_alphabetical'
# gem 'bootstrap-sass', '~> 3.3.7'
gem 'bootstrap-sass-extras'
# gem 'bootstrap-generators'
gem 'devise', github: 'plataformatec/devise'
gem 'delayed_job_active_record', '~> 4.1.3'
gem 'devise_token_auth'
gem 'draper', '~> 3.0.0'
gem 'font-awesome-rails'
gem 'foreman'
gem 'friendly_id'
gem 'figaro', '~> 1.1.1'
gem 'fog-aws', '~> 2.0.0'
# gem 'fast_jsonapi'
gem 'jquery'
gem 'jquery-rails'
gem 'jquery-turbolinks'
gem 'httparty'
gem 'nprogress-rails'
gem 'slim-rails'
gem 'popper_js', '~> 1.14.3'
gem 'simple_form'
gem 'momentjs-rails'
gem 'meta-tags'
gem 'oj', '~> 2.17.5'
gem 'pry-rails', '~> 0.3.6'
gem 'rack-cors', '~> 0.4.0'
gem 'recaptcha'

# Image processing
gem 'carrierwave'
gem 'mini_magick'
gem 'carrierwave-base64', '~> 2.3.4'

gem 'dotenv-rails'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'annotate'
  # gem 'better_errors', '~> 2.1.1'
  # gem 'binding_of_caller', '~> 0.7.2'
  gem 'letter_opener', '~> 1.4.1'
  gem 'rails_best_practices', '~> 1.19.0'
  gem 'capistrano',         require: false
  gem 'capistrano-rvm',     require: false
  gem 'capistrano-rails',   require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano3-puma',   require: false
  gem 'capistrano-rails-console', require: false
  gem 'capistrano-rails-db'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
  gem 'database_cleaner', '~> 1.4.1'
  gem 'faker', '~> 1.7.3'
end

group :assets do
  gem 'uglifier', '>= 1.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
