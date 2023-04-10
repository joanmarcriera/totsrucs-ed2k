#!/bin/bash


for i in $(cat "$1") 
do
_AMULE_add_ed2k_link.sh $i
done
