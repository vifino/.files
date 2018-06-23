#!/usr/bin/env bash
###
## Modular xinitrc.
###
## Info
##
# vifino's staging parallel xinit.d loader.
# We have a ~/.xinit.d dir.
# It contains files named XX-shortdesc.{start,stop,dep}
# XX is for the order/stage selection.
# Files in a with a low major order (1X) are guaranteed
# to run before higher ones (2X, for example).
# start and stop files are run in parallel.
# dep files are sourced, so you can set variables there,
# which will affect later stages.

###
## Init and variables
###

# Don't fail if no files are matched.
shopt -s nullglob

# Variables
export XINITD_DIR=~/.xinit.d
export XINITD_CONF=~/.xinit.conf

# Config file.
[ -e "$XINITD_CONF" ] && source "$XINITD_CONF"
[ -e "$XINITD_CONF.`uname`" ] && source "$XINITD_CONF.`uname`"
[ -e "$XINITD_CONF.`hostname`" ] && source "$XINITD_CONF.`hostname`"

###
## Helpers
###

msg_info() {
	printf ">>> %s\n" "$@"
}

msg_subinfo() {
	printf "  >> %s\n" "$@"
}


###
## Staging logic
###

# run_stage $phase $stage
# $phase is start/stop
# $stage is XX
# this is where the magic happens.
run_stage() {
	local phase="$1"
	local stage="$2"
	local pids=()
	msg_info "Running $phase stages ${stage}X..."
	if [[ "$phase" == "start" ]]; then
		for file in ${XINITD_DIR}/${stage}[0-9]-*; do
			local stagename="${file#$XINITD_DIR/}"
			case "$file" in
				*.dep)
					msg_subinfo "sourcing   $stagename"
					source "$file"
					;;
				*.start)
					msg_subinfo "running    $stagename"
					#( "$file" | while read line; do printf "[%s] %s\n" "$stagename" "$line"; done ) &
					"$file" &
					pids+=($!)
			esac
		done
	elif [[ "$phase" == "stop" ]]; then
		for file in ${XINITD_DIR}/${stage}[0-9]-*.stop; do
			local stagename=${file#$XINITD_DIR/}
			msg_subinfo "running    ${stagename}"
			"$file" &
			pids+=($!)
		done
	else
		echo "ERROR: Unknown phase: $phase"
		exit 1
	fi
	wait ${pids[*]}
}

# run_phase $phase
# simply runs stages 00 through 99 for phase $phase
run_phase() {
	for stage in {0..9}; do
		local files=(${XINITD_DIR}/${stage}[0-9]*)
		if [ -e "${files[0]}" ]; then
			run_stage "$1" $stage
			echo
		fi
	done
	msg_info "Ran all stages for $1."
}

# Running and cleanup.
cleanup() {
	run_phase "stop"
	echo "Goodbye."
	exit 0
}
trap cleanup INT TERM

# Start and stop!
run_phase "start"
cleanup
