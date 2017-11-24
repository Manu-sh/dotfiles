sudo pacman -S --noconfirm kmscon
systemctl disable getty@tty1.service
systemctl enable kmsconvt@tty1.service
sudo ln -s /usr/lib/systemd/system/kmsconvt\@.service /etc/systemd/system/autovt\@.service1
sudo usermod $USER -aG audio



