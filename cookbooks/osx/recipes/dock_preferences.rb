execute "set dock to be on right" do
  command "defaults write com.apple.dock orientation -string right"
end

execute "set top right corner to put the display to sleep" do
  command %Q{
    defaults write com.apple.dock wvous-tr-corner 10
    defaults write com.apple.dock wvous-tr-modifier 0
  }
end

execute "relaunch dock" do
  command "sudo killall Dock"
end
