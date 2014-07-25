# -*- coding: utf-8 -*-
set :application, "Dark sanjuro"

set :stages, %w(production staging)
set :default_stage, "production"

# 複数環境にデプロイできるようにする
require "capistrano/ext/multistage"
# capistranoの出力をカラーに
require 'capistrano_colors'
# cap deploy時に自動で bundle installを実行
require "bundler/capistrano"
require 'capistrano-unicorn'
require "rvm/capistrano"

################### RVM ###################
# RVMで利用するRubyのバージョンを設定(1.9.3を変更) 
set :rvm_ruby_string, '1.9.3'
# 配布先のサーバのrvmのパスである事に注意
set :rvm_path, '/usr/local/rvm'
set :rvm_bin_path, "#{rvm_path}/bin"
set :rvm_lib_path, "#{rvm_path}/lib"

################### リポジトリ ###################
# gitリポジトリをセット
git_path = File.expand_path __FILE__ << "/../../"
set :repository,  "file://#{git_path}/.git"
set :scm,         :git
set :branch,      "master"
#set :deploy_via, :remote_cache
set :deploy_via,  :copy

################### SSH ###################
set :use_sudo,                true
set :default_run_options,     :pty => true
set :user,                    'root'
set :user_group,              'root'
ssh_options[:keys]          = %w(~/.ssh/id_rsa)
ssh_options[:auth_methods]  = %w(publickey)
ssh_options[:forward_agent] = true
ssh_options[:passphrase]    = ""
ssh_options[:port]          = "22"

################### application user ###################
set :app_user,                'apache'
set :app_user_group,          'apache'

################### デプロイ先設定 ###################
set :deploy_to, "/usr/local/products/dark_sanjuro"
set :normalize_asset_timestamps, false
# 過去のデプロイしたフォルダを履歴として保持する数
set :keep_releases, 5

################### デプロイ先設定 ###################
set :unicorn_config_path, "#{current_path}/config"


# メンテナンスモード
#namespace :maintenance do
#  desc "Maintenance start"
#  task :on, :roles => :web do
#    on_rollback { run "rm #{current_path}/tmp/maintenance.yml" }
#    page = File.read("config/maintenance.yml")
#    put page, "#{current_path}/tmp/maintenance.yml", :mode => 0644
#  end
#
#  desc "Maintenance stop"
#  task :off, :roles => :web do
#    run "rm #{release_path}/tmp/maintenance.yml"
#  end
#end

################### namespace定義 ###################
namespace :assets do
  task :precompile, :roles => :app do
    run "cd #{current_path} && RAILS_ENV=#{rails_env} bundle exec rake assets:precompile"
  end
end

# Unicorn用に起動/停止タスクを変更
namespace :deploy do
  # 実行ユーザー/Groupをセット
  task :set_file_process_owner do
    sudo "chown -R #{app_user}:#{app_user_group} #{deploy_to}"
    sudo "chmod -R g+w #{deploy_to}"
  end
end

################### register callbacks ###################
before :deploy,             "deploy:set_file_process_owner"
before 'deploy:restart',    "deploy:migrate"
after  'deploy:restart',    'unicorn:duplicate'
before 'unicorn:duplicate', "deploy:set_file_process_owner"
after  :deploy,             "deploy:cleanup"


