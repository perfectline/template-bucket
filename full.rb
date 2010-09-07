if yes?("Are you using templates over HTTP?", Thor::Shell::Color::YELLOW)
  @template_path = "http://github.com/perfectline/template-bucket/raw/master"
else
  @template_path = File.dirname(__FILE__)
end

apply "#{@template_path}/cleanup.rb"
apply "#{@template_path}/rspec.rb"
#apply "#{@template_path}/cucumber"
#apply "#{@template_path}/jquery"
apply "#{@template_path}/git.rb"