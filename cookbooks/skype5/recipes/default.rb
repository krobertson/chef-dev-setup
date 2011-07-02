#
# Cookbook Name:: skype5
# Recipe:: default
#
# Copyright 2010, Joshua Timberman
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

unless ::File.directory?("/Applications/Skype.app")
  dmg_package "Skype" do
    source "http://www.skype.com/go/getskype-macosx.dmg"
  end
end

if node["skype5"]["chat_style"]

  style_file = "#{Chef::Config[:file_cache_path]}/chatstyle.zip"
  style_dir = "#{ENV['HOME']}/Library/Application Support/Skype/ChatStyles"
  style_unzip = "#{Chef::Config[:file_cache_path]}/#{node["skype5"]["style_basedir"]}/#{node["skype5"]["style_name"]}.SkypeChatStyle" 

  directory"#{ENV['HOME']}/Library/Application Support/Skype/ChatStyles" do
    recursive true
  end

  remote_file style_file do
    source node["skype5"]["chat_style"]
    action :create_if_missing
  end

  execute "unzip #{style_file}" do
    cwd Chef::Config[:file_cache_path]
    creates style_unzip
    notifies :create, "ruby_block[Install ChatStyle #{node["skype5"]["style_name"]}]"
  end

  ruby_block "Install ChatStyle #{node["skype5"]["style_name"]}" do
    block do
      Chef::Log.debug("Installing ChatStyle #{node["skype5"]["style_name"]}")
      ::FileUtils.cp_r(style_unzip, style_dir)
      Chef::Log.debug("ChatStyle #{node["skype5"]["style_name"]} installed, set in Skype preferences")
    end
    action :nothing
  end
  
end
