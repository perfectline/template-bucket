apply 'cleanup'
apply 'git'

if yes?("Use RSpec?")
  apply 'rspec.rb'
end

if yes?("Use BDD?")
  apply 'cucumber.rb'
end

if yes?("Add jQuery?")
  apply 'jquery.rb'
end

#if yes?("Add jQuery UI?")
  #apply 'jqueryui.rb'
#end

