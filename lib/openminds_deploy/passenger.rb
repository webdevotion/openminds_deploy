configuration = Capistrano::Configuration.respond_to?(:instance) ? Capistrano::Configuration.instance(:must_exist) : Capistrano.configuration(:must_exist)

configuration.load do
  namespace :passenger do
    desc 'Restart the web server'
    task :restart, :roles => :app do
      run "touch  #{deploy_to}/current/tmp/restart.txt"
    end

    [:start, :stop].each do |t|
      desc "#{t} task is a no-op with passenger"
      task t, :roles => :app do ; end
    end
  end

  namespace :deploy do
    desc 'Restart your application'
    task :restart do
      passenger::restart
    end

    desc 'Start your application'
    task :start do
      passenger::restart
    end

    desc 'Stop your application'
    task :stop do
      passenger::stop
    end
  end
end
