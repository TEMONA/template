# Gemfile
repo_url = 'https://raw.githubusercontent.com/otukutun/rails-template/master'

# 認証・権限関連
if yes?('use devise ?')
  gem 'devise'
  gem 'devise-i18n'
  gem 'devise_invitable'
  gem 'pundit'
  generate 'devise:install'
  model_name = ask("What would you like the user model to be called? [admin_user]")
  model_name = "admin_user" if model_name.blank?
  generate "devise", model_name
  rake 'db:migrate'
end

if yes?('use sorcery ?')
  gem 'sorcery'
  generate 'sorcery:install'
  rake 'db:migrate'
end

# DB関連
gem 'pg'                  # postgresql用ドライバ
gem 'paranoia'            # 論理削除
gem 'activerecord-import' # bulkインサート
gem 'redis'
gem 'redis-namespace'

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
gem 'coffee-rails', '~> 4.1.0'
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

# 設定関連
# gem 'rails_config'
gem 'figaro', '>= 1.0.0.rc1'

gem 'carrierwave'
gem 'fog'

gem 'versionist' # api versioning

# モデルヘルパー
gem 'draper'
gem 'kaminari' # pagination

# grape
if yes?('use grape ?')
  gem 'grape'
  gem 'grape-jbuilder'
  gem 'grape-rails-routes'
end

gem_group :development do

  # 開発を効率化する関連
  gem 'guard-livereload', require: false # ソースを修正するとブラウザが自動でロードされ、画面を作るときに便利
  gem 'guard-bundler'      # bundlerの自動化
  gem 'guard-rails'        # railsの自動化
  gem 'guard-rspec'        # rspecの自動化
  gem 'html2haml'          # 
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

end

gem_group :development, :test do
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

# rspec initalize setting
run 'bundle install'
run 'rm -rf test'
generate 'rspec:install'

# rm unused files
run "rm README.rdoc"

# .gitignore
remove_file '.gitignore'
#get "#{repo_url}/gitignore", '.gitignore'

# .pryrc
#get "#{repo_url}/pryrc", '.pryrc'

# git initalize setting
after_bundle do
  git :init
  git add: '.'
  git commit: %Q{ -m 'Initial commit' }
end