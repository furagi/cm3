root = File.expand_path(File.expand_path(File.dirname(__FILE__)) + "/../")
working_directory root

pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn.stderr.log"
stdout_path "#{root}/log/unicorn.stdout.log"

timeout 30

if %w(production production_tube).include?(ENV['RAILS_ENV'])
  worker_processes 8
  listen '0.0.0.0:3001'
else
  worker_processes 1
  listen 3001
end

preload_app true

before_exec do |server|
  ENV['BUNDLE_GEMFILE'] = "#{root}/Gemfile"
end

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end
