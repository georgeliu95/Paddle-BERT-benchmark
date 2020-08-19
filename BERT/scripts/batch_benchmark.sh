#!/bin/bash
bsz=8
file="report/benchmark/e-batch/bench-${1}-${2}.log"
touch $file
echo "[Test] seq_len=128 batch_size=$bsz clock at 1530 MHz " > $file
for i in 0 1 2 3 4 5 6 7 8 9
do
    if [ $2 -eq 1 ];then
        nsys profile -c cudaProfilerApi -t nvtx,cuda -w true -o report/benchmark/e-batch/fp${1}-$i bash benchmark.sh $1 $bsz | grep Ten-batch >> $file
    else
        bash benchmark.sh $1 $bsz | grep Ten-batch >> $file
    fi
done