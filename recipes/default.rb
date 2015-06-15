#
# Cookbook Name:: iis_demo
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

#powershell_script "add-windowsfeature Web-Server"
powershell_script "Install IIS" do
  code "add-windowsfeature Web-Server"
  action :run
end

service "w3svc" do
  action [ :enable, :start ]
end

cookbook_file 'c:\inetpub\wwwroot\Default.htm' do
  source 'Default.htm'
  rights :read, 'Everyone'
end
