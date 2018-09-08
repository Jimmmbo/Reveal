#!/bin/bash
#
# Reveal networks assets with Revval
# and find exploits
# https://github.com/Jimmmbo

name='Reveal / A Revval cli app'
version='v0.1.0'
author='Jimi de Munck'
repository='https://github.com/Revval'

function user() {
	if [ $(id -u) != "0" ]; then
		warn "Please run this script with root user!" "true"
	fi
}
