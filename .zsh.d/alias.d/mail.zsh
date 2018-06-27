#!/usr/bin/env zsh

for mailer in neomutt mutt mail; do
	silent which $mailer && alias m=$mailer && return
done
