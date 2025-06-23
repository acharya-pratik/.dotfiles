#!/bin/bash
WEATHER=$(curl -s "wttr.in/?format=%c%t+%C")
if [[ $? -eq 0 ]]; then
  echo "{\"text\":\"$WEATHER\",\"tooltip\":\"$(curl -s 'wttr.in/?format=%c+%t+%C+%h+%w')\"}"
else
  echo "{\"text\":\"🌍 N/A\",\"tooltip\":\"Weather data unavailable\"}"
fi
