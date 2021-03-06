source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.0'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.4.4'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5'
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
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  #RSpec(Railsのテストコードを書くために用いられるGem)
  gem 'rspec-rails', '~> 4.0.0'
  #FactoryBot(インスタンスをまとめることができるGem)
  gem 'factory_bot_rails'
  #Faker(ランダムな値を生成するGem)
  gem 'faker'
  #Gimei(日本人の名前や、日本の住所をランダムに生成するGem)
  gem 'gimei'
  # Capistranoを利用するためのGem
  gem 'capistrano'
  gem 'capistrano-rbenv'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano3-unicorn'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rubocop', require: false
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

#:productionは本番環境のみで使用される
group :production do
  #静的アセットファイルやログの保存先をHeroku用に微調整してくれるGem
  gem 'rails_12factor'
  # 全世界に公開されるサーバ上で良く利用されるアプリケーションサーバー
  gem 'unicorn', '5.4.1'
end

#ユーザー管理機能を簡単に実装するためのGem
gem 'devise'

#デバッグ補助(binding.pryが使えるようになる)のgem
gem 'pry-rails'

#ImageMagickをRailsから使うためのGem
gem 'mini_magick'
#画像のサイズを調整するGem
gem 'image_processing', '~> 1.2'

#データベースへ保存せずにデータを取り扱うことができるGem
gem 'active_hash'

#クレジット決済機能を導入できるAPI
gem 'payjp'

#AmazonS3
gem "aws-sdk-s3", require: false

# rails-i18nに記述してある日本語を使えるようになる
gem 'rails-i18n'

# シンプルな検索フォームと高度な検索フォームの作成を可能にするgemです。
gem 'ransack'