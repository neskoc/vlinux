#!/usr/bin/env bash
#

# Name of the script
SCRIPT=$( basename "$0" )

# Current version
VERSION="1.0.0"

# PORT number
PORT=1337

if [[ -n "$DBWEBB_PORT" ]]; then
  PORT=$DBWEBB_PORT
fi

SERVERNAME=$(cat servername.txt)

declare count=false
declare command
declare view_command

# Base url (webbserver) with port
BASE_URL="http://${SERVERNAME}:${PORT}/data"
GET_URL="http://${SERVERNAME}:${PORT}"

#
# Message to display for usage and help.
#
function usage
{
    local txt=(
		"Script $SCRIPT for filtering apache logs."
		"Usage: $SCRIPT [options] <command> [arguments]"
		""
		"Command:"
		"  url ................. Get url to view the server in browser."
		"  view ................ List all entries."
		"  view url <url> ...... View all entries containing <url>."
		"  view ip <ip> ........ View all entries containing <ip>."
		"  view month <month> .. View all entries containing <month>."
		"  view day <day> ...... View all entries containing <day>."
		"  view time <time> .... View all entries containing <time>."
		"  use <server> ........ Set the servername (localhost or service name). Default 'server'"
		""
		"Options:"
		"  -h, --help,     Display this menu."
		"  -v, --version,  Display the current version."
		"  -c, --count,    Display the number of rows returned."
    )

    printf "%s\\n" "${txt[@]}"
}


#
# Message to display when bad usage.
#
function badUsage
{
    local message="$1"
    local txt=("For an overview of the commands, execute:" "$SCRIPT --help")

    [[ -n $message ]] && printf "%s\\n" "$message"

    printf "%s\\n" "${txt[@]}"
}



#
# Message to display for version.
#
function version
{
    local txt=("$SCRIPT version $VERSION")

    printf "%s\\n" "${txt[@]}"
}


#
# Function for taking care of specific command. Name the function as the
# command is named.
#
function app-use
{
    if [[ $# -ne 1 ]]
    then
		echo -e "Nr of arguments: $#\\n"
        echo "use command takes (just) one <server> argument"
        exit 1
    else
        echo "Running 'use $1' command"
		echo "$1" > servername.txt
    fi
    echo
}


#
# Function for taking care of specific command. Name the function as the
# command is named.
#
function app-url
{
    if [[ $# -gt 0 ]]
    then
		echo -e "Nr of arguments: $#\\n"
        echo "url command has no arguments"
        exit 1
    else
        printf "Running 'url' command\\n"
    	printf "%s\\n" "${GET_URL}"
    fi
    echo
}

#
# Function for taking care of specific command. Name the function as the
# command is named.
#
function run-view
{
    echo "Running command ${view_command}"
    run_curl="curl -s ${BASE_URL}?${view_command}=${view_param} | jq .logs"
	if [[ $count == true ]]; then
		run_curl="${run_curl} | tee /dev/tty | wc -l"
	fi
    eval "$run_curl"
    echo
}


#
# Process options
#
function view-commands
{
	if [[ $# -eq 0 ]]
	then
		app-view
		exit 1
	else
		if [[ $# -gt 2 ]]
		then
			echo -e "Nr of arguments: $#\\n"
			echo -e "view command takes either 0 or 2 arguments\\n"
			usage
			exit 1
		fi
	fi
	while (( $# ))
	do
		case "$1" in
			"url"       \
			| "ip"     \
			| "month"   \
			| "day"    \
			| "time")
				view_command=$1
				shift
				view_param=$1
				shift
				run-view "$@"
				exit 0
			;;

			*)
				badUsage "Command not recognized."
				exit 1
			;;
		esac
	done

	badUsage
	exit 1
}

#
# Function for taking care of specific command. Name the function as the
# command is named.
#
function app-view
{
    echo "Running view"
    run_curl="curl -s ${BASE_URL} | jq .logs"
	if [[ $count == true ]]; then
		run_curl="${run_curl} | tee /dev/tty | wc -l"
	fi
    eval "$run_curl"
    echo
}


#
# Process options
#
function main
{
	printf "** Kmom10: Client **\\n\\n"
	while (( $# ))
	do
		case "$1" in

			--help | -h)
				usage
				exit 0
			;;

			--version | -v)
				version
				exit 0
			;;

			"use"   \
			| "url")
				command=$1
				shift
				app-"$command" "$@"
				exit 0
			;;

			--count | -c)
				count=true
				shift
			;;

			"view")
				command=$1
				shift
				view-commands "$@"
				exit 0
			;;

			*)
				badUsage "Option/command not recognized."
				exit 1
			;;
		esac
	done

	badUsage
	exit 1
}

main "$@"
