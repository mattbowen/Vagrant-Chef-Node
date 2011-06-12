#get apt up-to-date
apt_update = execute "update apt" do
  user "root"
  command "apt-get update"
  action :nothing
end
apt_update.run_action(:run)

%w{curl emacs23-nox wget git-core}.each do |pkg|
  package pkg do
    action :install
  end
end

require_recipe "nodejs"
require_recipe "nodejs::npm"
