listen 8080
worker_processes 2
timeout 30

preload_app true

pid 'tmp/pids/unicorn.pid'
stdout_path 'log/unicorn_stdout.log'
stderr_path 'log/unicorn_stderr.log'
