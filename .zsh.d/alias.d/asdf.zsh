# asdf!         

if [[ ! -d ~/.asdf ]]; then
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf --depth=1
	. ~/.asdf/asdf.sh
	asdf plugin-add rust https://github.com/code-lever/asdf-rust.git
	asdf plugin-add r2 https://github.com/vifino/asdf-r2.git
else
	. ~/.asdf/asdf.sh
fi
