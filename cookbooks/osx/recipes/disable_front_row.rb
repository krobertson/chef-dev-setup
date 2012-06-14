execute "move front row out of the way" do
  command "sudo mv /System/Library/CoreServices/Front\\ Row.app /System/Library/CoreServices/Front_Row_disabled.app"
  only_if { File.exists?("/System/Library/CoreServices/Front\\ Row.app") }
end
