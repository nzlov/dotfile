#/bin/bash

cpu=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage }')
topn=$(ps -ao 'pid,%cpu,comm' --sort=-%cpu | head -n 11)
topn=${topn//$'\n'/\\r}

printf '{"text":"%-.0f%%","tooltip":"%s"}' "$cpu" "$topn"
