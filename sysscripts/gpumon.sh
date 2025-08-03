#! /bin/bash

GPU_STATS=$(nvidia-smi --query-gpu=utilization.gpu,utilization.memory,temperature.gpu --format=csv,noheader,nounits)
IFS=', ' read -r -a GPU_STAT_ARRAY <<< "$GPU_STATS"

printf '%s%%  %s%%  %s°C \n' "${GPU_STAT_ARRAY[0]}" "${GPU_STAT_ARRAY[1]}" "${GPU_STAT_ARRAY[2]}"
