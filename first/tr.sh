xrandr --output eDP-1 --brightness 0.5
xrandr --output HDMI-1 --brightness 0.5

#configure system settings-----------------------------
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
gsettings set org.gnome.desktop.notifications show-banners false
gsettings set org.gnome.desktop.notifications show-in-lock-screen false
xrandr --output HDMI-1 --left-of eDP-1
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('ibus', 'mozc-jp')]"
timedatectl set-timezone Asia/Tokyo
gsettings set org.gnome.shell favorite-apps []

#configure system settings from tweaks-----------------------------
gsettings set org.gnome.desktop.background picture-options none
gsettings set org.gnome.desktop.interface text-scaling-factor 1.2
gsettings set org.gnome.desktop.interface gtk-key-theme 'Emacs'
#setxkbmap -option "ctrl:nocaps"
gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:nocaps']" 
gsettings set org.gnome.desktop.search-providers disable-external true
