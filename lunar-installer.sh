mkdir /opt/lunar-client
cd /opt/lunar-client
wget --output-document=lunar.AppImage https://launcherupdates.lunarclientcdn.com/Lunar%20Client-2.5.0.AppImage
chmod +x lunar.AppImage
./lunar.AppImage --appimage-extract
cd squashfs-root
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
cd /opt/lunar-client
chmod 775 /opt/lunar-client -R
cd /home/*/Desktop
cp lunarclient.desktop /usr/share/applications