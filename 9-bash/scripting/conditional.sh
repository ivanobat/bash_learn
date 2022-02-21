#!/bin/bash

echo "This script only demonstrates conditional"
set var
var=1
if (( $var==1 ))
then
	echo "first condition satisified"
elif [ $var -eq 2 ]
then
	echo "second condition satisified"
else
	echo "third condition satisified"
fi
