#!/bin/sh
while true
do
  d=`date`
  echo "Datefile 1:"
  cat /nfs/general/datefile.txt
  echo "Datefile 2:"
  cat /nfs/general/datefile2.txt
  sleep 1
done
