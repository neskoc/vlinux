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

# Base url (webbserver) with port
BASE_URL="http://localhost:${PORT}"


#
# Message to display for usage and help.
#
function usage
{
    local txt=(
"Utility $SCRIPT for doing stuff."
"Usage: $SCRIPT [options] <command> [arguments]"
""
"Command:"
"  all                  fetch /all."
"  names                fetch /names."
"  color <color>        fetch color/<color>."
"  test <url>           check if server is responding."
""
"Options:"
"  -h, --help,     Print help."
"  -v, --version,  Print version."
"  -s, --save,     Save returned data."
    )

    printf "%s\\n" "${txt[@]}"
}



#
# Message to display when bad usage.
#
function badUsage
{
    local message="$1"
    local txt=(
"For an overview of the command, execute:"
"$SCRIPT --help"
    )

    [[ -n $message ]] && printf "%s\\n" "$message"

    printf "%s\\n" "${txt[@]}"
}



#
# Message to display for version.
#
function version
{
    local txt=(
"$SCRIPT version $VERSION"
    )

    printf "%s\\n" "${txt[@]}"
}



#
# Function for taking care of specific command. Name the function as the
# command is named.
#
function app-all
{
    echo "Running /all"
    run_curl="curl ${BASE_URL}/all  ${opt}"
    eval "$run_curl"
    echo
}



#
# Function for taking care of specific command. Name the function as the
# command is named.
#
function app-names
{
    echo "Running /names"
    run_curl="curl ${BASE_URL}/names  ${opt}"
    eval "$run_curl"
    echo
}


#
# Function for taking care of specific command. Name the function as the
# command is named.
#
function app-color
{
  if [[ $# -ne 1 ]]
  then
    echo "color command takes one <color> argument"
    exit 1
  else
    echo "Running /names $1"
    run_curl="curl ${BASE_URL}/color/$1 ${opt}"
    eval "$run_curl"
  fi
  echo
}



#
# Function for taking care of specific command. Name the function as the
# command is named.
#
function app-test
{
  if [[ $# -gt 1 ]]; then
    echo "command 'test' takes at most one argument <url>"
    exit 1
  else
    echo "Running test '$1'"
    expanded_opt="--write-out '%{http_code}' --silent > /dev/null"
    if [[ -z $1 ]]; then
        run_curl="curl ${BASE_URL} ${expanded_opt}"
    else
        run_curl="curl $1 ${expanded_opt}"
    fi
    eval "$run_curl"
    http_code=$?
    if [[ $http_code == 0 ]]; then
        msg="The site is responding! http_code:"
    else
        msg="There is a problem with the url or site! http_code:"
    fi
    msg="$msg ${http_code}"
    if [[ -z $opt ]]; then
        echo "$msg"
    else
        eval "echo $msg > saved.data"
    fi 
  fi
  echo
}


#
# Process options
#
function main
{
  echo "Command:$1"
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

          --save | -s)
              opt="-o saved.data"
              shift
          ;;

          "all"         \
          | "names"     \
          | "color"     \
          | "test")
              command=$1
              shift
              app-"$command" "$@"
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
