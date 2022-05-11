# Installing Netopeer2 with O-RAN YANG modules

This was done on Ubuntu 22.04 LTS


## Requirements

```
$ sudo apt-get update
$ sudo apt-get install git cmake build-essential bison flex libpcre3-dev libev-dev libavl-dev libprotobuf-c-dev protobuf-c-compiler swig python3-dev lua5.2 pkg-config libpcre++-dev openssl libssl-dev libcrypto++-dev zlib1g-dev
```

libssh

```
$ git clone https://git.libssh.org/projects/libssh.git/


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
$ mkdir build && cd build && cmake ..
$ make
$ make install
$ cd ..
```

Install sysrepo

```
$ git clone https://github.com/sysrepo/sysrepo.git
$ cd sysrepo
$ mkdir build && cd build && cmake ..
$ make
$ make install
$ cd ..
```

Install libnetconf2

```
$ git clone https://github.com/CESNET/libnetconf2.git
$ cd libnetconf2
$ mkdir build && cd build && cmake ..
$ make
$ make install
$ cd ..
```

## O-RAN YANG modules








Install netopeer2

```
$ git clone https://github.com/CESNET/netopeer2.git
$ cd netopeer2
$ mkdir build && cd build && cmake ..
$ make
$ make install
$ cd ..
```

