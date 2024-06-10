qemu-system-x86_64 -enable-kvm -bios ~/kvm/OVMF/OVMF.fd -m 4096 -smp 4 -cpu host -hda kiss_vm.qcow2 -nic user,hostfwd=tcp::5555-:22 -boot d &
