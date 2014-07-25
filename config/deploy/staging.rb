# -*- coding: utf-8 -*-
set :application, "Dark sanjuro - Staging"

set :rails_env,        "staging"
set :unicorn_rack_env, "staging"
set :unicorn_user,     "unicorn"

set :bundle_flags, "--no-deployment --without test development --without development"

################### SSH ###################
set :use_sudo,       true
set :user,          'john'
set :user_group,    'john'
set :password,      'd6DZHBE6ndPe8HN3AaMf3W5NtAWNQSaW'
ssh_options[:keys]  = %w(~/.ssh/john_id_rsa)

################### application user ###################
set :app_user,         'unicorn'
set :app_user_group,   'unicorn'

################### role ###################
server "192.168.56.12:22", :db, :primary => true
server "192.168.56.12:22", :app, :web


