#!/usr/bin/env zsh
# set PAGER variable appropriately
# also sets some options
export LESS="-+F -R -+E -X"

for pager in most less; do
	silent which $pager && export PAGER=$pager && return
done
