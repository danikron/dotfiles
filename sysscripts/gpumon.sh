#! /bin/bash

NVIDIA_SMI_PRESENT=$(which nvidia-smi 2>&1 >/dev/null && echo TRUE)

if [ $NVIDIA_SMI_PRESENT = 'TRUE' ]; then
	GPU_STATS=$(nvidia-smi --query-gpu=utilization.gpu,utilization.memory,temperature.gpu --format=csv,noheader,nounits)
	IFS=', ' read -r -a GPU_STAT_ARRAY <<< "$GPU_STATS"

	printf '%s%%  %s%%  %s°C \n' "${GPU_STAT_ARRAY[0]}" "${GPU_STAT_ARRAY[1]}" "${GPU_STAT_ARRAY[2]}"
fi
