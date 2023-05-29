#nmcli radio wifi
#nmcli device wifi list
#nmcli device wifi connect $SSID password $password

#edit & mv files-----------------------------
mv bashrc .bashrc
sudo mv dnf.conf /etc/dnf
sudo mv custom.conf /etc/gdm/

mkdir downloads

sudo dnf -y update
sudo dnf -y upgrade

#install-----------------------------
sudo dnf -y install dnf-plugins-core
sudo dnf -y config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

packages=(
	brave-browser
	emacs-nox
	ibus-mozc
	neofetch
	mpg123
	pip
	python-tkinter
	R-core
	ranger
	xfce4-terminal
	xrandr
	xorg-x11-server-Xorg
)

for i in "${packages[@]}"; do sudo dnf -yq install "$i"; done

#sudo dnf -y install java-11-openjdk-devel
#sudo dnf -y install x11vnc

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
sudo dnf -y install nodejs
mv vimrc .vimrc

#configure system settings-----------------------------
xrandr --output HDMI-1 --left-of eDP-1 
timedatectl set-timezone Asia/Tokyo

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
brave-browser
	bravepasswd from onedrive
  	remove all history & autofill form data on exit
	Don't allow sites to send notifications
	sync everything
	appearance=dark
		disable Always show bookmarks on new tab page
	enable Speedreader
	enable
		https://extensions.gnome.org/extension/1471/
	new tab page -> new tabs page shows blank page

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
