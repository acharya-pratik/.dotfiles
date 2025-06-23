#!/bin/bash

# Lock the screen using swaylock-effects with blur and indicator
swaylock -f \
  --clock \
  --indicator \
  --screenshots \
  --effect-blur 7x5 \
  --fade-in 0.2 \
  --grace 0 \
  --daemonize

