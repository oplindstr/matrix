source 'https://rubygems.org'

gem "pkg-config"
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.11.1'
# Use sqlite3 as the database for Active Record
group :development, :test do
  gem 'sqlite3',  '1.3.13'
end

group :production, :staging do
  gem 'pg', '~> 0.20'
  gem 'rails_12factor'
end

gem 'puma'

gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'

gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.11'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'jquery-turbolinks'

gem 'nested_form_fields'

gem "bulma-rails", "~> 0.6.1"

gem 'figaro'

gem 'flatpickr_rails'

gem "rack", ">= 1.6.11"

gem "rails-html-sanitizer", ">= 1.0.4"

gem "loofah", ">= 2.2.3"

gem 'webrat', '0.7.1'

gem 'jquery-datatables'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem "better_errors"
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'rspec-rails', '~> 3.1'
  gem 'rspec-its'
  gem 'rack_session_access'

  gem 'capistrano',         require: false
  gem 'capistrano-rvm',     require: false
  gem 'capistrano-rails',   require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano3-puma',   require: false

  gem 'coffee-script-source', '1.8.0'
end

group :test do
  gem 'factory_girl_rails'
  gem 'launchy'
  gem 'simplecov', require: false
  gem "selenium-webdriver"
  gem "headless"
  gem "poltergeist"
  gem 'phantomjs', :require => 'phantomjs/poltergeist'
end

gem "bootstrap-sass", ">= 3.4.1"
group :development do
  gem 'rails_layout'
  gem 'autotest'
  gem 'web-console', '~> 2.0'
end

gem 'carrierwave'

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'dkim'