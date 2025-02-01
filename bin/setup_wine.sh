#!/bin/bash

if [ $# -eq 0 ]
then
	echo usage:
	echo setup_wine.sh prefix_name path_to_windows_setup
	echo
	echo prefix name can be like envi_wine_prefix or opus_wine_prefix
	echo location of prefix folder is ~/installs_and_builds/name_wine_prefix
	exit
fi

setup_file=$2
prefix_name=$1
prefix=~/installs_and_builds/"$prefix_name"_wine_prefix

echo prefix is 
echo $prefix

WINEPREFIX=$prefix wine $setup_file
