#!/bin/sh

NUM=2
# LOOP : max container - 1
LOOP=499

docker run -d --name iperf3s --network iperf3bridge teppei39/iperf3 iperf3 -s

for i in `seq 1 $LOOP`
do

  printf "%d," $NUM >> throughputs500.csv

  docker run -d --rm --network iperf3bridge -v /home/hashimoto/LabDocuments/Measure/Test/:/home/ -w /home/ teppei39/python_iperf3 sh iperf3_loop.sh

sleep 120s

  NUM=`expr $NUM \+ 1`
done
