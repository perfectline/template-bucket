if yes?("Setup Capistrano?", Thor::Shell::Color::YELLOW)
  gem "capistrano",         :group => :development
  gem "capistrano-ext",     :group => :development
  gem "capistrano_colors",  :group => :development

  unless Gem.available?("capistrano")
    run 'gem install capistrano --no-rdoc --no-ri'
    run 'gem install capistrano-ext --no-rdoc --no-ri'
    run 'gem install capistrano_colors --no-rdoc --no-ri'
  end

  capify!

  # TODO specific configuration
end