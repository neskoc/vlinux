#!/bin/awk -f

# krav1.awk

BEGIN {
    printf "["
}

NR {
    match(tolower($0), /https?:\/\/[a-zA-Z0-9\.]+/, url)
    if (url[0] != "" && $1 ~ /^[1-9][0-9]{0,2}\.[1-9][0-9]{0,2}\.[1-9][0-9]{0,2}\.[1-9][0-9]{0,2}/ ) {
        printf ("{\"ip\": \"%s\",\"url\": \"%s\"},\n", $1, url[0])
        # printf("\"url\": \"%s\"",url[0])
        # printf "    },"
    }
}
END {
    printf "]"
}
