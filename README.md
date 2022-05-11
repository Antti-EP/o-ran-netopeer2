# Installing Netopeer2 with O-RAN YANG modules

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

Clone the repository (Not necessarily into root)

```
$ git clone https://github.com/Antti-EP/o-ran-netopeer2.git
$ cd o-ran-netopeer2
```

Install the YANG modules:

```
$ sudo ./load.sh
```

Note: At this point o-ran-shared-cell.yang always fails, as it requires a missing YANG module o-ran-common-yang-types.yang. Just ignore the message for now.

Check that the O-RAN modules are installed and found in the sysrepo module list:
```
$ sudo sysrepoctl -l
```

## Netopeer2 installation

Install netopeer2

```
$ sudo -i
$ cd NetConfServer

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
$ sudo netopeer2-server -d -v3
```

Open another terminal in the /o-ran-netopeer2 directory and run the netopeer2 client with:

```
$ sudo netopeer2-cli

> connect
```

Test the connection:

```
> get-config --source running
```

Should return a config XML 

## Enable SSH Call Home

```
> edit-config --target running --
``













