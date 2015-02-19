#!/bin/bash

for myNumber in {1..10}
do
    if [ `diskutil info /dev/disk${myNumber} | grep -wc SDXC` -ge 1 ]
    then
        echo "Found one"
        diskutil unmountDisk force /dev/disk${myNumber}
    else
        echo "Not /dev/disk${myNumber}"
    fi
done