#!/bin/bash

NUMBER1=$1
NUMBER2=$2
TIMESTAMP=$(date)
echo "script executed:$(date)"    
SUM=$(($NUMBER1+$NUMBER2))
echo "sum of $NUMBER1 AND $NUMBER2:$SUM"
