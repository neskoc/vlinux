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
DATA_FOLDER="data"
GAMEID_FILENAME="$DATA_FOLDER/gameid.txt"
MAZELIST_FILENAME="$DATA_FOLDER/mazelist.txt"
ROOMINFO_FILENAME="$DATA_FOLDER/roominfo.txt"
TMP_FILENAME="$DATA_FOLDER/tmp.txt"

declare -A room_info
    
# Base url (webbserver) with port
BASE_URL="http://${SERVERNAME}:${PORT}"

#
# Init maze variables.
#
function initMazeList
{
    if test -f "$MAZELIST_FILENAME"; then
        indexes=$(sed '1q;d' ${MAZELIST_FILENAME})
        IFS=',' read -r -a indexes <<< "$indexes"
        maps=$(sed '2q;d' ${MAZELIST_FILENAME})
        IFS=',' read -r -a maps <<< "$maps"
        # echo "Maze variables initialized"
    fi
}



#
# Init maze variables.
#
function initRoomInfo
{
    # indexes: (roomid, description, west, east, south, north)
    if test -f "$ROOMINFO_FILENAME"; then
        room_ixs=$(sed '1q;d' ${ROOMINFO_FILENAME})
        IFS=',' read -r -a room_ixs <<< "$room_ixs"
        room_elements=$(sed '2q;d' ${ROOMINFO_FILENAME})
        IFS=',' read -r -a room_elements <<< "$room_elements"
        declare -i len
        len=$((${#room_ixs[@]} - 1))
        # len=len-1
        for ix in $(seq 0 "$len"); do
            room_ix=${room_ixs[ix]}
            room_info+=([$room_ix]=${room_elements[$ix]})
        done
        # for key in "${!room_info[@]}"; do echo "$key => ${room_info[$key]}"; done
    fi
}



#
# Init maze variables.
#
function initMazeVariables
{
    if test -f "$GAMEID_FILENAME"; then
        GAMEID=$(cat ${GAMEID_FILENAME} | cut -d',' -f2 | tail -n1)
    fi

    initMazeList
    initRoomInfo
}

initMazeVariables


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
"  init           Initiera ett spel och spara ned spelets id i en fil.."
"  maps           Visa vilka kartor som finns att välja bland."
"  select <map>   Välj en viss karta via siffra."
"  enter          Gå in i första rummet."
"  info           Visa information om rummet."
"  go north       Gå till ett nytt rum, om riktningen stödjs."
"  go south       Gå till ett nytt rum, om riktningen stödjs."
"  go east        Gå till ett nytt rum, om riktningen stödjs."
"  go west        Gå till ett nytt rum, om riktningen stödjs."
""
"Options:"
"  -h, --help,     Print help."
"  -v, --version,  Print version."
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
function app-init
{
    echo "Running init"
    run_curl="curl -s ${BASE_URL}?type=csv -o ${GAMEID_FILENAME}"
    eval "$run_curl"
    http_code=$?
    if [[ $http_code != 0 ]]; then
        echo "There is a problem with the url or site! http_code: ${http_code}"
        echo 1
    else
        GAMEID=$(cat ${GAMEID_FILENAME} | cut -d',' -f2 | tail -n1)
        msg="GameID: ${GAMEID}"
    fi
    echo -e "$msg\\n"
}



#
# Function for taking care of specific command. Name the function as the
# command is named.
#
function app-maps
{
    echo "Running maps"
    run_curl="curl -s ${BASE_URL}/map?type=csv -o ${MAZELIST_FILENAME}"
    eval "$run_curl"
    http_code=$?
    if [[ $http_code != 0 ]]; then
        echo "There is a problem with the url or site! http_code: ${http_code}"
        exit 1
    else
        initMazeList
        # indexes=$(sed '1q;d' ${MAZELIST_FILENAME})
        # IFS=',' read -r -a indexes <<< "$indexes"
        # maps=$(sed '2q;d' ${MAZELIST_FILENAME})
        # IFS=',' read -r -a maps <<< "$maps"

        echo "Available mazes:"
        for index in "${!indexes[@]}"
        do
            echo "    ${indexes[index]}: ${maps[index]}"
        done
    fi
    echo
}



#
# Function for taking care of specific command. Name the function as the
# command is named.
#
function app-select
{
    if ! [[ -v GAMEID_FILENAME ]]; then
        echo "You need to run init command  first"
        exit 1
    fi
    if [[ $# -ne 1 ]]
    then
        echo "Select command takes one <nr> argument"
        exit 1
    else
        echo "Running select $1"
        if test -f "$MAZELIST_FILENAME"; then
            if [[ " ${indexes[*]} " =~ $1 ]]; then
                run_curl="curl -s ${BASE_URL}/${GAMEID}/map/${maps[$1]}?type=csv -o ${TMP_FILENAME}"
                eval "$run_curl"
                http_code=$?
                if [[ $http_code != 0 ]]; then
                    echo "There is a problem with the url or site! http_code: ${http_code}"
                    exit 1
                else
                    msg=$(cat ${TMP_FILENAME} | tail -n1)
                    msg="You chose the following map: ${maps[$1]}\\n$msg"
                fi
            else
                msg="Selected map $1 does not exist!"
            fi
        else
            msg="You need to run command 'maps' first!"
        fi
        echo -e "$msg"
    fi
    echo
}


#
# Show Room info
#
function getRoomInfo()
{
    msg="You are in the room ${room_info[roomid]}\\n"
    msg="$msg Room description: ${room_info[description]}\\n"
    msg="$msg Available directions are:\\n"
    msg="$msg - west:  ${room_info[west]}\\n"
    msg="$msg - east:  ${room_info[east]}\\n"
    msg="$msg - south: ${room_info[south]}\\n"
    msg="$msg - north: ${room_info[north]}"
}


#
# Function for taking care of specific command. Name the function as the
# command is named.
#
function app-enter
{
    run_curl="curl -s ${BASE_URL}/${GAMEID}/maze?type=csv -o ${ROOMINFO_FILENAME}"
    eval "$run_curl"
    http_code=$?
    if [[ $http_code != 0 ]]; then
        echo "There is a problem with the url or site! http_code: ${http_code}"
        exit 1
    else
        # run_curl="cat ${TMP_FILENAME} | tail -n1 | cut -d',' -f1 > $ROOMID_FILENAME"
        # eval "$run_curl"
        # run_curl="cat ${TMP_FILENAME} | tail -n1 > $ROOMINFO_FILENAME"
        # eval "$run_curl"
        initRoomInfo
        getRoomInfo
    fi
    echo -e "$msg \\n"
}


#
# Show Room info
#
function app-info()
{
    if test -f "$TMP_FILENAME"; then
        initRoomInfo
        getRoomInfo
        echo -e "$msg \\n"
    else
        echo "You need to be in a room to run info"
    fi
}


#
# Move to the room
#
function app-go()
{
    re='^[0-9]+$'
    if ! [[ -v GAMEID_FILENAME ]]; then
        echo "You need to run init command  first"
        exit 1
    elif ! test -f "$MAZELIST_FILENAME"; then
        echo "You need to run maps command prior"
        exit 1
    elif ! test -f "$TMP_FILENAME"; then
        echo "You need to select maze first"
        exit 1
    elif [[ $# -ne 1 ]]; then
        echo "Go command takes one <direction> argument"
        exit 1
    elif ! [[ ${room_info[$1]} =~ $re ]]; then
        echo "There is no door in that ($1) direction!"
        exit 1
    else
        echo "Running go $1"
        run_curl="curl -s ${BASE_URL}/${GAMEID}/maze/${room_info[roomid]}/$1?type=csv -o ${ROOMINFO_FILENAME}"
        eval "$run_curl"
        http_code=$?
        if [[ $http_code != 0 ]]; then
            echo "There is a problem with the url or site! http_code: ${http_code}"
            exit 1
        else
            initRoomInfo
            getRoomInfo
        fi
    fi
    echo -e "$msg \\n"
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

          "init"       \
          | "maps"     \
          | "select"   \
          | "enter"    \
          | "info"     \
          | "go")
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
