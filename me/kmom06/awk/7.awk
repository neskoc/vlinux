#!/usr/bin/env awk
BEGIN {
    FS=",";
    printf("Årtal   Antal\n");
    printf("-------------\n")
}
NR==1 { next }
{
    split($4, born, "-")
    # print born[1]
    if (! arr[born[1]]) {
        arr[born[1]] = 1
    } else {
        arr[born[1]]++
    }
}
END {
    for (val in arr) {
        printf("%-8s%+5s\n", val, arr[val])
    }
    printf("-------------\n")
}
