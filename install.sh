#!/data/data/com.termux/files/usr/bin/bash

echo "Y" | termux-setup-storage >/dev/null 2>&1

echo "Updating package..."
printf "deb https://packages-cf.termux.org/apt/termux-main/ stable main\n" > /data/data/com.termux/files/usr/etc/apt/source.list 2>/dev/null || exit 1
printf "deb https://packages-cf.termux.dev/apt/termux-root root stable\n" >> /data/data/com.termux/files/usr/etc/apt/source.list 2>/dev/null || exit 1
printf "deb https://packages-cf.termux.dev/apt/termux-x11 x11 main\n" >> /data/data/com.termux/files/usr/etc/apt/source.list 2>/dev/null || exit 1
apt update -y;
apt upgrade -y;
apt update -y;
apt install wget proot -y || exit 1

clear
echo "Downloading server data...."
cd ~/
wget -q --show-progress -O VLTK.tar.xz https://github.com/KhanhNguyen9872/VLTK_Mobile_Termux/releases/download/data/VLTK.tar.xz || { echo "Network Error"; exit 1; }
wget -q --show-progress -O VLTK.sha512sum https://github.com/KhanhNguyen9872/VLTK_Mobile_Termux/releases/download/data/VLTK.sha512sum || { echo "Network Error"; exit 1; }

clear
echo "Verifying data..."
sha512sum -c VLTK.sha512sum || exit 1
rm -rf ~/VLTK.sha512sum 2>/dev/null

clear
echo "Installing server..."
cd /data/data/com.termux/files/usr/share
tar -xJf ~/VLTK.tar.xz 2>/dev/null
rm -rf ~/VLTK.tar.xz 2>/dev/null

clear
echo "Setting up config...."
cd ~/
wget -q --show-progress -O start.sh https://github.com/KhanhNguyen9872/VLTK_Mobile_Termux/raw/main/conf/start.sh 2>/dev/null
rm -rf /data/data/com.termux/files/usr/bin/start 2>/dev/null
mv start.sh /data/data/com.termux/files/usr/bin/start
chmod 777 /data/data/com.termux/files/usr/bin/start

echo "Done!"
echo "Use: [start] command for login to server!"
echo "And then use [start-server] in server to start VLTK server"
exit 0