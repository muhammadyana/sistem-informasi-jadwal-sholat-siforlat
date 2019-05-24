# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :application,       "siforlat"
set :repo_url,          "git@github.com:muhammadyana/sistem-informasi-jadwal-sholat-siforlat.git"
set :rvm_ruby_version,  '2.4.1'
set :puma_threads,      [1, 16]
set :puma_workers,      1
set :linked_files,      %w{.env config/master.key config/database.yml}
set :linked_dirs,       %w{log tmp/cache tmp/sockets tmp/export tmp/pids public/assets public/uploads}
set :delayed_job_workers, 1

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart
  
  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      before 'deploy:restart', 'puma:start'
      invoke 'deploy'
    end
  end
end

# whenever cron setting
# set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }
SSHKit.config.command_map[:rake] = 'bundle exec rake'
SSHKit.config.command_map[:runner] = 'bundle exec rails runner'

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
