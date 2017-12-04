#!/bin/gawk -f

BEGIN {
print "Directories  Files  Links  Total  Storage(Gigabytes)"
print "===================================================="
} 

/^d/{d++}
/^-/{f++}
/^l/{l++}

{t = d+f+l}
{g+=$5/1000000000}

END {print d"        "f"   "l"   "t"  "g}
