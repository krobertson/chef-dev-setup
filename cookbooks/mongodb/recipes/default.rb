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
