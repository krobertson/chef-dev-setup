# This is to completely disable the 'mds' process for Spotlight
# on Snow Leopard
#
# The command comes from http://osxdaily.com/2009/09/20/disable-spotlight-in-mac-os-x-10-6-snow-leopard/

execute "disable spotlight" do
  command "sudo mdutil -a -i off"
  only_if { %x{sudo mdutil -a -s} !~ /Indexing disabled/ }
end
