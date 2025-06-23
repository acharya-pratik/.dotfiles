#!/bin/bash
count=$(dunstctl count waiting)
if [ "$count" -gt 0 ]; then
    echo "$count 🔔"
else
    echo ""
fi

