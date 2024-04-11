#!/bin/bash

docker run -itd --name debianlibvirt --hostname debianlibvirt --network ocrnetwork -e TZ=Asia/Ho_Chi_Minh \
    --privileged \
    --name libvirt \
    -v /tmp/libvirt:/run/libvirt \
    -v /sys/fs/cgroup:/sys/fs/cgroup \
    libvirtd:test

#    --device /dev/kvm \