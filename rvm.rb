# This depends on the RVM gem...
#
#    gem install rvm
#
# Note that you do not have to install RVM itself via the gem,
# the gem just needs to be present so it can be used here.
#
# Note also that you MUST be using 1.9.2 already on the command 
# line when generating your Rails app... 
#
#     rvm use 1.9.2

# TODO: check prerequisites

require 'rvm'

create_file ".rvmrc" do
  "rvm 1.9.2@#{app_name}"
end

run "rvm rvmrc trust"

run "rvm use --create 1.9.2@#{app_name}"
run "rvm 1.9.2@#{app_name}"

RVM.gemset_use! app_name

# Now install the required gems in the new gemset
unless Gem.available?("rails")
  run 'gem install rails --no-rdoc --no-ri'
else
  say("Found rails, skipping installation", :cyan)
end
