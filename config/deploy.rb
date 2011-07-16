set :user, 'lee'
set :domain, 'highfivetuesdays.com'
set :application, "highfives"

#File Paths
set :repository,  "#{user}@#{domain}:~/git/#{application}.git"
set :deploy_to, "/home/#{user}/web/#{application}"
set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, domain                          # Your HTTP server, Apache/etc
role :app, domain                          # This may be the same as your `Web` server
role :db,  domain, :primary => true # This is where Rails migrations will run

#Misc Options
set :deploy_via, :remote_cache
set :scm, 'git'
set :branch, 'master'
set :scm_verbose, true
set :use_sudo, true

namespace :deploy do
  task :restart do
    run "service thin restart"
  end

  task :seed do
    run "cd #{current_path}; rake db:seed RAILS_ENV=production"
  end
end

#optional task reconfigure databases
after "deploy:update_code", :bundle_install
desc "install the necessary prerequisites"
task :bundle_install, :roles => :app do
  run "cd #{release_path}; echo 'you need to bundle install'"
end

