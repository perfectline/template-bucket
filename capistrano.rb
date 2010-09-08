if yes?("Setup Capistrano?", :yellow)
  gem "capistrano",         :group => :development
  gem "capistrano-ext",     :group => :development

  unless Gem.available?("capistrano")
    run 'gem install capistrano --no-rdoc --no-ri'
    run 'gem install capistrano-ext --no-rdoc --no-ri'
  end

  capify!

  # TODO specific configuration
end