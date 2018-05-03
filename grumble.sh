#!/bin/bash

# use: grumble.sh ./urls.txt

while IFS='' read -r line || [[ -n "$line" ]]; do



   array=( $(lynx -source $line | grep document.getElementById | grep -m1 "mp3" ) )


  

#   echo ${array[*]}
   extractedurl=$( echo -n $line | cut -n -d . -f 1 | tr -d $'\n'; echo -n ".zippyshare.com"; echo -n ${array[2]} | sed 's/\"//g'; echo -n $(($(echo -n ${array[4]}; echo -n ${array[5]}; echo -n ${array[6]}; echo -n ${array[7]}; echo -n ${array[8]}; echo -n ${array[9]}; echo -n ${array[10]} ))); echo ${array[12]} | sed 's/\"//g' | sed 's/;\+$//')
   echo $extractedurl
   wget -nc $extractedurl


done < "$1"

