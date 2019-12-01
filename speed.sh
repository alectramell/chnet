#!/bin/bash

clear

/usr/bin/time -o speeder.tmp -p ping -c 1 www.google.com

sleep 0.5

clear

echo $(cat speeder.tmp | grep "real" | sed 's/real //g') > speedstats.txt

clear

sleep 0.5
rm speeder.tmp

clear
