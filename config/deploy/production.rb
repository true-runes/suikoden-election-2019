set :stage, :production
set :branch, :master
server 'gss2019_production', roles: %w(web app db)
set :deploy_to, '/home/gss2019_production/app'

set :rails_env, 'production'
set :bundle_without, %w(test development).join(' ')
set :unicorn_pid, "#{shared_path}/tmp/pids/unicorn.pid"
set :unicorn_config_path, "#{release_path}/config/unicorn/production.rb"
