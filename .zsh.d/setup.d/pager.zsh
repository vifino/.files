#!/usr/bin/env zsh
# set PAGER variable appropriately
# also sets some options
export LESS="-+F -R -+E -X"

# Pick the general pager.
for pager in most less more; do
	silent which $pager && export PAGER=$pager && break
done

# Set up the preferred git pager.
hasbin delta && export GIT_PAGER="delta"

