execute "set dock to be on right" do
  command "defaults write com.apple.dock orientation -string right"
end

execute "relaunch dock" do
  command "sudo killall Dock"
end
