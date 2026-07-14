# magisk-swapspace

This module allows for creating a persistent swap space on android 

## Installation:
* [Download the module archive here](https://github.com/chkndrp/magisk-swapspace/releases/latest/download/magiskswapspace.zip)
* Flash it in magisk app, or using command line
* Run `magiskswap` in your preferred terminal app (as a root user)

## Usage:
```
magisk-swapspace by chkndrp ⓒ GPLv3 license
usage: magiskswap <COMMAND> <VALUE> [OPTIONAL]

create <size: GB> [priority] [preserve]
  - Creates swapfile and swaps-on
    (?) [preserve] option enables the previously disabled swapfile

remove [preserve]
  - Permanently swaps-off and deletes swapfile
    (?) [preserve] option only disables it

status [swapon] [swapoff]
  - Prints swapfile size and status

swappiness <0-200> [show] [reset]
  - Controls how agressively Linux swaps anonymous memory

() These commands are presistent across reboots ()
```

## ⚠️ Warning ⚠️
- Using on-disk `swap` on flash chips is **not recomended** and could result in highly reduced lifespan.

## Requirements
- Magisk 27.O+ 
- KernelSU v0.9.4+
