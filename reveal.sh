#!/bin/bash
#
# Reveal networks assets with Revval
# and find exploits
# https://github.com/Jimmmbo

name='Reveal / A Revval cli app'
version='v0.1.0'
author='Jimi de Munck'
repository='https://github.com/Revval'
description='Reveal - Host discovery and exploitation tool'

export PATH="/usr/bin"

if [[ $EUID -ne 0 ]]; then
	echo "This script must be run as root" 1>&2
	exit 1
fi

function subnet_scan() {
	local ip=$1
	local stat=1

	echo -e "Enter /24 subnet that needs to be scanned: " 
	read subnet 
	if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\. ]]; then
		#Internal field seperator for parsing dots seperated
		OIFS=$IFS
		IFS='.'
		ip=($ip)
		IFS=$OIFS
		[[ ${ip[0]} -le 255 && ${ip[1]} -le 255 && ${ip[2]} -le 255 ]]
		stat=$?
	fi
	return $stat

	echo "Subnet being scanned: "
}

for ip in $ips
do 
	if valid_ip $ip; then stat='good'; else stat='bad'; fi
		printf "%-20s: %s\n" "$ip" "$stat"
done


#function scanARP() {
#	arping -I $1 $2 -c 1 | grep 'Unicast reply' | cut -d' ' -f4,5
#}

subnet_scan

echo -e "Scanning... Please wait..."

