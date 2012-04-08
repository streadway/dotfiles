all: .vim/ruby/command-t/ext.bundle xrdb

.vim/ruby/command-t/ext.bundle:
	cd .vim/ruby/command-t && ruby extconf.rb && make

xrdb: .Xresources
	xrdb -merge .Xresources
