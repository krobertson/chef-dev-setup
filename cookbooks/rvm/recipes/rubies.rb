#
# Cookbook Name:: rvm
# Recipe:: rubies
#
# Copyright 2010, Fletcher Nichol
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

# thanks to:
# - http://www.agileweboperations.com/chef-rvm-ruby-enterprise-edition-as-default-ruby/
# - http://github.com/denimboy/xprdev/blob/master/rvm/recipes/ree.rb


node[:rvm][:rubies].each do |ruby|
  bash "install RVM ruby: #{ruby}" do
    code %{source $HOME/.rvm/scripts/rvm && rvm install #{ruby}}
    not_if %{bash -c "source $HOME/.rvm/scripts/rvm && rvm list strings | grep -q '^#{ruby}' >/dev/null"}
  end
end

