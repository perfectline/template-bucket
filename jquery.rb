run   'rm public/javascripts/controls.js'
run   'rm public/javascripts/dragdrop.js'
run   'rm public/javascripts/effects.js'
run   'rm public/javascripts/prototype.js'

inside "public/javascripts/jquery" do
  download  "http://code.jquery.com/jquery-1.4.2.js"

  if yes?("Download jQuery Metadata?")
    unzip     "http://plugins.jquery.com/files/", "jquery.metadata.2.1.zip"
  end
end