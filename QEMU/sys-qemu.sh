#!/bin/sh

echo "Enter amount for memory size"
read mem

echo "Enter number of cpu"
read cpu

echo "Enter img disk"
read disk

echo "Enter iso"
read iso



qemu-system-x86_64 -enable-kvm -m $mem -smp $cpu -cpu host -hda $disk -cdrom $iso -boot d
