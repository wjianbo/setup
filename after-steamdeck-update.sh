sudo steamos-readonly disable
sudo pacman -S --noconfirm pipewire-media-session
bash ./audio-support.sh
# Fix linker `cc` not found error (When `cargo run`)
# sudo pacman -Syu 
# sudo pacman -Ss gcc
# sudo pacman -S --noconfirm  gcc
# Install rdesktop
# sudo pacman -S --noconfirm rdesktop 
# Add l2tp support
# sudo pacman -S --noconfirm xl2tpd strongswan networkmanager-l2tp
# systemctl restart NetworkManager
sudo steamos-readonly enable
