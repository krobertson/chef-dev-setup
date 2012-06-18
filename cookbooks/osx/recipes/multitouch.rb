execute "turn on right click with trackpad" do
  command %Q{
    defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
    defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Dragging -bool true
    defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
  }
end

execute "turn on right click with bluetooth mouse" do
  command "defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseButtonMode -string TwoButton"
end
