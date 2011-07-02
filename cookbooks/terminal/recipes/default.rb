directory "/Users/#{node[:current_user]}/Library/Application Support/SIMBL/Plugins" do
  recursive true
end

execute "download and extract TerminalColors" do
  cwd "/Users/#{node[:current_user]}/Library/Application Support/SIMBL/Plugins"
  command %Q{
    curl -O https://github.com/downloads/evanphx/terminalcolours/TerminalColours-SL.tar.gz
    tar xzvf TerminalColours-SL.tar.gz
    rm TerminalColours-SL.tar.gz
  }
  creates "/Users/#{node[:current_user]}/Library/Application Support/SIMBL/Plugins/TerminalColours.bundle"
end
