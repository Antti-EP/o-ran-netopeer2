# Installing Netopeer2 with O-RAN YANG modules


HOX! Installer script can be found in Teams O-RAN Study team files.
It does all the steps below up to "Start Netopeer2".








This was done on Ubuntu 22.04 LTS


## Requirements

```
$ sudo apt-get update
$ sudo apt-get install git cmake build-essential bison flex libpcre3-dev libev-dev libavl-dev libprotobuf-c-dev protobuf-c-compiler swig python3-dev lua5.2 pkg-config libpcre++-dev openssl libssl-dev libcrypto++-dev zlib1g-dev
```

libssh and libpcre2

```
$ sudo apt-get install libssh-4 libssh-dev libssh2-1-dev libssh2-1 libpcre2-dev
```

Set up server folder at root:

```
$ sudo -i
$ mkdir NetConfServer
$ cd NetConfServer
```

Install libyang

```
$ git clone https://github.com/CESNET/libyang.git
$ cd libyang
$ mkdir build && cd build 
$ cmake ..
$ make
$ make install
$ cd ../..
```

Install sysrepo

```
$ git clone https://github.com/sysrepo/sysrepo.git
$ cd sysrepo
$ mkdir build && cd build 
$ cmake ..
$ make
$ make install
$ cd ../..
```

Install libnetconf2

```
$ git clone https://github.com/CESNET/libnetconf2.git
$ cd libnetconf2
$ mkdir build && cd build 
$ cmake ..
$ make
$ make install
$ cd ../..
```

## Testing

Run ldconfig and test if sysrepo is correctly installed:

```
$ ldconfig
$ sysrepocfg -h
```

## O-RAN YANG modules

Clone the repository

```
$ git clone https://github.com/Antti-EP/o-ran-netopeer2.git
$ cd o-ran-netopeer2
```

Install the YANG modules:

```
$ ./load.sh
```

Note: At this point o-ran-shared-cell.yang always fails, as it requires a missing YANG module o-ran-common-yang-types.yang. Just ignore the message for now.

If you encounter "[ERR] Shared memory version mismatch (9, expected 10), remove the SHM to fix.", restart linux and try again.


Check that the O-RAN modules are installed and found in the sysrepo module list:
```
$ sysrepoctl -l
```

## Netopeer2 installation

Install netopeer2

```
$ cd ..
$ git clone https://github.com/CESNET/netopeer2.git
$ cd netopeer2
$ mkdir build && cd build 
$ cmake ..
$ make
$ make install
$ cd ../..
```

Test if the installation was successful:
```
$ netopeer2-server -h
```

## Start netopeer2

Start the netopeer2 server: (If you don't want the verbosity, remove -d -v3)

```
$ netopeer2-server -d -v3
```

Open another terminal in the /o-ran-netopeer2 directory and run the netopeer2 client with:

```
$ sudo -i
$ cd NetConfServer/o-ran-netopeer2
$ netopeer2-cli

> connect
```

If you get the "Unable to authenticate to the remote server" while trying to connect as root, you might need to change your root password.
(https://github.com/CESNET/Netopeer2/issues/453)

Test the connection:

```
> get-config --source running
```

Should return a config XML 

## Enable SSH Call Home

```
> edit-config --target running --config=ssh_callhome.xml
```

Test if Call Home works:

```
> disconnect
> listen
```

## Test RPC 

Open another terminal to run the test RPC subscriber.

```
sudo -i
cd NetConfServer/o-ran-netopeer2/test
./rpc_sub /o-ran-operations:reset
```

In the netopeer2-cli terminal, run:

```
user-rpc --content test/rpc.xml
```

The test server should return "OK" and the subscriber terminal should show:

```
 ========= RPC "/o-ran-operations:reset" RECEIVED: =======================
```








