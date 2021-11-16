#!/usr/bin/env awk
BEGIN {
    FS=",";
    nr=0
}
NR==1 { next }
{
    split($4, born, "-")
    # print born[3], $5
    if (match($5, born[3])) {
        printf("%s %s, %s, %s\n", $1, $2, $4, $5)
    }
    if(born[1] < 2000) {
        nr++
    }
}
END {
    printf("%d stycken är födda innan år 2000.", nr)
}
