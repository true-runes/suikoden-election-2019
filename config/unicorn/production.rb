listen 8080
worker_processes 2
timeout 30

preload_app true

pid 'tmp/pids/unicorn.pid'
stdout_path 'log/unicorn_stdout.log'
stderr_path 'log/unicorn_stderr.log'

# 再起動に失敗することを避ける（これしか方法はないのだろうか……）
# https://github.com/corselia/suikoden-election-2019/issues/58
before_exec do |server|
  ENV['BUNDLE_GEMFILE'] = "#{ENV['APP_PATH']}/current/Gemfile"
end
