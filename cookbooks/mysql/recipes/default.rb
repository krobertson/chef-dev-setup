include_recipe "homebrew"

package "mysql"

execute 'setup mysql databases' do
  command %Q{
    unset TMPDIR
    mysql_install_db --verbose --user=`whoami` --basedir="$(brew --prefix mysql)" --datadir=/usr/local/var/mysql --tmpdir=/tmp
  }
  creates "/usr/local/var/mysql/mysql/user.MYI"
end

execute "copy mysql launch script" do
  command %Q{
    mkdir -p ~/Library/LaunchAgents
    cp `find /usr/local/Cellar/mysql -name com.mysql.mysqld.plist | tail -n 1` ~/Library/LaunchAgents/
  }
end

service "com.mysql.mysqld" do
  action [:enable, :start]
end
