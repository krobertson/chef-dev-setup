execute "set user shell" do
  command "sudo chsh -s /bin/zsh #{node[:current_user]}"
end

git "/Users/#{node[:current_user]}/.dotfiles" do
  repository 'https://github.com/krobertson/dotfiles.git'
  reference "master"
  action :sync
  notifies :run, "execute[update configs symlinks]"
end

execute "update configs symlinks" do
  cwd "/Users/#{node[:current_user]}/.dotfiles"
  command "rake symlink:force"
end
