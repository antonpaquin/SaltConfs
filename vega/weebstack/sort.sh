#!/bin/bash
conf='sort.conf'
while read line; do
	if [ -z "$line" ] || [ ${line:0:1} == '#' ] ; then
		continue
	fi
	sname=`echo $line | grep -oiP '^[^|]*'`
	ssed=`echo $line | grep -oiP '(?<=| )s/[^/]*/[^/]*/(?= | )'`
	sloc=`echo $line | grep -oiP '(?<=| )[^|]*$'`	
	sloc=${sloc:1}	
	for file in ./complete/*; do
		test -h "$file" && continue 
		if [[ `echo $file | grep -ioP "$sname"` ]] ; then
			oname=`echo $file | sed -r "$ssed"`
			opath="/home/pi/drive/Media/""$sloc""/$oname"	
			mv "$file" "$opath" 
			ln -s "$opath" "$file"	
		fi
	done
done < $conf
