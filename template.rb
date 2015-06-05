# Gemfile
repo_url = 'https://raw.githubusercontent.com/TEMONA/rails_template/master'

# rm unused files
run "rm README.rdoc"

# アプリ名の取得
@app_name = app_name

remove_file '.gitignore'
get "#{repo_url}/.gitignore", '.gitignore'

# add to Gemfile
run 'echo "" > Gemfile'
append_file 'Gemfile', <<-CODE
source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
# Use sqlite3 as the database for Active Record
#gem 'sqlite3'
# Use SCSS for stylesheets
#gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
#gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
#gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
#gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

# DB関連
gem 'pg'                  # postgresql用ドライバ
gem 'paranoia'            # 論理削除
gem 'activerecord-import' # bulkインサート
gem 'redis'
gem 'redis-namespace'

# 認証関連
gem 'devise'
gem 'devise-i18n'
gem 'devise_invitable'
gem 'pundit'

# フォーム関連
gem 'simple_form', '~> 3.1.0.rc1'
gem 'ransack'

# 画像関連
gem 'carrierwave'
gem 'mini_magick'

# view関連
gem 'bootstrap-sass'
gem 'haml-rails'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'font-awesome-rails'
gem 'lazy_high_charts'

gem 'jquery-rails'
gem 'jquery-turbolinks'
gem 'coffee-rails', '~> 4.1.0'

# 保守・可読性関連
gem "exception_notification"
gem 'enumerize'
gem 'inherited_resources'
gem 'has_scope'
gem 'draper'
gem 'kaminari' # pagination

# 設定関連
# gem 'rails_config'
gem 'figaro', '>= 1.0.0.rc1'
gem 'whenever', require: false


# モデルヘルパー

# API
gem 'grape'
gem 'grape-jbuilder'
gem 'grape-rails-routes'

group :development do
# 開発を効率化する関連
  gem 'guard-livereload', require: false # ソースを修正するとブラウザが自動でロードされ、画面を作るときに便利
  gem 'guard-bundler'      # bundlerの自動化
  gem 'guard-rails'        # railsの自動化
  gem 'guard-rspec'        # rspecの自動化
  gem 'html2slim'          # slimに変換してくれる
  gem 'rails-erd'                        # rake-erdコマンドでActiveRecordからER図を作成できる
  gem 'bullet'                           # n+1問題を発見
  gem 'rack-mini-profiler'               # ボトルネック計測
  gem 'seed_dump'                        # seedファイルをDBから作れる
  gem "xray-rails"

  # 保守性を上げる
  gem 'yard'                             # ドキュメント生成
  gem 'capistrano', '~> 3.0.1'
  gem 'capistrano-bundler'
  gem 'capistrano-rails', '~> 1.1.0'
  gem 'capistrano-rails-console'
  gem 'capistrano-rvm', '~> 0.1.1'
  gem 'capistrano3-unicorn'
  gem 'colorize_unpermitted_parameters'
  gem 'erb2haml'
  gem 'haml2slim'
end

group :development, :test do
  # pry関連(デバッグなど便利)
  gem 'pry-rails'    # rails cの対話式コンソールがirbの代わりにリッチなpryになる
  gem 'pry-doc'      # pry中に show-source [method名] でソース内を読める
  gem 'pry-byebug'   # binding.pryをソースに記載すると、ブレイクポイントとなりデバッグが可能になる
  gem 'pry-stack_explorer' # pry中にスタックを上がったり下がったり行き来できる
  gem 'rubocop', require: false          # コーディング規約の自動チェック

  # 表示整形関連(ログなど見やすくなる)
  gem 'hirb'         # モデルの出力結果を表形式で表示する
  gem 'hirb-unicode' # hirbの日本語などマルチバイト文字の出力時の出力結果がすれる問題に対応
  gem 'rails-flog', require: 'flog' # HashとSQLのログを見やすく整形
  gem 'better_errors'     # 開発中のエラー画面をリッチにする
  gem 'binding_of_caller' # 開発中のエラー画面にさらに変数の値を表示する
  gem 'awesome_print'     # Rubyオブジェクトに色をつけて表示して見やすくなる
  gem 'quiet_assets'      # ログのassetsを表示しないようにし、ログを見やすくしてくれる

  # テスト関連
  gem 'capybara'          # テストフレームワーク
  gem 'launchy'            # capybaraのsave_and_open_pageメソッドの実行時に画面を開いてくれる
  gem "database_cleaner"   # エンドツーエンドテスト時のDBをクリーンにする
  gem 'selenium-webdriver'  # webdriver
  gem 'rspec-rails'        # rspec本体
  gem 'rspec-json_matcher' 
  gem 'webmock'
  gem 'vcr'
  gem 'spring-commands-rspec'  # bin/rspecコマンドを使えるようにし、rspecの起動を早めれる
  gem "shoulda-matchers"   # モデルのテストを簡易にかけるmatcherが使える
  gem "factory_girl_rails" # テストデータ作成
  gem "test-queue"         # テストを並列で実行する
  gem 'faker'              # 本物っぽいテストデータの作成
  gem 'faker-japanese'     # 本物っぽいテストデータの作成（日本語対応）
  gem "simplecov"          # カバレッジ計測
  gem "autodoc"            # rspecと連動してdocを作る
  gem "redcarpet"          # HTML出力する
  gem "json_spec"          # rspecを拡張する
end

CODE

# install gems
run 'bundle install --path vendor/bundle --jobs=4'

# database.yml
remove_file 'config/database.yml'

get "#{repo_url}/database_postgresql.yml", 'config/database.yml'
puts "#{repo_url}/database_postgresql.yml"
gsub_file 'config/database.yml', "template_development", "#{app_name}_development"
gsub_file 'config/database.yml', "template_test", "#{app_name}_test"
gsub_file 'config/database.yml', "template_production", "#{app_name}_production"


# rubocop
get "#{repo_url}/.rubocop.yml", '.rubocop.yml'
get "#{repo_url}/.rubocop_disabled.yml", '.rubocop_disabled.yml'
get "#{repo_url}/.rubocop_enabled.yml", '.rubocop_enabled.yml'

# set config/application.rb
application  do
  %q{
    # Set timezone
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local

    # 日本語化
    I18n.enforce_available_locales = true
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :ja

    # generatorの設定
    config.generators do |g|
      g.orm :active_record
      g.template_engine :slim
      g.test_framework  :rspec, :fixture => true
      g.fixture_replacement :factory_girl, :dir => "spec/factories"
      g.view_specs false
      g.controller_specs true
      g.routing_specs false
      g.helper_specs false
      g.request_specs false
      g.assets false
      g.helper false
    end

    # libファイルの自動読み込み
    config.autoload_paths += %W(#{config.root}/lib)
    config.autoload_paths += Dir["#{config.root}/lib/**/"]
  }
end

# For Bullet (N+1 Problem)
insert_into_file 'config/environments/development.rb',%(
  # Bulletの設定
  config.after_initialize do
    Bullet.enable = true # Bulletプラグインを有効
    Bullet.alert = true # JavaScriptでの通知
    Bullet.bullet_logger = true # log/bullet.logへの出力
    Bullet.console = true # ブラウザのコンソールログに記録
    Bullet.rails_logger = true # Railsログに出力
  end
), after: 'config.assets.debug = true'

# erb => slim
run 'bundle exec erb2slim -d app/views'

# Simple Form
generate 'simple_form:install --bootstrap'

# figaro
generate 'figaro:install'

# Whenever
run 'wheneverize .'

# Capistrano
run 'bundle exec cap install'

# Kaminari config
generate 'kaminari:config'

# database
run 'bundle exec rake RAILS_ENV=development db:create'

# Rspec/Spring/Guard
# ----------------------------------------------------------------
# Rspec
generate 'rspec:install'
run "echo '--color -f d' > .rspec"

insert_into_file 'spec/spec_helper.rb',%(
  config.before :suite do
    DatabaseRewinder.clean_all
  end

  config.after :each do
    DatabaseRewinder.clean
  end

  config.before :all do
    FactoryGirl.reload
    FactoryGirl.factories.clear
    FactoryGirl.sequences.clear
    FactoryGirl.find_definitions
  end

  config.include FactoryGirl::Syntax::Methods

  VCR.configure do |c|
      c.cassette_library_dir = 'spec/vcr'
      c.hook_into :webmock
      c.allow_http_connections_when_no_cassette = true
  end
), after: 'RSpec.configure do |config|'

insert_into_file 'spec/spec_helper.rb', "\nrequire 'factory_girl_rails'", after: "require 'rspec/rails'"
gsub_file 'spec/spec_helper.rb', "require 'rspec/autorun'", ''

run 'bundle install'

# git initalize setting
after_bundle do
  git :init
  git add: '.'
  git commit: %Q{ -m 'Initial commit' }
end