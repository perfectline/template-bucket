create_file ".rvmrc" do
  "rvm 1.9.2@#{app_name}"
end

run "rvm use --create 1.9.2@#{app_name}"
run "rvm 1.9.2@#{app_name}"
