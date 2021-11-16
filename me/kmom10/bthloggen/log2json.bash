#!/usr/bin/env bash
#

# Name of the script
# SCRIPT=$( basename "$0" )

# Current version
# VERSION="1.0.0"

awk -f bthloggen/formatLog.awk access-50k.log | head -n -1 > log.json
printf "    }\\n]" >> log.json
