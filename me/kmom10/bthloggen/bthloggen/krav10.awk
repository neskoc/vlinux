#!/bin/awk -f

# krav1.awk

BEGIN {
    printf "[\n"
}

NR {
    match($0, /https?:\/\/[a-zA-Z0-9\.]+/, url)
    if (url[0] != "" && $1 ~ /^[1-9][0-9]{0,2}\.[1-9][0-9]{0,2}\.[1-9][0-9]{0,2}\.[1-9][0-9]{0,2}/ ) {
        match($0, /\[.*[0-9]{4}\]/, dt_match)
        dt_len = length(dt_match[0])
        dt_str = substr(dt_match[0], 2, dt_len - 2)
        split(dt_str, datetime, "/")
        printf ("    {\n")
        printf ("        \"ip\"  : \"%s\",\n", $1)
        printf ("        \"url\" : \"%s\",\n", url[0])
        # printf ("        \"dt_match\": \"%s : %d\",\n", dt_match[0], dt_len)
        printf ("        \"day\"     : \"%s\",\n", datetime[1])
        printf ("        \"month\"   : \"%s\",\n", datetime[2])
        printf ("        \"time\"    : \"%s\",\n", substr(datetime[3], 6, 8))
        # printf ("        \"shortime\": \"%s\"\n", substr(datetime[3], 1, 10))
        printf ("    },\n")
    }
}
END {
    printf "]\n"
}
