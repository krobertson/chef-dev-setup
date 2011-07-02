include_recipe "homebrew"

package "mongodb"

execute "copy mongodb launch script" do
  command %Q{
    mkdir -p ~/Library/LaunchAgents
    cp `find /usr/local/Cellar/mongodb -name org.mongodb.mongod.plist | tail -n 1` ~/Library/LaunchAgents/
  }
end

service "org.mongodb.mongod" do
  action [:enable, :start]
end

#execute "autostart mongodb on boot" do
#  command %Q{
#    mkdir -p ~/Library/LaunchAgents
#    cp /usr/local/Cellar/mongodb/1.8.2-x86_64/org.mongodb.mongod.plist ~/Library/LaunchAgents/
#    launchctl load -w ~/Library/LaunchAgents/org.mongodb.mongod.plist
#  }
#end
