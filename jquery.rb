if yes?("Use jQuery as javascript library?", Thor::Shell::Color::YELLOW)

  inside "public/javascripts" do
    remove_file 'controls.js'
    remove_file 'dragdrop.js'
    remove_file 'effects.js'
    remove_file 'prototype.js'
    remove_file 'rails.js'

    get "http://github.com/rails/jquery-ujs/raw/master/src/rails.js", "rails.js"
    get "http://code.jquery.com/jquery-1.4.2.min.js",                 "jquery/jquery.min.js"
    get "http://plugins.jquery.com/files/jquery.metadata.2.1.zip",    "jquery/jquery.metadata.zip"

    inside "jquery" do
      run "unzip jquery.metadata.zip -d jquery-metadata"
      copy_file "jquery-metadata/jquery.metadata.2.1/jquery.metadata.js", "jquery.metadata.js"
      remove_file 'jquery.metadata.zip'
      remove_file 'jquery-metadata'
    end
  end

  initializer "jquery.rb" do
    "ActionView::Helpers::AssetTagHelper.register_javascript_expansion :jquery => ['jquery/jquery.min', 'jquery/jquery.metadata', 'rails']" +
    "ActionView::Helpers::AssetTagHelper.javascript_expansions[:defaults] = ['jquery/jquery.min', 'jquery/jquery.metadata', 'rails']"
  end

end