module Capistrano
  Configuration.instance(true).load do
    set :scm, :git
    set :git_enable_submodules, 1
  end if Capistrano.const_defined? :Configuration and Capistrano::Configuration.methods.map(&:to_sym).include? :instance
end