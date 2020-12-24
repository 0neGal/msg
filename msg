#!/bin/sh

PREFIXCOLOR=""
PREFIX="$3"

TEST2="owo"
TEST="TEST2"

var() {
	if [[ -z $1 ]]
	then
		echo "$1 is unset"
	fi
}

var '$TESTt'

STATUS_PF=""
OTHER_PF=">"
ACTION_PF="::"
NOTICE_PF=" ->"
ERROR_PF="Error:"
WARNING_PF="Warning:"
SUCCESS_PF="Success:"

case $1 in
	"--test")
		msg "Status message!" status
		msg "Other message!" other
		msg "Action message!" action
		msg "Error message!" error
		msg "Success message!" success
		msg "Warning message!" warning
		msg "Notice message!" notice
		exit 1
		;;
esac

if [[ $2 == "" ]]
then
	echo -e "$1"
	exit 1
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
	*)
		PREFIXCOLOR="\e[0m"
		;;
esac

echo -e "$PREFIXCOLOR$PREFIX \e[0m$1"
