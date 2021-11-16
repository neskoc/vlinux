#!/usr/bin/env awk
BEGIN {
    FS=","
}
NR==1 { next }
NR<101 {
    printf("%s %s, %s\n", $1, $2, $3)
}
