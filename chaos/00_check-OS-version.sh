#!/usr/bin/bash
#$ -S /usr/bin/bash

set -euo pipefail

echo
date
echo "========== Executing $(basename $0) =========="
cd $(dirname $0)


# Check kernel version
echo
echo -----
echo "Kernel version :"
cat /proc/version || uname -a
wait

#  Check the OS version
echo -----
echo "OS version :"
# For Debian
[ -f /etc/debian_version ] && cat /etc/debian_version
# For CentOS/RedHat
[ -f /etc/redhat-release ] && cat /etc/redhat-release
# For Fedora
[ -f /etc/fedora-release ] && cat /etc/fedora-version
echo
