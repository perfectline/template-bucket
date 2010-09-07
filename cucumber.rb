if yes?("Use Cucumber behavior testing?", Thor::Shell::Color::YELLOW)

  gem 'database_cleaner', :group => :test
  gem 'cucumber',         :group => :test
  gem 'cucumber-rails',   :group => :test
  gem 'launchy',          :group => :test

  if yes?("Use Capybara instead of Webrat?", Thor::Shell::Color::YELLOW)
    gem 'capybara',       :group => :Test

    @use_capybara = true
  else
    gem 'webrat', :group => :test
  end

  unless Gem.available?("cucumber-rails")
    run 'gem install cucumber --no-rdoc --no-ri'
    run 'gem install cucumber-rails --no-rdoc --no-ri'
  else
    say("Found cucumber, skipping installation", Thor::Shell::Color::CYAN)
    say("Found cucumber-rails, skipping installation", Thor::Shell::Color::CYAN)
  end

  unless Gem.available?("database_cleaner")
    run 'gem install database_cleaner --no-rdoc --no-ri'
  else
    say("Found database_cleaner, skipping installation", Thor::Shell::Color::CYAN)
  end

  unless Gem.available?("launchy")
    run 'gem install launchy --no-rdoc --no-ri'
  else
    say("Found launchy gem, skipping installation", Thor::Shell::Color::CYAN)
  end

  if @use_capybara
    unless Gem.available?("capybara")
      run 'gem install capybara --no-rdoc --no-ri'
    else
      say("Found capybara gem, skipping installation", Thor::Shell::Color::CYAN)
    end
  else
    unless Gem.available?("webrat")
      run 'gem install webrat --no-rdoc --no-ri'
    else
      say("Found webrat gem, skipping installation", Thor::Shell::Color::CYAN)
    end
  end

  arguments = [].tap do |arguments|
    arguments << "--webrat"    if @use_capybara.nil?
    arguments << "--capybara"  if @use_capybara.present?
    arguments << "--rspec"     if yes?("Use RSpec with Cucumber?", Thor::Shell::Color::YELLOW)
  end

  generate "cucumber #{arguments.join(" ")}"

end