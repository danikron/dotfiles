#! /bin/sh

VPN_IF=PWG
VPN_CHECK="curl -sS https://ipleak.net/json/ --max-time 2 | jq -r '.isp_name'"
VPN_CHECK_FILTER="grep 'Datacamp Limited\|Bahnhof AB'"
POLL_INTERVAL=15
poll_delay_tick=0

while true; do

	vpn_up=$(ip link | grep ${VPN_IF})

	if [[ $vpn_up && $poll_delay_tick == 0 ]]; then
		vpn_check_result=$(eval ${VPN_CHECK} 2> /tmp/vpn_err)
		vpn_connected=$(printf '%s' "${vpn_check_result}" | eval ${VPN_CHECK_FILTER})
		#echo "Check ran"
	fi

	if [[ $vpn_up && $vpn_connected ]]; then
		vpn_state="Connected"
		poll_delay_tick=$(((poll_delay_tick + 1) % POLL_INTERVAL))
	elif [[ $vpn_up ]] ; then
		vpn_state="Error"
		poll_delay_tick=0
	else
		vpn_state="Disconnected"
		unset vpn_check_result
		poll_delay_tick=0
	fi

	echo "$VPN_IF: $vpn_state" > /tmp/vpn_state

	#Debug
	#echo "$vpn_state"
	#echo "$poll_delay_tick"
	#echo "$vpn_check_result"

	sleep 1

done
