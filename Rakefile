task :install do
  chef_binary = `which chef-solo`.chomp
  if chef_binary == "" || `#{chef_binary} -v`.chomp !~ /^Chef: 0\.10\./
    puts "Installing chef..."
    `sudo gem install chef -v "~> 0.10.2" --no-ri --no-rdoc`
  end
end

task :cook => :install do
  puts "Running chef-solo..."
  sh "chef-solo -l info -c config/solo.rb -j dna.json"
end
