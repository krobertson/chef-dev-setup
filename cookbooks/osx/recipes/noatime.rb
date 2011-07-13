# Based on http://blogs.nullvision.com/?p=275

cookbook_file "/Library/LaunchDaemons/com.nullvision.noatime.plist" do
  source "com.nullvision.noatime.plist"
  owner "root"
  group "wheel"
end
