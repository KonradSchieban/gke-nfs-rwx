#!/bin/sh
while true
do
  d=`date`
  echo $d >> /nfs/general/datefile.txt
  sleep 1
done
