needed: OpenTabletDriver fuzzel git 
ln -sf ~/Desktop/meow/main/settings.json ~/.config/OpenTabletDriver/

mkdir -p ~/.config/fuzzel
ln -s ~/Desktop/meow/main/fuzzel.ini ~/.config/fuzzel/

sudo cp /home/xavier/Desktop/meow/main/sddm.conf /etc/sddm.conf
sudo cp /home/xavier/Desktop/meow/main/sddm.conf /etc/sddm.conf.d/sddm.conf
