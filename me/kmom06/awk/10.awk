#!/usr/bin/env awk

function formatIdNummer(datum) {
    split(datum, born, "-")
    months_str = "jan feb mar apr maj jun jul aug sep okt nov dec"
    split(months_str, months, " ")
    sub(/^0/, " " , born[3])
    nyttFormat = born[3] "/" months[born[2]+0] "-" born[1]
    return nyttFormat
}

BEGIN {
    FS=","
}
NR==1 { next }
NR>1 {
    # print $4, nyttFormat
    if (length($6) > 40) {
        nyttFormat = formatIdNummer($4)
        printf("%s %s %s\n", $1, nyttFormat, $6)
    }
}
