# For systems with doas but no sudo, let doas be sudo.
silent wh sudo || silent wh doas && alias sudo=doas
