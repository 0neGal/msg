#!/bin/bash

case $1 in
	"--help")		
		msg "USAGE"
		msg "	msg <message> <msg-type> [extra-args]"
		msg "OPTIONS"
		msg "	--help"
		msg "		Shows this help message"
		msg ""
		msg "	--test"
		msg "		Outputs examples of all msg types"
		msg "INFO"
		msg "	Running without a msg-type will still work."
		msg "	Since msg uses printf to show messages you can use colors"
		msg "	with escape sequences, this behaviour is on purpose."

		exit 0
		;;
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

[ "$2" = "" ] && {
	printf "$1\n"
	exit 0
}

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

PRE() {
	[ "$PREFIX" = "" ] && PREFIX="$1" || return 1
}

case $2 in
	error)
		PREFIXCOLOR="\e[31m"
		PRE "$ERROR_PF"
		;;
	warning)
		PREFIXCOLOR="\e[33m"
		PRE "$WARNING_PF"
		;;
	notice)
		PREFIXCOLOR="\e[33m"
		PRE "$NOTICE_PF"
		;;
	success)
		PREFIXCOLOR="\e[32m"
		PRE "$SUCCESS_PF"
		;;
	action)
		PREFIXCOLOR="\e[34m"
		PRE "$ACTION_PF"
		;;
	other)
		PRE "$OTHER_PF"
		;;
	status)
		PRE "$STATUS_PF"
		;;
	actioninfo)
		PREFIXCOLOR="\e[32m"
		PRE "$ACTIONINFO_PF"
		;;
	actionwarn)
		PREFIXCOLOR="\e[33m"
		PRE "$ACTIONWARN_PF"
		;;
	progress)
		printf "$PROGRESS_PF_LBRACKET$3$PROGRESS_PF_DIVIDER$4$PROGRESS_PF_RBRACKET \e[0m$1\n"
		exit 0
		;;
	*)
		PREFIXCOLOR="\e[0m"
		;;
esac

printf "$PREFIXCOLOR$PREFIX \e[0m$1\n"

exit 0
