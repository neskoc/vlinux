#!/usr/bin/env bash
#

# Name of the script
SCRIPT=$( basename "$0" )

# Current version
VERSION="1.0.0"


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
"  cal                  Skriver ut en kalender."
"  greet                Skriver ut en hälsningsfras till den nuvarande användaren."
"  loop <min> <max>     Skriver ut siffrorna mellan <min> och <max> med hjälp av en forloop."
"  lower <n1 n2 n3...>  Skriver ut alla siffror som är mindre än 42."
"  reverse <sentence>   Skriv ut en mening baklänges (ecnetnes)."
"  all                  Kör samtliga funktioner i följd."
""
"Options:"
"  --help, -h     Print help."
"  --version, -h  Print version."
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
function app-cal
{
    echo "This is output from cal, showing the current calender."
    cal
}



#
# Function for taking care of specific command. Name the function as the
# command is named.
# "$USER"
#
function app-greet
{
    echo "This is output from greet, showing greeting for current user."
    echo "Hej $(whoami)!"
    echo
}



#
# Function for taking care of specific command. Name the function as the
# command is named.
#
function app-loop
{
  if [[ $# -ne 2 ]]
  then
    echo "loop command takes two arguments <min> and <max>"
    exit 1
  else
    echo "This is output from loop $1 $2"
    declare -i min=$1
    declare -i max=$2
    for (( value=min; value<=max; value++ ))
    do
      echo "$value"
    done
  fi
  echo
}



#
# Function for taking care of specific command. Name the function as the
# command is named.
#
function app-lower
{
  if [[ $# -eq 0 ]]
  then
    echo "lower command takes at least one argument"
    exit 1
  else
    echo "This is output from lower $*"
    while (( $# ))
    do
      [[ "$1" -lt 42 ]] && echo "$1"
      shift
    done
  fi
  echo
}



#
# Function for taking care of specific command. Name the function as the
# command is named.
#
function app-reverse
{
  if [[ $# -eq 0 ]]
  then
    echo "command 'reverse' takes one arguments <sentence>"
    exit 1
  else
    echo "This is output from reverse '$1'"
    sentence="$*"
    size=$(( ${#sentence}-1 ))
    reverse=""
    for (( value=size; value>=0; value-- ))
    do
      reverse+=${sentence:$value:1}
    done
    echo "$reverse"
  fi
  echo
}



#
# Function for taking care of specific command. Name the function as the
# command is named.
#
function app-all
{
  echo
  echo "Run all commands in sequence"
  echo

  app-cal
  app-greet
  app-loop 4 8
  app-lower 1 3 24 46 34 56 11
  app-reverse "random sentence"
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

          cal         \
          | loop      \
          | lower     \
          | greet     \
          | reverse   \
          | all)
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
