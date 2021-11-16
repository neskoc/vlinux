#!/usr/bin/env awk
BEGIN {
    FS=",";
    printf("Förnamn       Efternamn       Telefonnummer\n");
    printf("-------------------------------------------\n")
}
NR==1 { next }
{
    printf("%-14s%-16s%s\n", $1, $2, $5)
}
END {
    printf("-------------------------------------------\n")
}
