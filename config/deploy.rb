# config valid for current version and patch releases of Capistrano
#lock "~> 3.16.0"

set :application, "sendrid"
set :repo_url, "git@github.com:WiltonFerreira/Sendgrid.git"

set :passenger_restart_with_touch, true

#mantem 2 versoes, em caso de rollback
set :keep_releases, 2
#somente as diferenças
set :deploy_via, :remote_cache
#Capistrano-rails
set :migration_role, :app

set :rvm_ruby_version, '2.6.6'
set :bundle_without, %w{production test}.join(' ')      # this is default

set :pty, true


namespace :deploy do
    after :restart, :clear_cache do
      on roles(:web), in: :groups, limit: 3, wait: 10 do
        # Here we can do anything such as:
        # within release_path do
        #   execute :rake, 'cache:clear'
        # end
      end
    end
end
