#!/bin/bash

CUDA_VISIBLE_DEVICES=0 python ./src/train_bash.py \
    --stage sft \
    --do_train \
    --model_name_or_path ../model/phi-2 \
    --dataset universal_ner_all \
    --dataset_dir ./data \
    --template default \
    --finetuning_type lora \
    --lora_target q_proj,v_proj,k_proj,dense \
    --lora_rank 32 \
    --lora_alpha 32 \
    --output_dir ../../saves/phi-2_sft/lora \
    --overwrite_cache \
    --overwrite_output_dir \
    --cutoff_len 1536 \
    --preprocessing_num_workers 16 \
    --per_device_train_batch_size 1 \
    --per_device_eval_batch_size 1 \
    --gradient_accumulation_steps 32 \
    --lr_scheduler_type cosine \
    --logging_steps 10 \
    --warmup_steps 100 \
    --save_steps 2000 \
    --eval_steps 1000 \
    --evaluation_strategy steps \
    --load_best_model_at_end \
    --learning_rate 5e-5 \
    --num_train_epochs 3.0 \
    --val_size 0.1 \
    --plot_loss \
    --fp16 \
    --report_to_wandb