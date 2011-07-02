#user node[:current_user] do
#  shell "/bin/zsh"
#end

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

include_recipe "ken::apps"

include_recipe "osx::disable_front_row"
include_recipe "osx::dock_preferences"
include_recipe "osx::finder_display_full_path"
include_recipe "osx::safari_preferences"
include_recipe "osx::textmate_set_defaults"
include_recipe "osx::turn_on_ssh"
