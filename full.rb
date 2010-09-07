@template_path = File.dirname(__FILE__).inspect

apply "#{@template_path}/cleanup.rb"
apply "#{@template_path}/database.rb"
apply "#{@template_path}/rspec.rb"
#apply "#{@template_path}/cucumber"
apply "#{@template_path}/jquery.rb"
apply "#{@template_path}/git.rb"