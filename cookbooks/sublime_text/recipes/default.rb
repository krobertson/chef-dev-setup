##  This is very experimental and unsupported.

run_unless_marker_file_exists("sublime_text_2") do
  dmg_package "Sublime Text 2" do
    volumes_dir "Sublime Text 2"
    source "http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%202%20Build%202181.dmg"
  end

  execute "link subl" do
    command "ln -s '/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl' /usr/local/bin/subl"
    not_if "test -e /usr/local/bin/subl"
  end
end

directory "/Users/#{node[:current_user]}/Library/Application Support/Sublime Text 2/Packages/Color Scheme - Default" do
  recursive true
end

cookbook_file "/Users/#{node[:current_user]}/Library/Application Support/Sublime Text 2/Packages/Color Scheme - Default/Railscasts.tmTheme" do
  source "Railscasts.tmTheme"
end

directory "/Users/#{node[:current_user]}/Library/Application Support/Sublime Text 2/Packages/User" do
  recursive true
end

cookbook_file "/Users/#{node[:current_user]}/Library/Application Support/Sublime Text 2/Packages/User/Preferences.sublime-settings" do
  source "user_preferences.json"
end

git "/Users/#{node[:current_user]}/Library/Application Support/Sublime Text 2/Packages/coffee-script-tmbundle" do
  repository "https://github.com/jashkenas/coffee-script-tmbundle.git"
  reference "master"
  action :sync
end
