#!/bin/bash

docker run -it --rm\
  --name pad-bert  \
  --gpus device=$NV_VISIBLE_DEVICES \
  --shm-size=1g \
  --ulimit memlock=-1 \
  --ulimit stack=67108864 \
  -v $PWD/BERT:/paddle \
  -v ~/Downloads/tmp:/paddle/requirements \
  --security-opt seccomp=default_with_perf.json \
  hub.baidubce.com/paddlepaddle/paddle:1.8.3-gpu-cuda10.0-cudnn7 /bin/bash

  # modify line 10 if needed