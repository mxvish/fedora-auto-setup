#mv /run/media/kenter/UNTITLED/* ./
#sudo sh rpmsetup.sh 

#edit & mv files-----------------------------
mv bashrc .bashrc
source ~/.bashrc
mv -f user-dirs.dirs .config/
sudo mv dnf.conf /etc/dnf
sudo mv custom.conf /etc/gdm/

mv Desktop .Desktop
mv Downloads .Downloads
mv Public .Public
rm -rf Templates Documents Music Pictures Videos
mkdir downloads

#remove-----------------------------
sudo dnf -y remove gnome-calendar
sudo dnf -y remove gnome-contacts
sudo dnf -y remove firefox
sudo dnf -y remove gedit
sudo dnf -y remove gnome-maps
sudo dnf -y remove gnome-photos
sudo dnf -y remove gnome-tour
sudo dnf -y remove gnome-weather
sudo dnf -y remove rhythmbox
sudo dnf -y remove cheese
sudo dnf -y remove gnome-calculator
sudo dnf -y remove gnome-clocks

sudo dnf -y update
sudo dnf -y upgrade

#install-----------------------------
sudo dnf -y install java-11-openjdk-devel

sudo dnf -y install dnf-plugins-core
sudo dnf -y config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf -y install brave-browser

sudo dnf -y install chrome-gnome-shell
sudo dnf -y install ibus-mozc
#sudo snap install onlyoffice-desktopeditors
sudo dnf -y install mpg123
sudo dnf -y install ImageMagick
sudo dnf -y install r-base
#sudo dnf -y install ./first/rstudio*.deb
sudo dnf -y install xrandr
sudo dnf -y install x11vnc

sudo dnf -y install vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
sudo dnf -y install nodejs
mv vimrc .vimrc

#sudo dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
#sudo dnf -y install obs-studio
#sudo yum -y localinstall first/zoom_x86_64.rpm 

#configure system settings-----------------------------
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.desktop.notifications show-banners false
gsettings set org.gnome.desktop.notifications show-in-lock-screen false
xrandr --output HDMI-1 --left-of eDP-1 
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('ibus', 'mozc-jp')]"
timedatectl set-timezone Asia/Tokyo
gsettings set org.gnome.shell.extensions.desktop-icons show-home false
gsettings set org.gnome.shell.extensions.desktop-icons show-trash false
gsettings set org.gnome.desktop.background picture-options none
gsettings set org.gnome.desktop.interface gtk-key-theme 'Emacs'

gsettings set org.gnome.desktop.interface enable-animations false
gsettings set org.gnome.software download-updates false
gsettings set org.gnome.shell disable-user-extensions true
gsettings set org.gnome.desktop.search-providers disable-external true

sudo vi /etc/default/grub
"""
edit as follows
...(snip)...
GRUB_CMDLINE_LINUX="rhgb quiet psmouse.synaptics_intertouch=1"
...(snip)...
"""
sudo grub2-mkconfig

sudo dnf -y autoremove
sudo dnf -y clean all
reboot
"""
settings
	search 
		turn off
	keyboard
		view and customize ~
			navigation
 				switch windows directly=alt+tab
		custom shortcuts
			open terminal

	battery settings
		balanced ->	power saver
	keyboard shortcuts
		settings
		hide all normal windows
		close window

brave-browser
	bravepasswd from onedrive
  	remove all history & autofill form data on exit
	Don't allow sites to send notifications
	sync everything
	appearance=dark
		disable always show bookmarks
	enable Speedreader
	enable
		https://extensions.gnome.org/extension/1131/
		https://extensions.gnome.org/extension/1471/
	new tab page -> new tabs page shows blank page

desk changer
	profiles -> location URI
		remove item /usr/share/*
		add folder ./pictures/wallpaper
	daemon 30 min interval

printer
	Ctrl+P on brave browser
	Destination=see more
	Manage > Add > network printer > find network printer
	choose epson > forward > apply

	#print system dialog (> page setup > paper > paper size >) print

univ wifi eduroam
	authentication PEAP
	No CA certificate is required
	静大ID@shizuoka.ac.jp
	静大ID password

zoom
	settings
		video
			turn off~
		audio
			automatically~
			mute~

disable etc/bluetooth/main.conf
"""
