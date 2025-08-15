#! /bin/bash

NVIDIA_SMI_PRESENT=$(which nvidia-smi 2>&1 >/dev/null && echo TRUE)

if [ $NVIDIA_SMI_PRESENT = 'TRUE' ]; then
	GPU_STATS=$(nvidia-smi --query-gpu=utilization.gpu,utilization.memory,temperature.gpu --format=csv,noheader,nounits)
	IFS=', ' read -r -a GPU_STAT_ARRAY <<< "$GPU_STATS"

	GPU=${GPU_STAT_ARRAY[0]}
	MEM=${GPU_STAT_ARRAY[1]}
	TEMP=${GPU_STAT_ARRAY[2]}

	#	printf '%s%%   %s%%   %s°C \n' "${GPU_STAT_ARRAY[0]}" "${GPU_STAT_ARRAY[1]}" "${GPU_STAT_ARRAY[2]}"
	while getopts ":gmt" opt; do
		case $opt in
			g)
				printf '  %s%%\n' "${GPU}"
				exit
				;;
			m)
				printf '  %s%%\n' "${MEM}"
				exit
				;;
			t)
				printf ' %s°C\n' "${TEMP}"
				exit
				;;
		esac
	done

	printf '  %s%%    %s%%    %s°C\n' "${GPU}" "${MEM}" "${TEMP}"
fi
