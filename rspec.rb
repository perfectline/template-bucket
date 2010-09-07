if yes?("Use RSpec testing framework?", Thor::Shell::Color::YELLOW)

  gem 'rspec',        '>= 2.0.0.beta.20', :group => :test
  gem 'rspec-rails',  '>= 2.0.0.beta.20', :group => :test

  # TODO: needs to install the gem
  #generate "rspec:install"

  if yes?("Use Factory Girl instead of fixtures?", Thor::Shell::Color::YELLOW)
    #gem 'factory_girl'
  end

  if yes?("Use Mocha for mocking/stubbing?", Thor::Shell::Color::YELLOW)
    #gem 'mocha'
  end

  if yes?("Use Shoulda macros?", Thor::Shell::Color::YELLOW)
    #gem 'shoulda'
  end
end
