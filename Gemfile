source 'https://rubygems.org'

ruby '2.2.3'

gem 'rake', '10.1.0'

gem 'twilio-ruby', '~> 4.11.1'

gem 'faker'
gem 'rails', '4.2.6'

gem 'pg', '~> 0.15'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

gem 'rubocop', '~> 0.39.0', require: false

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'foundation-rails'
# for aws cloud storage
gem 'fog'
# photo resizing
gem "mini_magick"
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'carrierwave'
gem 'kaminari'
gem 'devise'
gem 'mail'
gem 'dotenv-rails', :groups => [:development, :test]

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'launchy'
  gem 'factory_girl_rails'
  gem 'valid_attribute'
  gem 'shoulda-matchers', require: false
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  gem 'coveralls', require: false
  gem "poltergeist"
  gem 'database_cleaner'
  gem 'webmock'
  gem 'vcr'
end

group :production do
  gem 'rails_12factor'
  gem 'puma'
end
