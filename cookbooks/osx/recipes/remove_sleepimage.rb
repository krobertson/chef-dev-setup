# This removes the 'sleepimage' which is used to store the ram on disk when it goes to hibernate at low power.
# My system rarely gets there, and it eats up disk space on a precious SSD.
#
# Based on http://blogs.nullvision.com/?p=275

# requires root

execute "disable hibernatemode" do
  command "pmset -a hibernatemode 0"
end

file "/var/vm/sleepimage" do
  action :delete
end
