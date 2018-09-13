#!/bin/bash
#
# Reveal hosts and find exploits in a subnet
# https://github.com/Jimmmbo/Reveal

name='Reveal / A Revval cli app'
version='v0.1.0'
author='Jimi de Munck'
repository='https://github.com/Revval'
description='Reveal - Host discovery and recon tool'

export PATH="/usr/bin"

if [[ $EUID -ne 0 ]]; then
	echo "This script must be run as root" 1>&2
	exit 1
fi

# it should check here if nmap and arping are installed or otherwise install them


# Make a function here that installs arping 


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

	echo "Subnet being scanned:"
}


function scanARP() {
	arping -I $1 $2 -c 1 | grep 'Unicast reply' | cut -d' ' -f4,5
}

if subnet_scan = 0; then
	echo -e "Did you enter a legit subnet? Please check again."
else 
	scanARP &
	echo -e "Scanning... Please wait..."
fi


