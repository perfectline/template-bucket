apply 'cleanup',  :verbose => true
apply 'git',      :verbose => true

if yes?("Use RSpec?")
  apply 'rspec.rb', :verbose => true
end

if yes?("Use BDD?")
  apply 'cucumber.rb', :verbose => true
end

if yes?("Add jQuery?")
  apply 'jquery.rb', :verbose => true
end