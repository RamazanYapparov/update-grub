#! /bin/bash
if [[ $# -eq 0 ]] ; then
    echo 'Please provide a filename, example: /dev/sda1'
    exit 1
fi

mount $1 /mnt && \
mount --bind /dev /mnt/dev && \
mount --bind /proc /mnt/proc && \
mount --bind /sys /mnt/sys && \

chroot /mnt && grub-install /dev/sda --target=i386-pc && \
umount /mnt/dev && \
umount /mnt/proc && \
umount /mnt/sys && \
umount /mnt
echo 'Everything shoud be ok!'
exit 0
