Tye () {
	ip_address=([1]='google.com' [2]='github.com' [4]='gitlab.com')
	count_number=0
	test_numbers=0
	for ip in ${ip_address[*]}
		do
			ping -q -c2 $ip < /dev/null
			if [ $? -eq 0 ]
				then
					echo "test on $ip is passed"
					test_number=$((test_number + 1))
				else
					echo "ip not founded"
				fi
			echo "GET $ip"
			count_number=$((count_number + 1))
	done
	reach_number=$(($count_number))
	if [ $reach_number != $test_number ]
		then
			echo -e "\033[0;31m $(($reach_number - $test_number)) is diden get"
		fi
	echo -e "\033[0;32m$test_number test gets"
}

get_system_info () {
	ifconfig_text=$(ifconfig)
	return_to=$(python3 find_pi_add.py $ifconfig_text)
	echo "your ip_address is $return_to"
}

test_Wifi () {
	ip_address=([1]='google.com' [2]='github.com' [4]='gitlab.com')
	for ip in ${ip_address[*]}
		do
			ping -q -c2 $ip > /dev/null
			if [ $? -eq 0 ]
				then
					echo "test passed on $ip"
				else
					echo "wifi not_connected"
					exit
				fi
	done
	get_system_info
}

test_Wifi
