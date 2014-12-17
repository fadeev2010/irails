set :default_environment, {
'PATH' => "/usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH"
}

set :rbenv_ruby_version, '2.1.5'

set :dns_name, "127.0.0.1"

set :application, "irails"
set :repository,  "git@github.com:fadeev2010/irails.git"

role :web, dns_name                          # Your HTTP server, Apache/etc
role :app, dns_name                          # This may be the same as your `Web` server
role :db,  dns_name, primary: true           # This is where Rails migrations will run

set :deploy_to, "/data/#{application}"

set :rails_env, 'staging'
set :branch, 'deploy_to_vagrant'
set :use_sudo, false

set :user, 'irails'
set :password, 'Droid123'
set :port, 2222