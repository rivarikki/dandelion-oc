#!/bin/bash
# Run inside kernel root (k/). Fill after recon output:
#  - panel: raise refresh 60 -> 70 Hz in drivers/misc/mediatek/lcm/.../icnl9911c*.c
#  - GPU: add/enable 680000 kHz OPP in gpufreq table
#  - CPU (optional): 2000000 -> 2300000 if table allows
echo "no patches yet"
