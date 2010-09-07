remove_file "README"
remove_file "doc/"
remove_file "public/index.html"
remove_file "public/favicon.ico"
remove_file "public/images/rails.png"

# TODO: cleanup environment
# TODO: cleanup gemfile

application do
  "  config.generators do |generator|" +
  "  end"
end