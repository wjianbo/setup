# sudo rm /etc/openmpi/openmpi-default-hostfile 
# sudo rm /etc/openmpi/openmpi-mca-params.conf 
# sudo rm /etc/openmpi/openmpi-totalview.tcl 
# sudo rm /etc/xdg/Xwayland-session.d/00-pulseaudio-x11 
# sudo rm /etc/xdg/autostart/pulseaudio.desktop 
# sudo steamos-readonly disable
sudo pacman -S --noconfirm pulseaudio
sudo pacman -S --noconfirm pulseaudio-bluetooth
# sudo steamos-readonly enable
