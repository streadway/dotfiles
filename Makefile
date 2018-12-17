packages:
	sudo apt-get install -y fish exuberant-ctags golang mosh ack-grep

../%: %
	ln -nsfF .dotfiles/$< $@

update: ../.vimrc ../.vim ../.gitconfig ../.irbrc ../.tmux.conf
	git submodule update --init --recursive
	git submodule update --remote --merge --recursive
	mkdir -p ../bin ../.config
	[ -h ../.config/fish ] || rm -rf ../.config/fish
	ln -nsfF ~/.dotfiles/.config/fish ../.config/fish
	cp -Rp bin/* ../bin/

xrdb: .Xresources
	xrdb -merge .Xresources
