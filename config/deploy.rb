# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :application, 		"siforlat"
set :repo_url, 				"git@github.com:muhammadyana/sistem-informasi-jadwal-sholat-siforlat.git"

set :user,            "rails"

set :puma_env, 'production'
set :puma_threads, [1, 16]
set :puma_workers, 1

set :rvm_ruby_version, '2.4.1'

set :stage,           		:production
set :deploy_via,      		:remote_cache
set :deploy_to,      		 "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
set :puma_bind,       		"unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_state,      		"#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        		"#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, 		"#{release_path}/log/puma.error.log"
set :puma_error_log,  		"#{release_path}/log/puma.access.log"
set :ssh_options,     		{ forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub) }
set :puma_preload_app, 		true
set :puma_worker_timeout, nil
set :keep_releases, 5

set :linked_files, %w{.env}
set :linked_dirs, %w{log tmp/cache tmp/sockets tmp/pids public/assets public/uploads }



# whenever cron setting
# set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }

SSHKit.config.command_map[:rake] = 'bundle exec rake'
SSHKit.config.command_map[:runner] = 'bundle exec rails runner'

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  # desc "Load database with seed data"
  # task :seed do
  #   run "cd #{deploy_to}/current; /usr/bin/env bundle exec rake db:seed RAILS_ENV=#{rails_env}"
  # end

  # after :restart, :clear_cache do
  #   on roles(:web), in: :groups, limit: 3, wait: 10 do
  #     invoke 'delayed_job:restart'
  #     # Here we can do anything such as:
  #     # within release_path do
  #     #   execute :rake, 'cache:clear'
  #     # end
  #   end
  # end

  # after 'deploy:publishing', 'deploy:restart'
  # namespace :deploy do
  #   task :restart do
  #     invoke 'delayed_job:restart'
  #   end
  # end

  after :publishing, :restart

  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      before 'deploy:restart', 'puma:start'
      invoke 'deploy'
    end
  end

#   desc 'Restart application'
#   task :restart do
#     on roles(:app), in: :sequence, wait: 5 do
#       invoke 'puma:restart'
#     end
#   end

#   before :starting,     :check_revision
#   after  :finishing,    :compile_assets
#   after  :finishing,    :cleanup
#   after  :finishing,    :restart
end

# ps aux | grep puma    # Get puma pid
# kill -s SIGUSR2 pid   # Restart puma
# kill -s SIGTERM pid   # Stop puma

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
