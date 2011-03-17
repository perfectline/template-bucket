if yes?("Create database?", :yellow)
  say("Installing all gems in order to run rake tasks...", :magenta)
  run 'bundle install'
  rake "db:create"
end