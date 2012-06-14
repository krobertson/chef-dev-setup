execute "set top right corner to put the display to sleep" do
  command %Q{
    defaults write com.apple.dock wvous-tr-corner 10
    defaults write com.apple.dock wvous-tr-modifier 0
  }
end
