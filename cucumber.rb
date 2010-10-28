if yes?("Use Cucumber behavior testing?", :yellow)

  gem 'database_cleaner', :group => :test
  gem 'cucumber',         :group => :test
  gem 'cucumber-rails',   :group => :test
  gem 'launchy',          :group => :test

  if yes?("Use Capybara instead of Webrat?", :yellow)
    gem 'capybara', :group => :test

    @use_capybara = true
  else
    gem 'webrat', :group => :test
  end

  install_if_unavailable("cucumber")
  install_if_unavailable("cucumber-rails")
  install_if_unavailable("database_cleaner")
  install_if_unavailable("launchy")

  @use_capybara ? install_if_unavailable("capybara") : install_if_unavailable("webrat")

  arguments = [].tap do |arguments|
    arguments << "--webrat"    if @use_capybara.nil?
    arguments << "--capybara"  if @use_capybara.present?
    arguments << "--rspec"     if yes?("Use with rspec?", :yellow)
  end

  generate "cucumber:install #{arguments.join(" ")}"

  get "#{File.dirname(__FILE__)}/resources/cucumber.yml", "config/cucumber.yml", :force => true

end