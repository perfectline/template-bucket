file ".gitingore", <<-FILE
*.DS_Store
.idea/*
log/*
tmp/*
db/schema.rb
db/*.sqlite3
public/system
coverage/*
rerun.txt
!.gitkeep
FILE

git :init
git :add => "."
git :commit => "-a -m '- initial commit'"

if remote = ask("Enter the url for git remote:")
  git :remote, "add origin #{remote}"
end