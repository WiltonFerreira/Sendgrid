# config valid for current version and patch releases of Capistrano
lock "~> 3.16.0"

set :application, "sendrid"
set :repo_url, "git@github.com:WiltonFerreira/Sendgrid.git"

#mantem 2 versoes, em caso de rollback
set :keep_releases, 2
#somente as diferenças
set :deploy_via, :remote_cache
#Capistrano-rails
set :migration_role, :app

append :linked_files, "config/database.yml", "config/storage.yml", "config/master.key"
set :pty, true


