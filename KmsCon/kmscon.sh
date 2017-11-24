sudo pacman -S --noconfirm kmscon
sudo cp -vi *.service /usr/lib/systemd/system || exit

systemctl disable getty@tty1.service
systemctl enable kmsconvt@tty1.service

sudo ln -s /usr/lib/systemd/system/kmsconvt\@.service /etc/systemd/system/autovt\@.service1
sudo usermod $USER -aG audio
