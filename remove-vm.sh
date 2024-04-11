#!/bin/bash

set -e
#set +e # continue execute script in spite of command fail
#set -u
exitval=0

namescrpit=${0:2}

function help() {
  echo "Usage: ${namescrpit} <vm_name>
  Note: This script need sudo permission to execute."
  exit ${exitval}
}

numberArgs="1"
[[ ${1} = "-h" || -z ${1} || "$#" -lt ${numberArgs} ]] && {
  echo "Missing arguments."
  help
}

vm_name=${1}
dataPath=$(virsh domstats "${vm_name}" | grep path | cut -d "=" -f 2)

virsh list --all
#virsh dumpxml VM_NAME

if checkvmrunning "${vm_name}"; then
  virsh shutdown "${vm_name}"
  virsh destroy "${vm_name}"
  virsh undefine "${vm_name}"
  echo "Info: Remove ${dataPath}"
  rm -rf "${dataPath}"
else
  virsh undefine "${vm_name}"
  echo "Info: Remove ${dataPath}"
  rm -rf "${dataPath}"
fi

checkvmrunning() {
  vmName=${1}
  tmp=$(virsh list --all | grep " ${vmName} " | awk '{ print $3}')
  if ([ "x$tmp" == "x" ] || [ "x$tmp" != "xrunning" ]); then
    echo "VM does not exist or is shut down!"
    return 1
    # Try additional commands here...
  else
    echo "VM is running!"
    reurn 0
  fi
}
