#!/bin/sh

sum=0

iperf3 -s -D

for var in 0 1 2 3 4 5 6 7 8 9
do
  iperf3 -c iperf3s -J -t 10 > test.json
  sum=`echo "$sum + $(python extract.py)" | bc`
done

echo "$sum / 10" | bc >> throughputs500.csv

tail -f /dev/null 
