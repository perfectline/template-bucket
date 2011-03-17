if @use_haml
  get "#{File.dirname(__FILE__)}/resources/reset.scss", "public/stylesheets/sass/reset.scss"

  append_file ".gitignore" do
    "public/stylesheets/*.css"
  end

else
  get "#{File.dirname(__FILE__)}/resources/reset.css",  "public/stylesheets/reset.css"
end

inside "app/views/layouts" do
  remove_file "application.html.erb"

  if @use_haml
    get "#{File.dirname(__FILE__)}/resources/layout.haml", "application.haml"

    gsub_file "application.html.haml", /\/ insert javascript here\n/, "= include_javascripts :application\n" if @use_jammit.present?
    gsub_file "application.html.haml", /\/ insert javascript here\n/, "= javascript_include_tag :defaults\n" if @use_jammit.nil?

    gsub_file "application.html.haml", /\/ insert stylesheet here\n/, "= include_stylesheets :application\n"  if @use_jammit.present?
    gsub_file "application.html.haml", /\/ insert stylesheet here\n/, "= stylesheet_link_tag 'reset'\n"       if @use_jammit.nil?
  else
    get "#{File.dirname(__FILE__)}/resources/layout.html.erb", "application.html.erb"

    gsub_file "application.html.erb", /<!-- insert javascript here -->\n/, "<%= include_javascripts :application %>\n" if @use_jammit.present?
    gsub_file "application.html.erb", /<!-- insert javascript here -->\n/, "<%= javascript_include_tag :defaults %>\n" if @use_jammit.nil?

    gsub_file "application.html.erb", /<!-- insert stylesheet here -->\n/, "<%= include_stylesheets :application %>\n" if @use_jammit.present?
    gsub_file "application.html.erb", /<!-- insert stylesheet here -->\n/, "<%= stylesheet_include_tag 'reset' %>\n"   if @use_jammit.nil?
  end
end

