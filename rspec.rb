if yes?("Use RSpec testing framework?", Thor::Shell::Color::YELLOW)

  remove_file "test/"

  gem 'rspec',        '>= 2.0.0.beta.20', :group => :test
  gem 'rspec-rails',  '>= 2.0.0.beta.20', :group => :test

  if yes?("Generate RSpec config?", Thor::Shell::Color::YELLOW)

    unless Gem.available?("rspec", ">= 2.0.0.beta.20")
      run "gem install rspec -v '>= 2.0.0.beta.20' --no-rdoc --no-ri"
      run "gem install rspec-rails -v '>= 2.0.0.beta.20' --no-rdoc --no-ri"
    else
      say("Found rspec gem, skipping installation", Thor::Shell::Color::CYAN)
      say("Found rspec-rails gems, skipping installation", Thor::Shell::Color::CYAN)
    end

    generate "rspec:install"
  end

  if yes?("Use Factory Girl instead of fixtures?", Thor::Shell::Color::YELLOW)
    gem 'factory_girl', '>= 1.3.2', :group => :test
  end

  if yes?("Use Mocha for mocking/stubbing?", Thor::Shell::Color::YELLOW)
    gem 'mocha', :group => :test
  end

  if yes?("Use Shoulda macros?", Thor::Shell::Color::YELLOW)
    gem 'shoulda', :group => :test
  end
end
