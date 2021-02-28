If the uninstall process fails to remove the `lunar-client` shell command, run `sed -i 's\$LUNAR_CLIENT_COMMAND\\' ./.bashrc`.
If this fails too, go to the .bashrc file manually (Recommended way: `nano ~/.bashrc`) and delete the line `$LUNAR_CLIENT_COMMAND` and `LUNAR_CLIENT_COMMAND=$(source /opt/lunar-client/lunar-client.sh)`
