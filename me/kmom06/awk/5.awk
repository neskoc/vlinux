#!/usr/bin/env awk
BEGIN {
    FS=",";
    printf("Förnamn         Efternamn                       Stad\n");
    printf("----------------------------------------------------\n")
}
NR==1 { next }
{
    if ($3 ~ /berg$/) {
        printf("%-16s%-16s%+20s\n", $1, $2, $3)
    }
}
END {
    printf("----------------------------------------------------\n")
}
