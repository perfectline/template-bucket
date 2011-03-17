if yes?("Create database? (Needs all gems to be installed first)", :yellow)
  run 'bundle install'
  rake "db:create"
end