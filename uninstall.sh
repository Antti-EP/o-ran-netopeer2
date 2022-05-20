#!/bin/bash
set -e

if [ "$EUID" -ne 0 ];
  then echo "Please run as root"
  exit
fi

cd /root/NetConfServer

cd o-ran-netopeer2
set +e
./unload.sh
set -e
cd ..

cd netopeer2/scripts
./remove.sh
cd ../build
make uninstall
cd ../..

cd libnetconf2/build
make uninstall
cd ../..

cd sysrepo/build
make uninstall
cd ../..

cd libyang/build
make uninstall
cd ../..

cd ..
rm NetConfServer -r


echo "Netopeer2 and its components uninstalled. If you want to reinstall, you first need to restart to clear SHM."
exit 0
