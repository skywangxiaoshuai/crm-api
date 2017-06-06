require 'mina/rails'
require 'mina/git'
require 'mina/bundler'
require 'mina/rvm'

task :staging do
  set :user, 'crm'
  set :domain, '192.168.0.19'
  set :rails_env, 'staging'
end

task :production do
  set :user, 'crm'
  set :domain, '192.168.0.7'
  set :rails_env, 'production'
end

# 开发环境 部署时的服务器和用户
# set :user, 'crm'
# set :domain, '192.168.0.19'

# 测试环境 部署时的服务器和用户
# set :user, 'geyiwu'
# set :domain, '192.168.0.2'

# 生产环境部署时的服务器和用户
# set :user, 'crm'
# set :domain, '192.168.0.7'

set :application_name, 'crm-api'
set :deploy_to, '/var/www/crm-api'
set :repository, 'git@gitlab.witspool.com:CRM/crm-api.git'
set :branch, 'master'
set :rvm_path, '/usr/local/rvm/bin/rvm'
set :shared_paths, ['config/database.yml', 'log', 'public/system']

# set :forward_agent, true
task :environment do
  command %{rvm use ruby-2.3.1}
end
task :setup => :environment do
  command %(mkdir -p "#{fetch(:deploy_to)}/shared/pids/")
  command %(mkdir -p "#{fetch(:deploy_to)}/shared/log/")
  # 创建shared_path中的文件
  command %[mkdir -p "#{fetch(:deploy_to)}/shared/log"]
  command %[chmod g+rx,u+rwx "#{fetch(:deploy_to)}/shared/log"]
  command %[mkdir -p "#{fetch(:deploy_to)}/shared/config"]
  command %[chmod g+rx,u+rwx "#{fetch(:deploy_to)}/shared/config"]
  # 创建puma所需要的文件夹及文件
  command %[mkdir -p "#{fetch(:deploy_to)}/shared/tmp"]
  command %[chmod g+rx,u+rwx "#{fetch(:deploy_to)}/shared/tmp"]
  command %[mkdir -p "#{fetch(:deploy_to)}/shared/tmp/sockets"]
  command %[chmod g+rx,u+rwx "#{fetch(:deploy_to)}/shared/tmp/sockets"]
  command %[mkdir -p "#{fetch(:deploy_to)}/shared/tmp/pids"]
  command %[chmod g+rx,u+rwx "#{fetch(:deploy_to)}/shared/tmp/pids"]
  command %[mkdir -p "#{fetch(:deploy_to)}/shared/tmp/log"]
  command %[chmod g+rx,u+rwx "#{fetch(:deploy_to)}/shared/tmp/log"]
  command %[touch "#{fetch(:deploy_to)}/shared/config/database.yml"]
  command %[echo "-----> Be sure to edit '#{fetch(:deploy_to)}/shared/config/database.yml'."]

  # 取消挂载的图片服务器
  command %[sudo umount /var/www/crm-api/current/public/system]


end

desc "Deploys the current version to the server."
task :deploy => :environment do  #执行 mina deploy 命令时执行的任务
  # uncomment this line to make sure you pushed your local branch to the remote origin
  # invoke :'git:ensure_pushed'
  deploy do
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    # invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup' #删除部署过程中产生的临时文件
    # invoke :'mount:start' #部署过程中自动挂载文件服务器
    on :launch do
      in_path(fetch(:current_path)) do
        command %{mkdir -p tmp/}
        command %{touch tmp/restart.txt}
        # invoke :'sidekiq:restart'
        invoke :'mkdir:system'
        invoke :'mount:start' #部署过程中自动挂载文件服务器
        invoke :'puma:stop'
        invoke :'puma:start'
      end
    end
  end
end

namespace :mkdir do
  task :system do
    command %{mkdir #{fetch(:deploy_to)}/current/public/system}
  end
end

namespace :puma do  # 启动puma的相关命令 mina puma:start|stop, 停止和开始可以正常使用，重启暂不可用，重启脚本写的有点儿问题
  # desc "Start the application"
  task :start do
    command %{cd #{fetch(:deploy_to)}/current && bin/puma.sh start}
  end

  task :stop do
    command %{cd #{fetch(:deploy_to)}/current && bin/puma.sh stop}
  end

  task :restart do
    command %{cd #{fetch(:deploy_to)}/current && bin/puma.sh restart}
  end
end

namespace :db do
  desc "Seed data to the database"
  task :seed => :environment do
    command %{cd "#{fetch(:deploy_to)}/current"}
    command %{bundle exec rails db:seed}
  end
end

namespace :mount do
  task :start do
    #staging环境下挂载的图片目录
    # command %{sudo mount -t nfs 192.168.0.9:/var/www/development/public/system /var/www/crm-api/current/public/system}

    #production环境下挂载的图片目录
    command %{sudo mount -t nfs 192.168.0.9:/var/www/crm-api/public/system /var/www/crm-api/current/public/system}
  end
end
# For help in making your deploy script, see the Mina documentation:
#
#  - https://github.com/mina-deploy/mina/tree/master/docs
