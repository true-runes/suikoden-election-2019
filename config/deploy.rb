lock '~> 3.11.0'

set :application, 'suikoden_election_2019'
# GITHUB_ACCESS_TOKEN は direnv などで設定する
set :repo_url, "https://#{ENV.fetch('GITHUB_ACCESS_TOKEN')}@github.com/corselia/suikoden-election-2019.git"
set :rbenv_ruby, '2.6.3'

set :linked_dirs, %w(log tmp/cache tmp/pids tmp/sockets bundle)
set :linked_files, ['config/master.key', '.env', 'config/google_drive_api.json']

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:stop'
    invoke 'unicorn:legacy_restart'
  end
end