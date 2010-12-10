# Template Bucket

Awesome Rails 3 project template, full of rainbows, ponies and unicorns... and awesomeness.
These templates are knowingly a bit opinionated, but feel free to leave feedback about what you would like to do differently.

### Prerequisites

- [RVM] (http://rvm.beginrescueend.com/)
- Ruby 1.9.2 (installed via RVM) - `rvm install 1.9.2`
- Rails 3 (installed in ruby-1.9.2 in RVM) - `rvm use 1.9.2; gem install rails`

### Usage

The templates work both locally and remotely referenced.
You can clone the repo and reference to it from your filesystem, or use the urls directly from github.

The most basic usage would be `rails new appname -m http://github.com/perfectline/template-bucket/raw/master/full.rb`. 

All of the subtemplates can also be used separately, so you can mix and match them according to your own taste.

### Modules
#### Cleanup
Removes `README`, `doc/`, `index.html`, `rails.png` and `favicon.ico`.
Removes all lines from Gemfile prefixed with # (commented lines).
Also adds the config generators block to `application.rb`.

#### Database
Cleans up the `database.yml` file, reusing basic declarations.
Also adds the `generator.orm :active_record` statement to `application.rb`

#### Cucumber
Installs gems needed by cucumber either with Webrat or Capybara, runs the cucumber generator and replaces the default cucumber.yml

#### RSpec
Installs gems needed to use RSpec with Rails, replaces .rspec configuration, runs the RSpec generator, removes `test/` folder, adds `generator.test_framework :rspec, :view => false` to `application.rb`.
Optionally prompts for installing Shoulda and FactoryGirl.

When Mocha is chosen, adds mocking warnigs to `spec_helper.rb` and configures RSpec with `config.mock_with :mocha`.

When FactoryGirl is chosen, sets the `config.fixture_replacement :factory_girl` with appropriate director in `application.rb`.
Fixture replacement directory depends on the test framework used - with RSpec its `spec/factories`, with Test::Unit its `test/factories`

#### jQuery
Removes the default Prototype library with its helpers, replaces it with jQuery 1.4.2, downloads the Rails jQuery integration and adds the jQuery.metadata plugin.  
Additionally replaces the `:defaults` javascript expansion with the newly added files.

#### Gems
Adds the `rails3-generators` gem, optionally prompts for Jammit and Haml installation.  
When using Jammit, it also creates the default `assets.yml` with default javascripts and `reset.css`.  
Using Haml adds the `generator.template_engine :haml` directive to `application.rb`.

#### Layout
Adds a `reset.css` file under `public/stylesheets` which contains basic CSS reset directives.  
In addition creates the default application layout, proper XHTML Strict file.  
When using HAML, the template will be in HAML as expected.  
When using Jammit, the default javascript and stylesheet tags are replaced with Jammit shortcuts.

#### Bootstrap
Optionally installs all gems via bundle and creates the development database.

#### Capistrano
Optionally adds capistrano support for the project, bootstrapping the application.  
This will get future enhanchements.

#### Git
Replaces the default .gitignore, initializes a new repository, adds all files and does an initial commit.  
If chosen, it will also add a new remote to the repo.  

If the user has a `~/.template-bucket/repositories` file, containing a list of repository locations (one location per line), the file will be used to prompt with predefined repository locations. You can use a placeholder `<app>` in your dotfile, which will be replaced with the current application name.

If no dotfile is found, the template will prompt for a full repository location, including the project name.

### TODO
Mongoid/Mongomapper support, Resque support, pre-configured Capistrano recipes.  
What else am I missing?

## Authors

**Tanel Suurhans** (<http://twitter.com/tanelsuurhans>)  
**Tarmo Lehtpuu** (<http://twitter.com/tarmolehtpuu>)

## License
Copyright 2010 by PerfectLine LLC (<http://www.perfectline.co.uk>) and is released under the MIT license.
