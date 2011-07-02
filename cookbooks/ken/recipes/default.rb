#user node[:current_user] do
#  shell "/bin/zsh"
#end

f = File.new('/tmp/node.yml', 'w')
f.puts node.to_yaml.to_s
f.close

git "/Users/#{node[:current_user]}/.configs" do
  repository 'https://github.com/krobertson/configs.git'
  reference "master"
  action :sync
  notifies :run, "execute[update configs symlinks]"
end

execute "update configs symlinks" do
  cwd "/Users/#{node[:current_user]}/.configs"
  command "rake symlink:force"
end
