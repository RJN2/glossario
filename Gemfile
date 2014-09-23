source 'https://rubygems.org'
ruby '2.1.2'
#ruby-gemset=railstutorial_rails_4_0

gem 'rails', '4.0.5'
gem 'bootstrap-sass'
gem 'font-awesome-sass', '4.1.0'
gem 'sprockets', '2.11.0'

group :development, :test do
  gem 'sqlite3', '1.3.8'
  gem 'rspec-rails', '2.13.1'
  gem 'guard-rspec', '2.5.0'
  gem 'spork-rails', '4.0.0'
  gem 'guard-spork', '1.5.0'
  gem 'childprocess', '0.3.6'
  gem 'faker', '~> 1.3.0'
  gem 'rails-erd', github: 'paulwittmann/rails-erd', branch: 'mavericks'
end

group :test do
  gem 'selenium-webdriver', '2.35.1', require: false
  gem 'poltergeist'
  gem 'capybara', '2.1.0'
  gem 'factory_girl_rails', '4.2.1'
  gem 'cucumber-rails', '1.4.0', require: false
  gem 'database_cleaner', github: 'bmabey/database_cleaner'
end

gem 'sass-rails', '4.0.1'
gem 'uglifier', '2.1.1'
gem 'coffee-rails', '4.0.1'
gem 'jquery-rails'
gem 'turbolinks', '1.1.1'
gem 'jbuilder', '1.0.2'
gem 'gon'
gem 'js-routes'

group :doc do
  gem 'sdoc', '0.3.20', require: false
end

group :production do
  gem 'pg', '0.15.1'
  gem 'rails_12factor', '0.0.2'
end