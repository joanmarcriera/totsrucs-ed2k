#!/bin/sh
echo Searching for $1
amulecmd -c "search kad $1" > /dev/null
prevres=-1
matchcount=0
for c in `seq 1 10`;
do
 sleep 5
 res=`amulecmd -c "results" | grep results: | sed "s/.*results: \(.*\)$/\1/"`
 if [ $res == $prevres ]
 then
  (( matchcount += 1 ))
  if [ $matchcount -gt 1 ]
  then
   matchcount=0
   break
  fi
 else
  matchcount=0
  prevres=$res
 fi
done
