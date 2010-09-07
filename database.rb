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

unless Gem.available?("pg")
  run "gem install #{gem_for_database} --no-rdoc --no-ri"
else
  say("Found #{gem_for_database}, skipping installation", Thor::Shell::Color::CYAN)
end

# TODO: mongoid support
# TODO: DataMapper support