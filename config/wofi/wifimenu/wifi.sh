#!/usr/bin/env bash

conf=~/.config/wofi/wifimenu

# this prints a beautifully formatted list. bash was a mistake
LIST=$(nmcli --fields SSID,SECURITY,BARS device wifi list | sed '/^--/d' | sed 1d | sed -E "s/WPA*.?\S/~~/g" | sed "s/~~ ~~/~~/g;s/802\.1X//g;s/--/~~/g;s/  *~/~/g;s/~  */~/g;s/_/ /g" | column -t -s '~')

# get current connection status
CONSTATE=$(nmcli -fields WIFI g)
if [[ "$CONSTATE" =~ "enabled" ]]; then
  TOGGLE="Disable WiFi  "
elif [[ "$CONSTATE" =~ "已启用" ]]; then
  TOGGLE="Disable WiFi  "
elif [[ "$CONSTATE" =~ "disabled" ]]; then
  TOGGLE="Enable WiFi  "
elif [[ "$CONSTATE" =~ "未启用" ]]; then
  TOGGLE="Disable WiFi  "
fi

# display menu; store user choice
CHENTRY=$(echo -e "RESCAN\n$TOGGLE\n$LIST" | uniq -u | wofi -d -c $conf/main_config -s $conf/../style.css)
# store selected SSID
CHSSID=$(echo "$CHENTRY" | sed 's/\s\{2,\}/\|/g' | awk -F "|" '{print $1}')

if [ "$CHENTRY" = "" ]; then
  exit
elif [ "$CHENTRY" = "Enable WiFi  " ]; then
  nmcli radio wifi on
elif [ "$CHENTRY" = "Disable WiFi  " ]; then
  nmcli radio wifi off
elif [ "$CHENTRY" = "RESCAN" ]; then
  nmcli -t d wifi rescan
else
  # get list of known connections
  KNOWNCON=$(nmcli connection show)

  # If the connection is already in use, then this will still be able to get the SSID
  if [ "$CHSSID" = "*" ]; then
    CHSSID=$(echo "$CHENTRY" | sed 's/\s\{2,\}/\|/g' | awk -F "|" '{print $3}')
  fi

  # Parses the list of preconfigured connections to see if it already contains the chosen SSID. This speeds up the connection process
  if [[ $(echo "$KNOWNCON" | grep "$CHSSID" | sed 's/\s\{2,\}/\|/g' | awk -F "|" '{print $1}') = "$CHSSID" ]]; then
    nmcli con up "$CHSSID"
  else
    if [[ "$CHENTRY" =~ "" ]]; then
      WIFIPASS=$(echo " Press Enter if network is saved" | wofi -d -c $conf/pass_config -s $conf/../style.css)
    fi
    if nmcli dev wifi con "$CHSSID" password "$WIFIPASS"; then
      notify-send 'Connection successful'
    else
      notify-send 'Connection failed'
    fi
  fi
fi
