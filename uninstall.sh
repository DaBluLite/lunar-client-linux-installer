rm /opt/lunar-client -r &> /dev/null
rm /home/*/Desktop/lunarclient.desktop &> /dev/null
rm /usr/share/applications/lunarclient.desktop &> /dev/null
sed -i 's\$LUNAR_CLIENT_COMMAND\\' ./.bashrc &> /dev/null
