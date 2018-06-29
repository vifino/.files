# For systems with doas but no sudo, let doas be sudo.
if ! silent wh sudo; then
	silent wh doas && alias sudo=doas
fi
