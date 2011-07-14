include_recipe "homebrew"

package "redis"

execute "copy redis launch script" do
  command %Q{
    mkdir -p ~/Library/LaunchAgents
    cp `find /usr/local/Cellar/redis -name io.redis.redis-server.plist | tail -n 1` ~/Library/LaunchAgents/
  }
end

service "io.redis.redis-server" do
  action [:enable, :start]
end
