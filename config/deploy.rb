require 'capistrano/ext/multistage'
require 'bundler/capistrano'

set :server_type, 'thin'

set :stages, %w(staging production)
set :default_stage, "staging"
set :deploy_via, :remote_cache
set :keep_releases, 5
set :scm, :git

before  'deploy:setup', 'db:create_config'
after   'deploy:setup', 'deploy:first'

before  'deploy:restart', 'thin:create_symlink'
after  'thin:create_symlink', 'db:schema_load'

after   'deploy:finalize_update', 'db:create_symlink'
after   'deploy:create_symlink', 'deploy:cleanup'

#after   'deploy:migrate', 'db:migrate_data'