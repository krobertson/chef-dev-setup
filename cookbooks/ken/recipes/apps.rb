include_recipe "skype5"
include_recipe "1password"
include_recipe "text_mate"

dmg_package "Dropbox" do
  volumes_dir "Dropbox Installer"
  source "http://www.dropbox.com/download?plat=mac"
  action :install
end

dmg_package "Google Chrome" do
  dmg_name "googlechrome"
  source "https://dl-ssl.google.com/chrome/mac/stable/GGRM/googlechrome.dmg"
  action :install
end

dmg_package "Adium" do
  volumes_dir "Adium 1.4.2"
  source "http://download.adium.im/Adium_1.4.2.dmg"
  checksum "c504c84122433dc4fcc48a05dcb6b6f3e325527e5ee3c2ef2a2c35de11b6aeb3"
end

# MavVim
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

remote_file "/tmp/transmit.zip" do
  source "http://www.panic.com/transmit/d/Transmit%204.1.5.zip"
  checksum "4767297b78b54783c55c1234b5c2ecadb3162a3eff60ce3ae4b175a671bc7c58"
  not_if { ::File.directory?('/Applications/Transmit.app') }
end

execute "install transmit" do
  command "unzip /tmp/transmit.zip -d /Applications"
  not_if { ::File.directory?('/Applications/Transmit.app') }
end

dmg_package "Aquamacs" do
  volumes_dir "Aquamacs Emacs"
  source "http://downloads.sourceforge.net/project/aquamacs/Releases/Aquamacs-Emacs-2.2.dmg"
  checksum "5309c3745b02de47f5219c206e2bd429c63a14937a04d82daed13a3e478510ec"
end

dmg_package "Sequel Pro" do
  volumes_dir "Sequel Pro 0.9.9"
  source "http://sequel-pro.googlecode.com/files/Sequel_Pro_0.9.9.dmg"
  checksum "afd639ede91104652027696724b2b9107d6b5e4fc2cc010223e54d647f4fec4c"
end

execute "installed Things" do
  command <<-EOS
    curl -O http://culturedcode.cachefly.net/things/Things_1.4.7.zip
    unzip Things_1.4.7.zip -d /Applications
  EOS
  not_if { ::File.directory?('/Applications/Things.app') }
end

execute "installed Fluid" do
  command <<-EOS
    curl -O http://fluidapp.com/dist/Fluid_1.1.zip
    unzip Fluid_1.1.zip -d /Applications
  EOS
  not_if { ::File.directory?('/Applications/Fluid.app') }
end

dmg_package "Transmission" do
  source "http://download.transmissionbt.com/files/Transmission-2.32.dmg"
  checksum "749ae886564a1e2029067da98db99995bec5e32ede7a72d157d33c139b926640"
end

execute "installed Kaleidoscope" do
  command <<-EOS
    curl -O http://d38sv94p198wrl.cloudfront.net/KSUpdates/1.1.4_50/Kaleidoscope_1.1.4_50.zip
    unzip Kaleidoscope_1.1.4_50.zip -d /Applications
  EOS
  not_if { ::File.directory?('/Applications/Kaleidoscope.app') }
end

execute "installed iStat Menus" do
  command <<-EOS
    curl -O http://s3.amazonaws.com/bjango/files/istatmenus3/istatmenus3.18.zip
    unzip istatmenus3.18.zip -d /Applications
  EOS
  not_if { ::File.directory?('/Applications/iStat Menus.app') }
end
