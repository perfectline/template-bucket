if yes?("Use Git?", :yellow)

  create_file ".gitignore" do
    "*.DS_Store\n" +
    ".rvmrc\n" +
    ".bundle\n" +
    ".idea/*\n" +
    "log/*\n" +
    "tmp/*\n" +
    "db/schema.rb\n" +
    "db/*.sqlite3\n" +
    "public/system\n" +
    "coverage/*\n" +
    "rerun.txt\n" +
    "!.gitkeep\n"
  end
  
  git :init
  git :add => "."
  git :commit => "-a -m '- initial commit'"

  if yes?("Initialize remote repository?", :yellow)

    say("Choose repository location:", :yellow)
    say("\t[1] http://www.github.com/perfectline")
    say("\t[2] http://svn.perfectline.ee")
    say("\t[3] http://git.code.perfectline.ee")
    say("\t[4] other repository")

    question    = lambda { ask("Enter number:", :yellow) }
    repository  = question.call

    while !(1..4).include?(repository.to_i) do
      say("Incorrect option", :red)
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
        git :remote => "add origin #{ask("Enter Git repository URI:", :yellow)}"
    end

  end
end