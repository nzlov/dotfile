#/bin/bash

#Requires LenovoLegionLinux Driver

fan1=$(sensors | awk '/Fan 1/ {print $3}')
fan2=$(sensors | awk '/Fan 2/ {print $3}')
cpu=$(sensors | grep CPU | grep -Eo '[0-9]+?([.][0-9+])?')
gpu=$(sensors | grep GPU | grep -Eo '[0-9]+?([.][0-9+])?')
ic=$(sensors | grep IC | grep -Eo '[0-9]+?([.][0-9+])?')

printf '{"text":"%s°C %s°C","tooltip":"cpu:%s°C\rgpu:%s°C\rfan1:%sRPM\rfan2:%sRPM"}' "$cpu" "$gpu" "$cpu" "$gpu" "$fan1" "$fan2"
