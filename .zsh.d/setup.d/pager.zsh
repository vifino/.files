#!/usr/bin/env zsh
# set PAGER variable appropriately

for pager in most less; do
	silent which $pager && export PAGER=$pager && return
done
