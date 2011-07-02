directory "/Users/#{node[:current_user]}/Library/Application Support/TextMate/Themes/WebPreview" do
  recursive true
end

directory "/Users/#{node[:current_user]}/Library/Application Support/TextMate/Bundles" do
  recursive true
end

git "/Users/#{node[:current_user]}/Library/Application Support/TextMate/Themes/WebPreview/github" do
  repository "https://github.com/kneath/github_textmate_preview.git"
  reference "master"
  action :sync
end

git "/Users/#{node[:current_user]}/Library/Application Support/TextMate/Bundles/Git.tmbundle" do
  repository "https://github.com/jcf/git-tmbundle.git"
  reference "master"
  action :sync
end

git "/Users/#{node[:current_user]}/Library/Application Support/TextMate/Bundles/RSpec.tmbundle" do
  repository "https://github.com/rspec/rspec-tmbundle.git"
  reference "master"
  action :sync
end

git "/Users/#{node[:current_user]}/Library/Application Support/TextMate/Bundles/RubyAMP.tmbundle" do
  repository "https://github.com/timcharper/rubyamp.git"
  reference "master"
  action :sync
end

git "/Users/#{node[:current_user]}/Library/Application Support/TextMate/Bundles/Ruby-Haml.tmbundle" do
  repository "https://github.com/mattpolito/ruby-haml.tmbundle.git"
  reference "master"
  action :sync
end

# TODO: AckMate https://github.com/downloads/protocool/AckMate/AckMate.1.1.2.zip

remote_file "/Users/#{node[:current_user]}/Library/Application Support/TextMate/Themes/Railscasts.tmTheme" do
  source "https://github.com/ryanb/textmate-themes/raw/master/railscasts.tmTheme"
end
