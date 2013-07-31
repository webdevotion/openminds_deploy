module Capistrano
  Configuration.instance(true).load do
    set :scm, :svn
    set :scm_password, Proc.new {CLI.password_prompt 'SVN Password: '}
  end if Capistrano.const_defined? :Configuration and Capistrano::Configuration.methods.map(&:to_sym).include? :instance
end
