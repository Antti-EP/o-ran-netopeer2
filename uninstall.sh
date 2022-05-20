if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

sudo -i
cd NetConfServer

cd o-ran-netopeer2
./unload.sh
if [$? -ne 0]
then
	echo "An error occurred unloading YANG modules"
	exit 3
fi

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


echo "Netopeer2 and its components uninstalled"
exit 0
