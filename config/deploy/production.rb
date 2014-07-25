# -*- coding: utf-8 -*-
set :application, "Dark sanjuro - Production"

set :rails_env,        "production"
set :unicorn_rack_env, "production"
set :unicorn_user,     "unicorn"

set :bundle_flags, "--no-deployment --without test development --without development"

################### SSH ###################
set :use_sudo,       true
set :user,          'john'
set :user_group,    'john'
set :password,      'zaq12wsx'
ssh_options[:keys]  = %w(~/.ssh/john_id_rsa)

################### application user ###################
set :app_user,         'unicorn'
set :app_user_group,   'unicorn'

################### role ###################
server "10.218.240.227", :app, :web, :db, :primary => true

