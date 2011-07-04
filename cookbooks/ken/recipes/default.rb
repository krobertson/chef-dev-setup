execute "set user shell" do
  command "sudo chsh /bin/zsh #{node[:current_user]}"
end

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
