#!/bin/bash

set -e
#set +e # continue execute script in spite of command fail
#set -u
done=no
exitval=0

namescrpit=${0:2}

function help() {
  echo "Usage: ${namescrpit} <physInterface> <interfaceName>
  Note: This script need sudo permission to execute."
  exit ${exitval}
}

numberArgs="2"
[[ ${1} = "-h" || -z ${1} || "$#" -lt ${numberArgs} ]] && {
  echo "Missing arguments."
  help
}

physInterface=${1}
interfaceName=${2}
interfaceConfig="
<network>
  <name>${interfaceName}</name>
  <forward mode=\"bridge\">
    <interface dev=\"${physInterface}\"/>
  </forward>
</network>"

echo "$interfaceConfig" > /etc/libvirt/qemu/networks/${interfaceName}-def.xml
virsh net-define /etc/libvirt/qemu/networks/${interfaceName}-def.xml
virsh net-autostart ${interfaceName}
virsh net-start ${interfaceName}
virsh net-list
