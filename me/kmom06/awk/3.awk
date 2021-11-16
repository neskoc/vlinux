#!/usr/bin/env awk
BEGIN {
    FS=","
}
NR==508, NR==515 {
    printf("%s %s, %s\n", $1, $2, $3)
}
