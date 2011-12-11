require 'bundler/capistrano'
load 'deploy/assets'

default_run_options[:pty] = true  # Must be set for the password prompt from git to work
ssh_options[:compression] = false

set :application, "majx.org"
set :repository,  "git@github.com:mihar/majxorg.git"
set :scm, :git
set :scm_verbose, true
set :deploy_via, :remote_cache
set :whenever_command, "bundle exec whenever"
set :deploy_to, "/webroot/majxorg"
set :branch, "master"
set :use_sudo, false
set :user, "deploy"
set :rails_env, "production"
server "racker-deploy", :app, :web, :db, :primary => true

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
  task :link_geodb do
    run "ln -s #{shared_path}/db/GeoLiteCity.dat #{latest_release}/db/GeoLiteCity.dat"
  end
  task :link_db do
    run "ln -s #{shared_path}/config/database.yml #{latest_release}/config/database.yml"
  end
  task :link_config do
    run "ln -s #{shared_path}/config/services.yml #{latest_release}/config/services.yml"
  end
  task :link_rvmrc do
    run "ln -s #{shared_path}/rvmrc #{latest_release}/.rvmrc"
    run "ln -s #{shared_path}/config/setup_load_paths.rb #{latest_release}/config/setup_load_paths.rb"
  end
end

# Link Geo DB.
before "deploy:assets:precompile", "deploy:link_geodb"
# Link DB.
before "deploy:assets:precompile", "deploy:link_db"
# Link config.
before "deploy:assets:precompile", "deploy:link_config"
# Link rvm.
before "deploy:assets:precompile", "deploy:link_rvmrc"

require 'config/boot'

# Whenever
require 'whenever/capistrano'