set :dns_name, "192.168.235.140"

set :application, "irails"
set :repository,  "git@github.com:fadeev2010/irails.git"

role :web, dns_name                          # Your HTTP server, Apache/etc
role :app, dns_name                          # This may be the same as your `Web` server
role :db,  dns_name, primary: true           # This is where Rails migrations will run

set :deploy_to, "/data/#{application}"

set :rails_env, 'staging'
set :branch, 'master'
set :use_sudo, false

set :user, 'ninja'
#set :password, 'ssh_password'
set :port, 22