#/bin/bash

mem=$(free -g | sed -n '2p' | awk '{usage=($3)*100/($2)} END {print usage}')
topn=$(ps -aeo 'pid,%mem,comm' --sort=-%mem | head -n 11)
topn=${topn//$'\n'/\\r}

printf '{"text":"%-.0f%%","tooltip":"%s"}' "$mem" "$topn"
