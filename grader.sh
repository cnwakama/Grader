#!/bin/bash

	out=soln/"${1%%.*}"-output.cpp
	echo $out
	g++ ${1} -o file.exe -Wall 2> $out
	if [ ! -f file.exe ]; then
		echo "File not found!"
		echo "Moving to no-compile dirctory"
		mkdir no-compile/"${1%%.*}"
		mv ${1} no-compile/"${1%%.*}"
		mv $out no-compile/"${1%%.*}"
		exit -1
	else
		echo "/**" >> $out
		printf "Graphs:\n" >> $out
		lines=$(head -1 input.txt) 

		for (( c=1; c<=${lines}; c++ ))
		do
			v=$((c+1))
			tail -n +$v input.txt | head -1 >> $out
			tail -n +$v input.txt | head -1 | ./file.exe >> $out
			echo "\n" >> $out
		done
		
			
		echo "*/" >> $out
		cat ${1} >> $out
		rm file.exe
		echo "Finished"

	fi
