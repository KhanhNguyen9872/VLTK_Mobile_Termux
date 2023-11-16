#!/data/data/com.termux/files/usr/bin/bash

echo "Y" | termux-setup-storage >/dev/null 2>&1

echo "Updating package..."
printf "deb https://packages-cf.termux.org/apt/termux-main/ stable main\n" > /data/data/com.termux/files/usr/etc/apt/source.list 2>/dev/null || exit 1
printf "deb https://packages-cf.termux.dev/apt/termux-root root stable\n" >> /data/data/com.termux/files/usr/etc/apt/source.list 2>/dev/null || exit 1
printf "deb https://packages-cf.termux.dev/apt/termux-x11 x11 main\n" >> /data/data/com.termux/files/usr/etc/apt/source.list 2>/dev/null || exit 1
apt update -y;
apt upgrade -y;
apt install wget proot -y || exit 1

cd ~/
echo "Downloading server data...."
wget -q --show-progress -O VLTK.tar.xz https://github.com/KhanhNguyen9872/VLTK_Mobile_Termux/releases/download/data/VLTK.tar.xz || { echo "Network Error"; exit 1; }
wget -q --show-progress -O VLTK.sha512sum https://github.com/KhanhNguyen9872/VLTK_Mobile_Termux/releases/download/data/VLTK.sha512sum || { echo "Network Error"; exit 1; }

echo "Verifying data..."
sha512sum VLTK.sha512sum || exit 1

cd /data/data/com.termux/files/usr/share
echo "Installing server..."
tar -xJf ~/VLTK.tar.xz 2>/dev/null
rm -rf ~/VLTK.tar.xz 2>/dev/null

cd ~/
echo "Setting up config...."
wget -q --show-progress -O start.sh https://github.com/KhanhNguyen9872/VLTK_Mobile_Termux/raw/main/conf/start.sh
mv start.sh /data/data/com.termux/files/usr/bin/
chmod 777 /data/data/com.termux/files/usr/bin/start.sh

echo "Done!"
echo "Use: [start] command for login to server!"
echo "And then use [start-server] in server to start VLTK server"
exit 0