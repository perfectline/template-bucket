def download(url, filename = nil)
  if filename.nil?
    filename = url.split("/").last
  end
  run "curl -L #{url} > #{filename}"
end

def unzip(url, filename)
  run "curl -O #{url}/#{filename}"
  run "unzip #{filename}"
  run "rm #{filename}"
end