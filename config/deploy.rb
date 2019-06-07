lock '~> 3.11.0'

set :application, 'suikoden_election_2019'
set :repo_url, 'https://github.com/corselia/suikoden-election-2019.git'
set :rbenv_ruby, '2.6.3'

set :linked_dirs, %w(log tmp/cache tmp/pids tmp/sockets bundle)
set :linked_files, ['config/master.key', '.env', 'config/google_drive_api.json']

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end
