for i in $(AMC Show  DL |grep Paused -B1 |grep -Ev "Paused|\-\-" |cut -f3 -d' ' ); do AMC resume $i ; done
