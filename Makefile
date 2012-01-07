all: .vim/ruby/command-t/ext.bundle

.vim/ruby/command-t/ext.bundle:
	cd .vim/ruby/command-t && ruby extconf.rb && make
