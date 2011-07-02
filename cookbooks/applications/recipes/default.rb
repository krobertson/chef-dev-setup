if node[:applications]
  for application_name in node[:applications]
    include_recipe "applications::#{application_name}"
  end
end
