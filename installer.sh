clear
echo -en "\033]0;Lunar Client Linux Installer\a"
APP_NAME='Lunar Client' #This will be the main app name. It will be displayed in the app launcher and in the desktop shortcut
APP_PATH_NAME=lunar-client #This will be the name for the paths, the AppImage and others. MUST BE URL-FRIENDLY!
APP_URL=https://launcherupdates.lunarclientcdn.com/Lunar%20Client-2.6.0.AppImage #This must lead to an appimage file
SUDO_USER=$(logname)
echo 'Available options:'
echo '1) Install '$APP_NAME
echo '2) Uninstall '$APP_NAME
echo -n 'Choose an option: ' && read INSTALLER_OPTION
if [ $INSTALLER_OPTION = 1 ]
then
  mkdir /opt/$APP_PATH_NAME
  cd /opt/$APP_PATH_NAME
  wget -r -l 1 --span-hosts --output-document=$APP_PATH_NAME.AppImage -erobots=off -nH $APP_URL
  chmod +xwr $APP_PATH_NAME.AppImage
  chown $SUDO_USER $APP_PATH_NAME.AppImage
  ./$APP_PATH_NAME.AppImage --appimage-extract
  cd /opt/$APP_PATH_NAME/squashfs-root
  cp .DirIcon /opt/$APP_PATH_NAME
  cp * /opt/$APP_PATH_NAME -r
  rm * -r
  cd /opt/$APP_PATH_NAME
  rm squashfs-root -r
  cd /home/*/Desktop
  echo -n > $APP_PATH_NAME.desktop
  cat <<EOT >> $APP_PATH_NAME.desktop
  [Desktop Entry]
  Name=$APP_NAME
  Exec=/opt/$APP_PATH_NAME/AppRun
  Terminal=false
  Type=Application
  Icon=/opt/$APP_PATH_NAME/lunarclient.png
  StartupWMClass=$APP_NAME
  X-AppImage-Version=2.6.0
  Comment=$APP_NAME
  Categories=Utility;
EOT
  chmod 775 /home/*/Desktop/$APP_PATH_NAME.desktop
  chmod +x /home/*/Desktop/$APP_PATH_NAME.desktop
  chown $SUDO_USER /home/*/Desktop/$APP_PATH_NAME.desktop
  cd /opt/$APP_PATH_NAME
  chmod +xwr /opt/$APP_PATH_NAME -R
  chmod 775 /opt/$APP_PATH_NAME -R
  chown $SUDO_USER /opt/$APP_PATH_NAME -R
  chmod 775 /opt/$APP_PATH_NAME/AppRun
  chmod +rwx /opt/$APP_PATH_NAME/AppRun
  chown $SUDO_USER /opt/$APP_PATH_NAME/AppRun
  cd /home/*/Desktop
  cp $APP_PATH_NAME.desktop /usr/share/applications
else
  rm -R /opt/$APP_PATH_NAME
  rm /home/*/Desktop/$APP_PATH_NAME.desktop
  rm /usr/share/applications/$APP_PATH_NAME.desktop
fi
