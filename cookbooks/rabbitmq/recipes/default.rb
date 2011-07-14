include_recipe "homebrew"

package "rabbitmq"

execute "copy mongodb launch script" do
  command %Q{
    mkdir -p ~/Library/LaunchAgents
    cp `find /usr/local/Cellar/rabbitmq -name com.rabbitmq.rabbitmq-server.plist | tail -n 1` ~/Library/LaunchAgents/
  }
end

service "com.rabbitmq.rabbitmq-server" do
  action [:enable, :start]
end
