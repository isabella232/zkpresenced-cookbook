#
# Cookbook Name:: zkpresenced
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "git"

dir = node[:zkpresenced][:dir]

git dir do
  repository node[:zkpresenced][:repo]
  reference node[:zkpresenced][:branch]
  action :sync
end

bash "bundle_install_zkpresenced" do
  cwd dir
  code <<EOH
#{node[:zkpresenced][:bundle_cmd]} install --path .bundle/gems
EOH
end

template "/etc/default/zk-presenced" do
  source "zk-presenced.erb"
  owner "root"
  mode "0644"

  variables(:dir => node[:zkpresenced][:dir],
            :hosts => node[:zkpresenced][:hosts].join(","),
            :namespace => node[:zkpresenced][:namespace],
            :types => node[:zkpresenced][:types].join(","),
            :logfile => node[:zkpresenced][:logfile])
end

template "/etc/init/zk-presenced.conf" do
  source "zk-presenced.conf.erb"
  owner "root"
  mode "0644"

  variables(:bundle_cmd => node[:zkpresenced][:bundle_cmd])
end

service 'zk-presenced' do
  provider Chef::Provider::Service::Upstart
  action [:enable]
end
