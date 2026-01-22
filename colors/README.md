Needed packages:
yay -S krita nsxiv dunst python-pywal themix-full-git

mkdir -p ~/.config/nsxiv/exec/
ln -s ~/Desktop/meow/colors/key-handler ~/.config/nsxiv/exec/key-handler

ln -s ~/Desktop/meow/colors/krita.colors ~/.config/wal/templates
ln -s ~/.cache/wal/krita.colors ~/.local/share/krita/color-scheme

mkdir ~/.config/dunst/
ln -s ~/Desktop/meow/colors/dunstrc ~/.config/wal/templates/
ln -s ~/.cache/wal/dunstrc ~/.config/dunst/

sudo mv ~/Desktop/meow/colors/colors-fuzzel.ini /usr/lib/python3.13/site-packages/pywal/templates

git clone https://github.com/themix-project/oomox.git --recursive
cd oomox
make -f po.mk install
sudo ln -sf ~/gitgot/oomox/plugins/icons_numix/numix-folders/styles/3  ~/gitgot/oomox/opt/oomox/plugins/icons_numix/numix-folders/styles/0

xavier ALL=(ALL) NOPASSWD: /home/xavier/.local/bin/update-background
xavier ALL=(ALL) NOPASSWD: /home/xavier/Desktop/haven/pywal16
xavier ALL=(ALL) NOPASSWD: /home/xavier/Desktop/meow/colors/update-background
xavier ALL=(ALL) NOPASSWD: /home/xavier/.config/nsxiv/exec/key-handler

