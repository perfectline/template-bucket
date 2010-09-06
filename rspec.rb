gem 'rspec'
gem 'rspec-rails'

generate "rspec"

if yes?("Use Factory Girl?")
  gem 'factory_girl'
end

if yes?("Use Mocha?")
  gem 'mocha'
end

if yes?("Use Shoulda Macros?")
  gem 'shoulda'
end

@use_rspec = true