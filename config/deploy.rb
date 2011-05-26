set :stages, %w(production staging)
set :default_stage, "staging"
require 'capistrano/ext/multistage'
require 'capistrano/deployflow'


set :application, "deployflow-test"
set :repository,  "git@github.com:nmeans/deployflow-test.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "your web-server here"                          # Your HTTP server, Apache/etc
role :app, "your app-server here"                          # This may be the same as your `Web` server
role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
role :db,  "your slave db-server here"

namespace :deploy do
  task :update_code do
    abort "Don't actually do anything. We're just testing!\nBut if we were, #{branch} would've been deployed."
  end
end

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
