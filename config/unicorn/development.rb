listen 8081
worker_processes 2
timeout 30

preload_app true

pid 'tmp/pids/unicorn.pid'
stdout_path 'log/unicorn_stdout.log'
stderr_path 'log/unicorn_stderr.log'

# 以下、再起動に失敗することを避ける（これしか方法はないのだろうか……）
# https://github.com/corselia/suikoden-election-2019/issues/58
before_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!

  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # do something...
    end
  end
end

before_exec do |server|
  ENV['BUNDLE_GEMFILE'] = "#{ENV['APP_PATH']}/current/Gemfile"
end

old_pid = "#{server.config[:pid]}.oldbin"
if old_pid != server.pid
  begin  #     sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
    Process.kill(sig, File.read(old_pid).to_i)
  rescue Errno::ENOENT, Errno::ESRCH
  end
end