task :install do
  # ensure chef is installed
  chef_binary = `which chef-solo`.chomp
  if chef_binary == "" || `#{chef_binary} -v`.chomp !~ /^Chef: 0\.10\./
    puts "Installing chef..."
    `sudo gem install chef -v "~> 0.10.2" --no-ri --no-rdoc`
  end

  # ensure /usr/local exists
  unless File.directory?("/usr/local")
    `sudo mkdir /usr/local && sudo chown #{ENV['USER']}:staff /usr/local`
  end
end

task :cook => :install do
  puts "Running chef-solo..."
  sh "chef-solo -c config/solo.rb -j dna.json"
  sh "sudo chef-solo -c config/solo.rb -j dna_root.json"
end
