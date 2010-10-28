@template_path = File.dirname(__FILE__)

def install_if_unavailable(gem, version=nil)
  arguments = [].tap do |arguments|
    arguments << gem
    arguments << "-v '#{version}'" if version.present?
  end

  if Gem.available?(gem, version)  # version defaults to '>= 0' if empty
    say("Found #{gem}, skipping installation", :cyan)
  else
    run "gem install #{arguments.join(' ')}"
  end
end

apply "#{@template_path}/cleanup.rb"
apply "#{@template_path}/rvm.rb"
apply "#{@template_path}/database.rb"
apply "#{@template_path}/cucumber.rb"
apply "#{@template_path}/rspec.rb"
apply "#{@template_path}/jquery.rb"
apply "#{@template_path}/gems.rb"
apply "#{@template_path}/layout.rb"
apply "#{@template_path}/bootstrap.rb"
apply "#{@template_path}/capistrano.rb"
apply "#{@template_path}/git.rb"

# TODO: resque
# TODO: capistrano recipes