bash "installed macvim from google code" do
  code <<-EOS
    rm -rf /Applications/MacVim.app
    curl -L https://github.com/downloads/b4winckler/macvim/MacVim-snapshot-59.tbz -o - | tar xj -
    cd MacVim-snapshot-59
    cp -r MacVim.app /Applications/
    cp mvim /usr/local/bin/
  EOS
  cwd '/tmp'
  creates "/usr/local/bin/mvim"
end

git "/Users/#{node[:current_user]}/.vim" do
  repository 'git://github.com/carlhuda/janus.git'
  reference "master"
  action :sync
  notifies :run, "execute[install janus]"
end

execute "install janus" do
  cwd "/Users/#{node[:current_user]}/.vim"
  command "rake"
end
