#
# Cookbook Name:: application_java
# Provider:: tomcat
#
# Copyright 2012, ZephirWorks
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

include Chef::DSL::IncludeRecipe

action :before_compile do
end

action :before_deploy do
  service new_resource.name do
    supports restart: true, reload: true, status: true
    action :stop
  end

  directory "/usr/local/tomcat/#{new_resource.name}/webapps/ROOT" do
    recursive true
    action :delete
  end

  service new_resource.name do
    supports restart: true, reload: true, status: true
    action :restart
  end
end

action :before_migrate do
end

action :before_symlink do
end

action :before_restart do
end

action :after_restart do
  service new_resource.name do
    supports restart: true, reload: true, status: true
    action :stop
  end

  directory "/usr/local/tomcat/#{new_resource.name}/webapps/ROOT" do
    recursive true
    action :delete
  end

  service new_resource.name do
    supports restart: true, reload: true, status: true
    action :restart
  end
end
