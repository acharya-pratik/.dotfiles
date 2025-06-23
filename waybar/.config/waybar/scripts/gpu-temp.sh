#!/bin/bash

TEMP=$(sensors amdgpu-pci-0300 | grep 'edge' | awk '{print $2}' | cut -d '+' -f2 | cut -d '.' -f1)

if [[ -n "$TEMP" ]]; then
  STATUS=""
  if [[ $TEMP -ge 80 ]]; then
    STATUS="critical"
  elif [[ $TEMP -ge 60 ]]; then
    STATUS="warning"
  fi
  echo "{\"text\":\"$TEMP\", \"class\":\"$STATUS\", \"tooltip\":\"GPU Temp: ${TEMP}°C\"}"
else
  echo "{\"text\":\"N/A\", \"tooltip\":\"GPU data unavailable\"}"
fi

