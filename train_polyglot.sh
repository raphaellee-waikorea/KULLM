python -m torch.distributed.launch  --master_port=34322  --nproc_per_node 4 finetune_args.py \
    --fp16 \
    --base_model 'EleutherAI/polyglot-ko-12.8b' \
    --data_path data/user_oriented_instructions_train.jsonl \
    --output_dir ckpt/$SAVE_DIR \
    --batch_size 128 \
    --micro_batch_size 4 \
    --num_epochs $EPOCH \
    --learning_rate $LR \
    --cutoff_len 512 \
    --val_set_size 2000 \
    --lora_r 8 \
    --lora_alpha 16 \
    --lora_dropout 0.05 \
    --lora_target_modules '[q_proj,k_proj,v_proj,o_proj]' \
    --train_on_inputs \
    --logging_steps 1 \
    --eval_steps 40 \
    --weight_decay 0. \
    --warmup_steps 0 \
    --warmup_ratio 0.03 \
    --lr_scheduler_type "cosine" \
    --group_by_length
