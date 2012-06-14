include_recipe "homebrew"

package "redis"

execute "copy redis launch script" do
  command %Q{
    mkdir -p ~/Library/LaunchAgents
    cp `find /usr/local/Cellar/redis -name homebrew.mxcl.redis.plist | tail -n 1` ~/Library/LaunchAgents/
  }
end

service "homebrew.mxcl.redis" do
  action [:enable, :start]
end
