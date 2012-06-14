execute "turn on right click with trackpad" do
  command "defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick 1"
end

execute "turn on right click with bluetooth mouse" do
  command "defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseButtonMode -string TwoButton"
end
