configuration = Capistrano::Configuration.respond_to?(:instance) ? Capistrano::Configuration.instance(:must_exist) : Capistrano.configuration(:must_exist)

configuration.load do
  # Lighttpd stuff
  namespace :lighttpd do
    desc 'Restart the web server'
    task :restart, :roles => :app do
      run 'lighty restart'
    end

    desc 'Stop the web server'
    task :stop, :roles => :app do
      run 'lighty stop'
    end

    desc 'Start the web server'
    task :start, :roles => :app do
      run 'lighty start'
    end
  end

  # Standard deploy actions overwritten
  namespace :deploy do
    desc 'Restart your application'
    task :restart do
      lighttpd::restart
    end

    desc 'Start your application'
    task :start do
      lighttpd::start
    end

    desc 'Stop your application'
    task :stop do
      lighttpd::stop
    end
  end
end
