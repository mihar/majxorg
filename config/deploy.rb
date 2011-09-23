require 'bundler/capistrano'

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
    run "ln -s #{shared_path}/db/GeoLiteCity.dat #{current_path}/db/GeoLiteCity.dat"
  end
  task :link_db do
    run "ln -s #{shared_path}/config/database.yml #{current_path}/config/database.yml"
  end
  task :link_config do
    run "ln -s #{shared_path}/config/services.yml #{current_path}/config/services.yml"
  end
end

# Link Geo DB.
after "deploy:update", "deploy:link_geodb"
# Link DB.
after "deploy:update", "deploy:link_db"
# Link config.
after "deploy:update", "deploy:link_config"

require 'config/boot'

load 'deploy/assets'

# Whenever
require 'whenever/capistrano'