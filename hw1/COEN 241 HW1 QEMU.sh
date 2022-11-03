#! /bin/bash
#install ubuntu
sudo apt update
sudo apt install ubuntu-desktop
sudo reboot
#test CPU
sysbench --test=cpu --cpu-max-prime=25000 run
#test IO
sysbench --num-threads=16 --test=fileio --file-total-size=3G --file-test-mode=rndrw prepare 
sysbench --num-threads=16 --test=fileio --file-total-size=3G --file-test-mode=rndrw run 
sysbench --num-threads=16 --test=fileio --file-total-size=3G --file-test-mode=rndrw cleanup
#test disk utilization
df -h
df -m