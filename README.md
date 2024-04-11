# vmKvm-utils
Script to deploy kvm virtual machine through commandline &lt;3

- Create macvtap interface for VMs:\
    create-macvtap.sh <physInterface> <interfaceName>

- Deploy a VM:\
    deploy-vm.sh <vm_name> <cpus> <ram(MB)> <disk_path> <network_interface> <vmOs>

- Remove a VM:\
    remove-vm.sh <vm_name> <disk_path>

*** docs:
- virt-install: https://linux.die.net/man/1/virt-install , https://manpages.ubuntu.com/manpages/trusty/man1/virt-install.1.html
- debian kvm: https://wiki.debian.org/KVM
- libvirtd: https://libvirt.org/manpages/libvirtd.html#system-socket-activation
