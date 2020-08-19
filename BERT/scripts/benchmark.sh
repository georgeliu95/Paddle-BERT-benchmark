#!/bin/bash

set -xe

fp=false
if [ $1 -eq 16 ] ; then
  fp=true
fi
BATCH_SIZE=${2:-8}


export CUDA_VISIBLE_DEVICES=3
# pretrain config
SAVE_STEPS=100
LR_RATE=1e-4
WEIGHT_DECAY=0.01
MAX_LEN=128
TRAIN_DATA_DIR=data/train
VALIDATION_DATA_DIR=data/validation
CONFIG_PATH=data/demo_config/bert_config.json
VOCAB_PATH=data/demo_config/vocab.txt
# Change your train arguments:
#nsys profile -o output.qdrep python -u ./benchmark.py ${is_distributed}\
python -u ./benchmark.py ${is_distributed} \
    --use_cuda true \
    --weight_sharing true \
    --batch_size ${BATCH_SIZE} \
    --data_dir ${TRAIN_DATA_DIR} \
    --validation_set_dir ${VALIDATION_DATA_DIR} \
    --bert_config_path ${CONFIG_PATH} \
    --vocab_path ${VOCAB_PATH} \
    --generate_neg_sample true \
    --checkpoints ./output \
    --save_steps ${SAVE_STEPS} \
    --learning_rate ${LR_RATE} \
    --weight_decay ${WEIGHT_DECAY:-0} \
    --max_seq_len ${MAX_LEN} \
    --skip_steps 1 \
    --validation_steps 1000 \
    --num_iteration_per_drop_scope 10 \
    --use_fp16 $fp \
    --verbose true \

       
