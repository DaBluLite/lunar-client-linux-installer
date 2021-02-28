SUDO_USER=$(logname)
mkdir /opt/lunar-client
cd /opt/lunar-client
wget -r -l 1 --span-hosts --output-document=lunar.AppImage --accept-regex='https://launcherupdates.lunarclientcdn.com/Lunar%20Client-*.*.*.AppImage' -erobots=off -nH https://api.lunarclientprod.com/site/download?os=linux
chmod +xwr lunar.AppImage
chown $SUDO_USER lunar.AppImage
./lunar.AppImage --appimage-extract
cd /opt/lunar-client/squashfs-root
cp * /opt/lunar-client -r
rm * -r
cd /opt/lunar-client
rm squashfs-root -r
cd /home/*/Desktop
echo -n > lunarclient.desktop
cat <<EOT >> lunarclient.desktop
[Desktop Entry]
Name=Lunar Client
Exec=/opt/lunar-client/AppRun
Terminal=false
Type=Application
Icon=/opt/lunar-client/lunarclient.png
StartupWMClass=Lunar Client
X-AppImage-Version=2.5.0
Comment=Lunar Client
Categories=Game;
EOT
chmod 775 /home/*/Desktop/lunarclient.desktop
chmod +x /home/*/Desktop/lunarclient.desktop
chown $SUDO_USER /home/*/Desktop/lunarclient.desktop
cd /opt/lunar-client
echo -n > lunar-client.sh
cat <<EOT >> lunar-client.sh
function lunar-client() {
  
set +e
bash -e <<TRY
  bash /opt/lunar-client/AppRu &> /dev/null
TRY
if [ $? -ne 0 ]; then
  echo "Lunar Client is not installed. If you want to install it, go to 'https://github.com/DaBluLite/lunar-client-linux-installer' for the instructions."
  echo "If you see this even after uninstalling Lunar Client, go to 'https://github.com/DaBluLite/lunar-client-linux-installer/blob/main/remove-bash-command.md' to see how to remove it."
fi
}
chmod 775 /opt/lunar-client/lunar-client.sh
chmod +rwx /opt/lunar-client/lunar-client.sh
chown $SUDO_USER /opt/lunar-client/lunar-client.sh
chmod 775 /opt/lunar-client -R
chown $SUDO_USER /opt/lunar-client -R
chmod 775 /opt/lunar-client/AppRun
chmod +rwx /opt/lunar-client/AppRun
chown $SUDO_USER /opt/lunar-client/AppRun
chmod 775 /opt/lunar-client/lunarclient
chmod +rwx /opt/lunar-client/lunarclient
chown $SUDO_USER /opt/lunar-client/lunarclient
cd /home/*/Desktop
cp lunarclient.desktop /usr/share/applications
grep -qxF 'LUNAR_CLIENT_COMMAND=$(source /opt/lunar-client/lunar-client.sh)' ~/.bashrc || echo 'LUNAR_CLIENT_COMMAND=$(source /opt/lunar-client/lunar-client.sh)' >> ~/.bashrc
grep -qxF '$LUNAR_CLIENT_COMMAND' ~/.bashrc || echo '$LUNAR_CLIENT_COMMAND' >> ~/.bashrc
