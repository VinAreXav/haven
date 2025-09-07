1. ~/desktop/scripts/walmenu.sh, make it executable chmod +x ~/Desktop/scripts/walmenu.sh
2. create ~/usr/share/applications/walmenu.desktop

     [Desktop Entry]    
Name=walmenu
Comment=Set wallpaper using pywal
Exec=/home/xavier/Desktop/scripts/wallmenu.sh
Icon=preferences-desktop-wallpaper
Terminal=false
Type=Application
Categories=Utility;

3. update-desktop-database ~/usr/share/applications
4. ~/desktop/scripts/pywal16
5. ~/.config/wal/templates/krita.colors
