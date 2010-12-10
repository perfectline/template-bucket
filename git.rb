if yes?("Use Git?", :yellow)

  get "#{File.dirname(__FILE__)}/resources/.gitignore", ".gitignore", :force => true

  git :init
  git :add => "."
  git :commit => "-a -m '- initial commit'"

  if yes?("Initialize remote repository?", :yellow)

    set_repository    = lambda { |repo| git :remote => "add origin #{repo}" unless repo.blank? }    
    other_repository  = lambda { ask("Enter Git repository URI:", :yellow) }
    repository_list   = File.expand_path("~/.template-bucket/repositories")

    if File.exists?(repository_list)

      options = File.readlines(repository_list)

      say("Choose repository location:", :yellow)

      options.each_with_index do |repo, index|
        say("\t[#{index + 1}] #{repo.gsub(/<app>/, app_name)}")
      end

      say("\t[#{options.length + 1}] other repository")

      question    = lambda { ask("Enter number:", :yellow) }
      repository  = question.call

      while !(1..(options.length + 1)).include?(repository.to_i) do
        say("Incorrect option", :red)
        repository = question.call
      end

      if repository_url = options[repository.to_i]
        set_repository.call(repository_url.gsub(/<app>/, app_name))
      else
        set_repository.call(other_repository.call)
      end

    else
      say("~/template-bucket/repositories was not found, skipping pre-defined list of repositories", :magenta)
      say("You can configure your selection of repositories to ~/template-bucket/repositores to be used in this step", :magenta)
      say("The format is one repository URL per line, where the <app> placeholder will be substituted with application name", :magenta)

      set_repository.call(other_repository.call)
    end

  end
end