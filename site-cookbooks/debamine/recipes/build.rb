#
# Cookbook Name:: debamine
# Recipe:: build
#
# Author:: Teemu Matilainen <teemu.matilainen@iki.fi>
#
# Copyright 2013, Teemu Matilainen
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

include_recipe 'debamine::ec2debian-build-ami'

config = data_bag_item('debamine', 'config')

cmd = "./ec2debian-build-ami"
%w[arch codename description volume-size].each do |key|
  cmd << " --#{key} '#{config[key]}'" if config[key]
end
if config['plugins']
  config['plugins'].each do |plugin|
    cmd << " --plugin 'plugins/#{plugin}'"
  end
end

execute "ec2debian-build-ami" do
  command cmd
  cwd node['debamine']['ec2debian-build-ami']['root_dir']
  environment(
    'EC2_ACCESS_KEY' => config['aws']['access_key'],
    'EC2_SECRET_KEY' => config['aws']['secret_key']
  )
end
