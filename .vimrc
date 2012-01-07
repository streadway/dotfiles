" Leaders are needed before plugins are loaded
let maplocalleader=","
let g:maplocalleader=","

" Text Handling
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set backspace=2
set autoindent
set smartindent
set smarttab
set nowrap
set nofoldenable
set sidescroll=5
set list             " alternate: set listchars+=tab:▸\ ,eol¬
set listchars=tab:»· 
set listchars+=trail:·
set listchars+=precedes:<,extends:>
set grepprg=ack\ -a\ -G\ '[^.6]$'

if has("gui_macvim")
  let macvim_skip_cmd_opt_movement = 1
  set guioptions=egmt
  set cursorline
  set antialias
  set fuoptions=maxvert,maxhorz
endif

" Look and Feel
set nocompatible
set hlsearch
set incsearch
set ignorecase
set smartcase
set wildmenu
set wildmode=list,full
set ruler
set modeline
set modelines=5
set laststatus=1      " show only with more than window
set mouse=v
set showcmd
set showmatch
set background=dark
set visualbell
set winminheight=0
set statusline=%F\ %m%r%w%y\ %=(%L\ loc)\ [#\%03.3b\ 0x\%02.2B]\ \ %l,%v\ \ %P

" Files/Paths/Buffers
set autowriteall
set autoread          " reload when no local changes
set backup
set backupdir=~/.backup,~/tmp,/var/tmp/,/tmp,.
set directory=~/tmp,/var/tmp,/tmp,.

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.6,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.pyc,.class,.jar

" Per file-type indentation
autocmd BufEnter *.js  set sts=4 sw=4
autocmd BufEnter *.c   set sts=4 sw=4
autocmd BufEnter *.go  set ts=2 sw=2 noet nolist ai

" File-type
filetype on
filetype plugin on
filetype indent on

" Colors
if $TERM == "rxvt-unicode"
  set t_Co=256
endif

colorscheme darkblue
syntax enable

"" Bash out extra whitespace
highlight CursorLine guibg=Gray20
highlight Pmenu ctermfg=black ctermbg=brown gui=bold
highlight PmenuSel ctermfg=black ctermbg=lightmagenta gui=bold
highlight LineNr guifg=#0e0e0e ctermfg=darkgrey

"" Mappings
map <F4> :cn<CR>
map <S-F4> :cp<CR>
map <F5> :make<CR>:cw<CR>
map <F6> :!rake development<CR>
map <F7> :!script/console development<CR>
map <F12> :!ruby %:p<CR>
imap <F12> <ESC>:!ruby %:p<CR>
map <F8> <ESC>:!ruby -rubygems %<CR>
map <S-F8> <ESC>:!script/spec -X %<CR>
map <M-F8> <ESC>:!time script/spec %:p -l <C-R>=line('.')<CR><CR>
map <M-S-F8> <ESC>:!time script/spec -X %:p -l <C-R>=line('.')<CR><CR>
