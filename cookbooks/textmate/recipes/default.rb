##  This is very experimental and unsupported.

run_unless_marker_file_exists("text_mate_1_5_10") do
  remote_file "/tmp/textmate.zip" do
    source "http://download.macromates.com/TextMate_1.5.10.zip"
    checksum "04def68baece6460902b8a2e5cfa4a85676d0b82b93cb44423db843a4c314bcd"
  end

  execute "copy text mate to /Applications" do
    command 'unzip /tmp/textmate.zip -d /Applications/'
  end

  execute "link textmate" do
    command "ln -s /Applications/TextMate.app/Contents/Resources/mate /usr/local/bin/mate"
    not_if "test -e /usr/local/bin/mate"
  end
end

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
  repository "https://github.com/textmate/ruby-haml.tmbundle.git"
  reference "master"
  action :sync
end

# TODO: AckMate https://github.com/downloads/protocool/AckMate/AckMate.1.1.2.zip

remote_file "/Users/#{node[:current_user]}/Library/Application Support/TextMate/Themes/Railscasts.tmTheme" do
  source "https://github.com/ryanb/textmate-themes/raw/master/railscasts.tmTheme"
end
