if node[:osx]
  for osx_name in node[:osx]
    include_recipe "osx::#{osx_name}"
  end
end
