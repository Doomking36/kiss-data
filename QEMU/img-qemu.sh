#!/bin/bash



echo "Welcome to QEMU Image Creator"

echo "Enter the format (raw or qcow2):"
read format

echo "Enter the name of the file"
read name

echo "Enter the extension (img or qcow2):"
read ext

echo "Enter the size (e.g. 100M or 20G):"
read size


qemu-img create -f $format $name.$ext $size
