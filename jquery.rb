inside "public/javascripts" do
  remove_file 'controls.js'
  remove_file 'dragdrop.js'
  remove_file 'effects.js'
  remove_file 'prototype.js'
  remove_file 'rails.js'

  get "https://github.com/rails/jquery-ujs/raw/master/src/rails.js", "rails.js"
  get "http://code.jquery.com/jquery-1.5.1.min.js",                 "jquery/jquery.min.js"
  get "http://plugins.jquery.com/files/jquery.metadata.2.1.zip",    "jquery/jquery.metadata.zip"

  inside "jquery" do
    run "unzip jquery.metadata.zip -d jquery-metadata"

    create_file "jquery.metadata.js" do
      File.binread("jquery-metadata/jquery.metadata.2.1/jquery.metadata.js")
    end

    remove_file 'jquery.metadata.zip'
    remove_file 'jquery-metadata'
  end
end

application do
  "\n    config.action_view.javascript_expansions[:defaults] = %w(jquery/jquery.min jquery/jquery.metadata rails)\n"
end

gsub_file "config/application.rb", /# JavaScript.*\n/, ""
gsub_file "config/application.rb", /# config\.action_view\.javascript.*\n/, ""

