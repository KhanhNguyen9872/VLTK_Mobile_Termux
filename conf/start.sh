#!/data/data/com.termux/files/usr/bin/bash
unset LD_PRELOAD
cd /data/data/com.termux/files/usr/share
command="proot"
command+=" -k 4.14.81"
command+=" --link2symlink"
command+=" --kill-on-exit"
command+=" -0"
command+=" -r KhanhNguyen9872_VLTK"
command+=" -b /dev"
command+=" -b /proc"
command+=" -b /sys"
command+=" -w /root"
command+=" /usr/bin/env -i"
command+=" HOME=/root"
command+=" PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games"
command+=" TERM=$TERM"
command+=" LANG=C.UTF-8"
command+=" /bin/bash --login"
com="$@"
if [ -z "$1" ];then
    exec $command
else
    $command -c "$com"
fi
