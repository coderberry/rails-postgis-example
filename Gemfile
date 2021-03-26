source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'rails', "6.1.3"
gem 'pg', '~> 1.2', '>= 1.2.3'
gem 'puma', '~> 5.0', '>= 5.0.4'
gem 'bootsnap', '~> 1.5', '>= 1.5.1'
gem 'webpacker', '~> 5.2', '>= 5.2.1'
gem 'turbolinks', '~> 5.2', '>= 5.2.1'

gem 'sidekiq', '~> 6.1', '>= 6.1.2'
gem 'premailer-rails', '~> 1.11', '>= 1.11.1'

gem 'devise', '~> 4.7', '>= 4.7.3'
gem 'devise_masquerade', '~> 1.2'
gem 'friendly_id', '~> 5.4', '>= 5.4.1'
gem 'name_of_person', '~> 1.1', '>= 1.1.1'


gem 'redis', '~> 4.2', '>= 4.2.5'

gem 'activerecord-postgis-adapter'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'letter_opener', '~> 1.7'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
