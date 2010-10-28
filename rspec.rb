if yes?("Install rspec and rspec-rails?", :yellow)

  @use_rspec = true

  remove_file "test/"

  inject_into_file "config/application.rb", :after => "config.generators do |generator|\n" do
    (" " * 6) + "generator.test_framework :rspec, :views => false\n"
  end

  gem 'rspec',        '>= 2.0.0', :group => :test
  gem 'rspec-rails',  '>= 2.0.0', :group => :test
  gem 'database_cleaner',         :group => :test

  install_if_unavailable("rspec", ">= 2.0.0")
  install_if_unavailable("rspec-rails", ">= 2.0.0")
  install_if_unavailable("database_cleaner")

  generate "rspec:install"

  if yes?("Install mocha?", :yellow)
    gem 'mocha', :group => :test

    append_file "spec/spec_helper.rb" do
      "Mocha::Configuration.warn_when(:stubbing_non_existent_method)\n" +
      "Mocha::Configuration.warn_when(:stubbing_non_public_method)"
    end

    gsub_file "spec/spec_helper.rb", /config\.mock_with :rspec/, "config.mock_with :mocha"
  end

  append_file "spec/spec_helper.rb" do
    "\nDatabaseCleaner.strategy = :truncation"
  end

end

if yes?("Install factory_girl?", :yellow)
  gem 'factory_girl', '>= 1.3.2', :group => :test

  inject_into_file "config/application.rb", :after => "config.generators do |generator|\n" do
    (" " * 6) + "generator.fixture_replacement :factory_girl, :dir => '#{@use_rspec ? "spec/factories" : "test/factories"}'\n"
  end
end