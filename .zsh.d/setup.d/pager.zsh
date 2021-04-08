#!/usr/bin/env zsh
# set PAGER variable appropriately
# also sets some options
export LESS="-+F -R -+E -X"

for pager in most less; do
	silent which $pager && export PAGER=$pager && return
done

# Set up the preferred git pager.
if hasbin delta; then
	export GIT_PAGER="delta"
fi
