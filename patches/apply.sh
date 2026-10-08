#!/bin/bash
set -e
F=drivers/misc/mediatek/base/power/mt6765/mtk_gpufreq_core.c
grep -n "g_segment_id = MT6762_SEGMENT;" $F
sed -i 's/g_segment_id = MT6762_SEGMENT;/g_segment_id = MT6765_SEGMENT;/' $F
echo "GPU patched: 650 -> 680 MHz"
