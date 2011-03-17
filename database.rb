create_file "config/database.yml", :force => true do
"setup: &setup
  adapter: #{options[:database]}
  encoding: utf8
  host: localhost
  pool: 5

development:
  <<: *setup
  database: #{options[:database] =~ /sqlite3/ ? "db/development.sqlite3" : "#{app_name}_development"}

test:
  <<: *setup
  database: #{options[:database] =~ /sqlite3/ ? "db/test.sqlite3" : "#{app_name}_test"}

staging:
  <<: *setup
  database: #{options[:database] =~ /sqlite3/ ? "db/staging.sqlite3" : "#{app_name}_staging"}

production:
  <<: *setup
  database: #{options[:database] =~ /sqlite3/ ? "db/production.sqlite3" : "#{app_name}_production"}

cucumber:
  <<: *test"
end

unless Gem.available?(gem_for_database)
  run "gem install #{gem_for_database} --no-rdoc --no-ri"
else
  say("Found #{gem_for_database}, skipping installation", :cyan)
end

if options[:database] =~ /postgresql/
  if yes?('Install silent-postgres gem?', :yellow)
    gem 'silent-postgres', :group => :delevelopment
  end
end

inject_into_file "config/application.rb", :after => "config.generators do |generator|\n" do
  (" " * 6) + "generator.orm :active_record\n"
end

# TODO: mongoid support
# TODO: DataMapper support