#
# Cookbook Name:: packages
# Recipe:: default
#

if node[:packages]
  for pacakge_name in node[:packages]
    package pacakge_name
  end
end