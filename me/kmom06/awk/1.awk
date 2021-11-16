#!/usr/bin/env awk
BEGIN {
    FS=","
    OFS=" "
}
NR==1 { next }
{
    print $1, $2
}
