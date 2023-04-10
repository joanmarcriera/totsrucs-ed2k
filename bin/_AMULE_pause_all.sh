echo Downloading
for i in $(AMC Show  DL |grep Downloading -B1 |grep -Ev "Downloading|\-\-" |cut -f3 -d' ' ); do AMC pause $i ; done
echo Waiting
for i in $(AMC Show  DL |grep Waiting -B1 |grep -Ev "Waiting|\-\-" |cut -f3 -d' ' ); do AMC pause $i ; done
