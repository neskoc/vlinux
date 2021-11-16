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
declare -A availableDirections
declare -A maze_list_dict
declare silent=false
declare end=false

# Base url (webbserver) with port
BASE_URL="http://${SERVERNAME}:${PORT}"

#
# Init maze variables.
#
function initMazeList
{
	unset maze_list_dict
    if test -f "$MAZELIST_FILENAME"; then
        indexes=$(sed '1q;d' ${MAZELIST_FILENAME})
        IFS=',' read -r -a indexes <<< "$indexes"
        maps=$(sed '2q;d' ${MAZELIST_FILENAME})
        IFS=',' read -r -a maps <<< "$maps"

		for ix in "${indexes[@]}"; do
			maze_list_dict+=([$ix]=${maps[$ix]})
		done
        # echo "Maze variables initialized"
    fi
}

#
# Init maze variables.
#
function initRoomInfo
{
	room_info=()
    # indexes: (roomid, description, west, east, south, north)
    if test -f "$ROOMINFO_FILENAME"; then
        room_keys=$(sed '1q;d' ${ROOMINFO_FILENAME})
        IFS=',' read -r -a room_keys <<< "$room_keys"
        room_elements=$(sed '2q;d' ${ROOMINFO_FILENAME})
        IFS=',' read -r -a room_elements <<< "$room_elements"
        declare -i range
        range=$((${#room_keys[@]} - 1))
        # len=len-1
        for ix in $(seq 0 "$range"); do
            room_key=${room_keys[ix]}
            room_info+=([$room_key]=${room_elements[$ix]})
			# echo "room_key: $room_key "
        done
		# echo "initRoomInfo:"
        # for key in "${!room_info[@]}"; do echo "$key => ${room_info[$key]}"; done
	else
		echo -e "initRoomInfo: No roominfo available yet!\\n"
    fi
}

#
# Show Room info
#
function getRoomInfo()
{
	availableDirections=()
    msg="You are in the room ${room_info[roomid]}\\n"
    msg="$msg  Room description: ${room_info[description]}\\n"
	if [[  "${room_info[description]}" == "You found the exit" ]]; then
		end=true
	else
		[[ $silent == false ]] && msg="$msg  Available directions are:\\n"
		directions=(west east south north)
		for direction in "${directions[@]}"; do
			if [[ "${room_info[$direction]}" != "-" ]]; then
				[[ $silent == false ]] && msg="$msg    $direction:  ${room_info[$direction]}\\n"
				# printf "$direction:  ${room_info[$direction]}\\n"
				availableDirections+=([$direction]=${room_info[$direction]})
			fi
		done
		# echo -e "Available directions(getRoomInfo): ${availableDirections[*]}\\n"
		# echo -e "Available directions(getRoomInfo): ${!availableDirections[*]}\\n"
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
    local txt=("For an overview of the command, execute:" "$SCRIPT --help")

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

		if [[ $silent == false ]]; then
	        echo "Maze list:"
			# ${!sounds[@]}
	        for key in "${!maze_list_dict[@]}"
	        do
	            echo "    ${key}) ${maze_list_dict[key]}"
	        done
		fi
    fi
    echo
}



#
# Function for taking care of specific command. Name the function as the
# command is named.
#
function app-select
{
	local msg
    if ! [[ -v GAMEID_FILENAME ]]; then
        echo "You need to run init command  first"
        exit 1
    fi
    if [[ $# -ne 1 ]]
    then
		echo -e "Nr of arguments: $#\\n"
        echo "Select command takes just one <map nr> argument"
        exit 1
    else
        echo "Running select $1 command"
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
                    msg="You've chosen the following map: ${maps[$1]}\\n$msg"
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
# Function for taking care of specific command. Name the function as the
# command is named.
#
function app-enter
{
	if [[ -n ${GAMEID} ]]; then
	    run_curl="curl -s ${BASE_URL}/${GAMEID}/maze?type=csv -o ${ROOMINFO_FILENAME}"
	    eval "$run_curl"
	    http_code=$?
	    if [[ $http_code != 0 ]]; then
	        echo "There is a problem with the url or site! http_code: ${http_code}"
	        exit 1
	    else
	        initRoomInfo
	        getRoomInfo
	    fi
	else
		echo -e "You need to run init comman first!"
	fi
    echo -e "$msg"
}


#
# Show Room info
#
function app-info()
{
    if test -f "$TMP_FILENAME"; then
        initRoomInfo
        getRoomInfo
        echo -e "$msg"
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
    echo -e "$msg"
	if [[ $end == true ]]; then
		exit 0
	fi
}

#
# Show Room info
#
function chooseMap()
{
	while true
	do
		echo -e "Available mazes:"
		PS3="Enter command: "
		valid_choices=("${maps[@]}" "quit")
		select choice in "${valid_choices[@]}";
		do
			# echo -e "\\nSelection: map(reply) / $map ($REPLY)"
			if [[ -n $choice ]]; then
				if [[ " ${maps[*]} " =~ $choice ]]; then
					echo -e "\\nYou've selected $choice ($REPLY)"
					app-select $((REPLY - 1))
				elif [[ $choice == "quit" ]]; then
					printf "Quitting...\\n"
					exit 0
				fi
				break;
			else
				echo -e "\\nInvalid command!"
			fi
		done
		break;
	done
}

#
# Show Room info
#
function commandLoop()
{
	while true
	do
		echo -e "Available commands:"
		PS3="Enter command: "
		valid_choices=("${!availableDirections[@]}" "info" "quit")
		select command in "${valid_choices[@]}";
		do
			if [[ -n $command ]]; then
				if [[ " ${!availableDirections[*]} " =~ $command ]]; then
					echo -e "\\nYou've selected $REPLY ($command)\\n"
					app-go "$command"
				elif [[ $command == "info" ]]; then
					silent=false
					getRoomInfo
					printf "%s\\n" "$msg"
					silent=true
				elif [[ $command == "quit" ]]; then
					printf "Quitting...\\n"
					exit 0
				fi
				break
			else
				printf "\\nInvalid command!\\n"
			fi
		done
	done
}

#
# Show Room info
#
function actionLoop()
{
	while true
	do
		echo -e "Available commands:"
		PS3="Enter command: "
		valid_choices=("${!availableDirections[@]}" "info" "quit")
		select command in "${valid_choices[@]}";
		do
			# printf "\\nSelection: map(reply) / $command ($REPLY)\\n"
			if [[ -n $command ]]; then
				if [[ " ${!availableDirections[*]} " =~ $command ]]; then
					printf "\\nYou've selected %s (%s)\\n" "$command" "$REPLY"
					app-go "$command"
				elif [[ $REPLY == 3 ]]; then
					silent=false
					getRoomInfo
					printf "%s\\n" "$msg"
					silent=true
				elif [[ $REPLY == 4 ]]; then
					print "Quitting!\\n"
					exit 0
				fi
			else
				printf "\\nInvalid command!\\n"
			fi
		done
		break;
	done
}


#
# Show Room info
#
function app-loop()
{
	silent=true
	app-init
	app-maps
	chooseMap
	app-enter
	getRoomInfo
	commandLoop
}


#
# Process options
#
function main
{
	printf "** MAZERUNNER **\\n\\n"
	echo "Command: $1"
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
			| "go"     \
			| "loop")
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
