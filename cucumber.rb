gem 'cucumber'
gem 'cucumber-rails'

if yes?("Use Capybara?")
  gem 'capybara'
  gem 'capybara-rails'

  @use_capybara = true
else
  gem 'webrat'

  @use_webrat = true
end

arguments = returning [] do |arguments|
  arguments << "-- rspec"     if @use_rspec
  arguments << "-- webrat"    if @use_webrat
  arguments << "-- capybara"  if @use_capybara
end

generate "cucumber #{arguments.join(" ")}"