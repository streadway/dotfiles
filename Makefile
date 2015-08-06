packages:
	sudo apt-get install -y clang fish cmake exuberant-ctags python-dev golang mosh

../%: %
	ln -nsfF .dotfiles/$< $@

update: ../.vimrc ../.vim ../.gitconfig ../.irbrc ../.tmux.conf
	git submodule update --init --recursive
	mkdir -p ../bin ../.config
	[ -h ../.config/fish ] || rm -rf ../.config/fish
	ln -nsfF ~/.dotfiles/.config/fish ../.config/fish
	cp -Rp bin/* ../bin/

build:
	cd .vim/bundle/YouCompleteMe && ./install.sh --clang-completer --gocode-completer

xrdb: .Xresources
	xrdb -merge .Xresources
