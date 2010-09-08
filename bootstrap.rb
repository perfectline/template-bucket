if yes?("Install all gems?", :yellow)
  run 'bundle install'
end

if yes?("Create database?", :yellow)
  rake "db:create"
end