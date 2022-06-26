source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby File.read('.ruby-version').strip

gem 'dotenv-rails', groups: %i[development test]

gem 'simplecov', require: false, group: :test

gem 'rails'

gem 'bootsnap', require: false
gem 'decent_exposure'
gem 'devise', github: 'heartcombo/devise'
gem 'elasticsearch', '<=7.13' # https://docs.bonsai.io/article/99-searchkick
gem 'friendly_id'
gem 'haml_lint', require: false
gem 'haml-rails'
gem 'importmap-rails'
gem 'iron_teapot', github: 'TalariaSoftware/iron_teapot'
gem 'jbuilder'
gem 'pg'
gem 'public_suffix'
gem 'puma'
gem 'pundit'
gem 'rack-canonical-host'
gem 'redis'
gem 'rollbar'
# gem 'sassc-rails'
gem 'scout_apm'
gem 'searchkick'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'uswds_components', github: 'TalariaSoftware/uswds_components'
gem 'uuid'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  # See https://edgeguides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'brakeman'
  gem 'bundler-audit'
  gem 'license_finder'
  gem 'rails_best_practices'
  gem 'rubocop'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rake'
  gem 'rubocop-rspec'
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'factory_bot'
  gem 'faker'
  gem 'pundit-matchers'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
  gem 'webdrivers'
end
