include_recipe "homebrew"

package "mongodb"

execute "copy mongodb launch script" do
  command %Q{
    mkdir -p ~/Library/LaunchAgents
    cp `find /usr/local/Cellar/mongodb -name homebrew.mxcl.mongodb.plist | tail -n 1` ~/Library/LaunchAgents/
  }
end

service "homebrew.mxcl.mongodb" do
  action [:enable, :start]
end
