if yes?("Setup Capistrano?", :yellow)
  gem "capistrano",         :group => :development
  gem "capistrano-ext",     :group => :development

  install_if_unavailable("capistrano")
  install_if_unavailable("capistrano-ext")

  capify!

  # TODO specific configuration
end