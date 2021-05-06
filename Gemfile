# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

# slim導入
gem 'html2slim'
gem 'slim-rails'

# Bootstrap4の導入
gem 'bootstrap', '~> 4.4.1'
gem 'jquery-rails'

gem 'devise'
gem 'devise-bootstrap-views'
gem 'devise-i18n'
gem 'devise-i18n-views'
gem 'rails-i18n', '~> 6.0'

# Debugger
gem 'pry-byebug'
gem 'pry-rails'

# ページネーション
gem 'kaminari'

# 検索機能
gem 'ransack'

# 画像アップロード
gem 'carrierwave'
gem 'mini_magick'

# 速度解析
gem 'rack-mini-profiler', require: false

# コードチェック
gem 'rubocop', '~> 0.79.0', require: false
gem 'rubocop-rails'

gem 'jquery-turbolinks'

# Googleアナリティクス
gem 'google-analytics-rails'

# SEO対策
gem 'sitemap_generator'
gem 'meta-tags'

# パンくずリスト
gem 'gretel'

gem 'annotate'

# cron用
gem 'whenever', require: false

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.1'

# Use qlite3 as the database for Active Record
# gem 'sqlite3', '~> 1.4'
gem 'mysql2'

# Use Puma as the app server
gem 'puma', '~> 4.3'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'bcrypt_pbkdf'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capistrano-bundler'
  gem 'ed25519'
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'spring-commands-rspec'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

group :production, :staging do
  gem 'unicorn'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'tzinfo-data'
