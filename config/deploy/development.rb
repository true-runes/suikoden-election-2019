set :stage, :development
set :branch, :development
server 'gss2019_development', roles: %w(web app db)
set :deploy_to, '/home/gss2019_development/app'

set :rails_env, 'development'
set :bundle_without, %w(test production).join(' ')
set :unicorn_pid, "#{shared_path}/tmp/pids/unicorn.pid"
set :unicorn_config_path, "#{release_path}/config/unicorn/development.rb"
