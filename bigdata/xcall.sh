#!/bin/bash

pcount=$#
if ((pcount == 0)); then
    echo no args
    exit
fi

for ((host = 1; host <= 3; host++)); do
    echo ----------m0$host---------
    ssh m0$host $@
done
