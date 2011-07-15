directory "#{ENV['HOME']}/.ssh" do
  owner node[:current_user]
  group "staff"
  mode 0700
end
