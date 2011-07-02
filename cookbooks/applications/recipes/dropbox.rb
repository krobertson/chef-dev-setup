dmg_package "Dropbox" do
  volumes_dir "Dropbox Installer"
  source "http://www.dropbox.com/download?plat=mac"
  action :install
end
