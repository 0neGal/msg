#!/bin/sh

PREFIXCOLOR=""
PREFIX="$3"

STATUS_PF=""
OTHER_PF=">"
ACTION_PF="::"
NOTICE_PF=" ->"
ERROR_PF="Error:"
ACTIONINFO_PF="==>"
ACTIONWARN_PF="==>"
WARNING_PF="Warning:"
SUCCESS_PF="Success:"

PROGRESS_PF_LBRACKET="("
PROGRESS_PF_DIVIDER="/"
PROGRESS_PF_RBRACKET=")"

case $1 in
	"--test")
		msg "Status message!" status
		msg "Other message!" other
		msg "Action message!" action
		msg "Error message!" error
		msg "Action Warn message!" actionwarn
		msg "Action Info message!" actioninfo
		msg "Success message!" success
		msg "Warning message!" warning
		msg "Notice message!" notice
		msg "Progress message!" progress 1 5
		exit 0
		;;
esac

if [[ $2 == "" ]]
then
	echo -e "$1"
	exit 0
fi

case $2 in
	error)
		PREFIXCOLOR="\e[31m"
		if [[ $PREFIX == "" ]]
		then
			PREFIX="$ERROR_PF"
		fi
		;;
	warning)
		PREFIXCOLOR="\e[33m"
		if [[ $PREFIX == "" ]]
		then
			PREFIX="$WARNING_PF"
		fi
		;;
	notice)
		PREFIXCOLOR="\e[33m"
		if [[ $PREFIX == "" ]]
		then
			PREFIX="$NOTICE_PF"
		fi
		;;
	success)
		PREFIXCOLOR="\e[32m"
		if [[ $PREFIX == "" ]]
		then
			PREFIX="$SUCCESS_PF"
		fi
		;;
	action)
		PREFIXCOLOR="\e[34m"
		if [[ $PREFIX == "" ]]
		then
			PREFIX="$ACTION_PF"
		fi
		;;
	other)
		PREFIX="$OTHER_PF"
		;;
	status)
		PREFIX="$STATUS_PF"
		;;
	actioninfo)
		PREFIXCOLOR="\e[32m"
		if [[ $PREFIX == "" ]]
		then
			PREFIX="$ACTIONINFO_PF"
		fi
		;;
	actionwarn)
		PREFIXCOLOR="\e[33m"
		if [[ $PREFIX == "" ]]
		then
			PREFIX="$ACTIONWARN_PF"
		fi
		;;
	progress)
		echo -e "$PROGRESS_PF_LBRACKET$3$PROGRESS_PF_DIVIDER$4$PROGRESS_PF_RBRACKET \e[0m$1"
		exit 0
		;;
	*)
		PREFIXCOLOR="\e[0m"
		;;
esac

echo -e "$PREFIXCOLOR$PREFIX \e[0m$1"

exit 0
