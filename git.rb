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

    say("Choose repository location:",        Thor::Shell::Color::YELLOW)
    say("\t[1] http://www.github.com",          Thor::Shell::Color::YELLOW)
    say("\t[2] http://svn.perfectline.ee",      Thor::Shell::Color::YELLOW)
    say("\t[3] http://git.code.perfectline.ee",  Thor::Shell::Color::YELLOW)

    question    = lambda { ask("Enter number:", Thor::Shell::Color::YELLOW) }
    repository  = question.call

    while !(1..3).include?(repository.to_i) do
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
    end

  end
end