bash "installed macvim from google code" do
  code <<-EOS
    rm -rf /Applications/MacVim.app
    curl -L http://github.com/downloads/b4winckler/macvim/MacVim-snapshot-58.tbz -o - | tar xj -
    cd MacVim-snapshot-58
    cp -r MacVim.app /Applications/
    cp mvim /usr/local/bin/
  EOS
  creates "/usr/local/bin/mvim"
end
