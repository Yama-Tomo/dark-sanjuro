# -*- coding: utf-8 -*-

app_path = "/usr/local/products/dark_sanjuro/current"

# ワーカーの数
if ENV['RAILS_ENV'] == "production"
  worker_processes 1
end

listen '/tmp/dark_sanjuro_unicorn.sock'
pid    "#{app_path}/tmp/pids/unicorn.pid"

# ログ
stderr_path File.expand_path('log/unicorn.stderr.log', ENV['RAILS_ROOT'])
stdout_path File.expand_path('log/unicorn.stdout.log', ENV['RAILS_ROOT'])

preload_app true

before_fork do |server, worker|
 defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!

 old_pid = "#{ server.config[:pid] }.oldbin"
 unless old_pid == server.pid
  begin
   Process.kill :QUIT, File.read(old_pid).to_i
   rescue Errno::ENOENT, Errno::ESRCH
  end
 end
end

after_fork do |server, worker|
 defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end
