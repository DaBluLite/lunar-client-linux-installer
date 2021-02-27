sudo mkdir /opt/lunar-client
sudo cd /opt/lunar-client
sudo wget -r -l 1 --span-hosts --output-document=lunar.AppImage --accept-regex='https://launcherupdates.lunarclientcdn.com/Lunar%20Client-*.*.*.AppImage' -erobots=off -nH https://api.lunarclientprod.com/site/download?os=linux
sudo chmod +xwr lunar.AppImage
sudo ./lunar.AppImage --appimage-extract
sudo cd squashfs-root
sudo cp * /opt/lunar-client -r
sudo rm * -r
sudo cd /opt/lunar-client
sudo rm squashfs-root -r
sudo cd /home/*/Desktop
sudo echo -n > lunarclient.desktop
sudo cat <<EOT >> lunarclient.desktop
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
sudo chmod 775 /home/*/Desktop/lunarclient.desktop
sudo chmod +x /home/*/Desktop/lunarclient.desktop
sudo cd /opt/lunar-client
sudo chmod 775 /opt/lunar-client -R
sudo chmod 775 /opt/lunar-client/AppRun
sudo chmod +rwx /opt/lunar-client/AppRun
sudo chmod 775 /opt/lunar-client/lunarclient
sudo chmod +rwx /opt/lunar-client/lunarclient
sudo cd /home/*/Desktop
sudo cp lunarclient.desktop /usr/share/applications
