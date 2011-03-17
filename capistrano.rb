if yes?("Setup Capistrano?", :yellow)
  gem "capistrano",         :group => :development
  gem "capistrano-ext",     :group => :development

  run 'gem install capistrano --no-rdoc --no-ri' unless Gem.available?("capistrano")
  run 'gem install capistrano-ext --no-rdoc --no-ri' unless Gem.available?("capistrano-ext")

  capify!

  # TODO specific configuration
end