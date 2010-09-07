if yes?("Use Git?", Thor::Shell::Color::YELLOW)

  create_file ".gitingore" do
    "*.DS_Store"
    ".idea/*"
    "log/*"
    "tmp/*"
    "db/schema.rb"
    "db/*.sqlite3"
    "public/system"
    "coverage/*"
    "rerun.txt"
    "!.gitkeep"
  end
  
  git :init
  git :add => "."
  git :commit => "-a -m '- initial commit'"

  if yes?("Initialize remote repository?", Thor::Shell::Color::YELLOW)

    say("Choose repository location:", Thor::Shell::Color::YELLOW)
    say("\t[1] http://www.github.com/perfectline")
    say("\t[2] http://svn.perfectline.ee")
    say("\t[3] http://git.code.perfectline.ee")
    say("\t[4] other repository")

    question    = lambda { ask("Enter number:", Thor::Shell::Color::YELLOW) }
    repository  = question.call

    while !(1..4).include?(repository.to_i) do
      say("Incorrect option", Thor::Shell::Color::RED)
      repository = question.call
    end

    case repository.to_i
      when 1
        git :remote => "add origin git@github.com:perfectline/#{app_name}.git"
      when 2
        git :remote => "add origin ssh://svn.perfectline.ee/home/dev/git/#{app_name}.git"
      when 3
        git :remote => "add origin ssh://git.code.perfectline.ee/#{app_name}.git"
      when 4
        git :remote => "add origin #{ask("Enter Git repository URI:", Thor::Shell::Color::YELLOW)}"
    end

  end
end