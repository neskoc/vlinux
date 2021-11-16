#!/usr/bin/env awk
BEGIN {
    FS=",";
}
NR==1 { next }
{
    split($4, born, "-")
    # print born[3], $5
    if (match($5, born[3])) {
        printf("%s %s, %s, %s\n", $1, $2, $4, $5)
    }
}
