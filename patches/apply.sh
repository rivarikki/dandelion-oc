#!/bin/bash
set -e

# GPU: 650 -> 680 MHz (MT6762 segment -> MT6765 segment)
F=drivers/misc/mediatek/base/power/mt6765/mtk_gpufreq_core.c
grep -q "g_segment_id = MT6762_SEGMENT;" $F
sed -i 's/g_segment_id = MT6762_SEGMENT;/g_segment_id = MT6765_SEGMENT;/' $F
echo "GPU patched"

# CPU: force level 3 (C65: big 2301 / little 1800 MHz)
P=drivers/misc/mediatek/base/power/cpufreq_v1/src/mach/mt6765/mtk_cpufreq_platform.c
awk 'NR>=555 && /_mt_cpufreq_get_cpu_level\(void\)/ {f=1}
     f && /^}/ {f=0}
     f && /return lv;/ {sub(/return lv;/, "lv = CPU_LEVEL_3; return lv;")}
     {print}' $P > $P.new
mv $P.new $P
grep -c "lv = CPU_LEVEL_3; return lv;" $P
grep -q "lv = CPU_LEVEL_3; return lv;" $P
echo "CPU patched"
