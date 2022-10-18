#! /bin/bash

#install ubuntu
docker pull ubuntu

#install sysbench
docker pull ljishen/sysbench

#test CPU
docker run ociotec/sysbench:arm32v7 sysbench --test=cpu --cpu-max-prime=25000 run

#test IO
# generate testing files
sysbench fileio --threads=16 --file-total-size=10G --file-test-mode=rndrw prepare
#run files
sysbench fileio --threads=16 --file-total-size=10G --file-test-mode=rndrw run

#test disk utilization
df -h

