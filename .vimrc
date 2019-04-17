" https://github.com/vim/vim/issues/3117
if has('python3')
  silent! python3 1
endif

" Leaders are needed before plugins are loaded
let mapleader=","
let g:mapleader=","

let maplocalleader=","
let g:maplocalleader=","

let g:go_fmt_command = "goimports"
let g:neocomplete#enable_at_startup = 1
let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/neosnippets'
let g:pymode_virtualenv = 1
let g:pymode_virtualenv_path = $VIRTUAL_ENV

set nocompatible

" Extra runtime configs
set rtp+=$GOROOT/misc/vim

execute pathogen#infect()
execute pathogen#helptags()
" :Helptags to update docs

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
set listchars+=precedes:◀,extends:▶
set grepprg=ag
set noerrorbells
set visualbell

if has("gui_macvim")
  let macvim_skip_cmd_opt_movement=1
  set guioptions=egmt
  set cursorline
  set antialias
  set fuoptions=maxvert,maxhorz
endif

" Look and Feel
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
set novisualbell
set winminheight=0
set statusline=%F\ %m%r%w%y\ %=(%L\ loc)\ [#\%03.3b\ 0x\%02.2B]\ \ %l,%v\ \ %P

" Files/Paths/Buffers
set autowriteall
set autoread          " reload when no local changes
set backup
set backupdir=~/.vim/backup,~/.backup,~/tmp,/var/tmp/,/tmp,.
set directory=~/tmp,/var/tmp,/tmp,.
set shell=sh          " bash and zsh call /usr/bin/libexec/path_helper that prepends /usr/bin, bourne doesn't

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.6,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.pyc,.class,.jar

" Per file-type indentation
autocmd FileType js     setlocal sts=4 sw=4
autocmd FileType c      setlocal sts=4 sw=4
autocmd FileType go     setlocal ts=2 sw=2 noet nolist ai " makeprg=go\ test
autocmd FileType godoc  setlocal ts=2 nolist
autocmd FileType thrift setlocal ts=2 sw=2
autocmd FileType thrift setf thrift

" File-type
filetype plugin indent on
syntax on

" Colors
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme gruvbox
syntax enable

"" Bash out extra whitespace
"highlight StatusLine ctermbg=234
"highlight StatusLineNC ctermbg=232 ctermfg=8
"highlight CursorLine guibg=Gray20 ctermbg=233 cterm=NONE
"highlight Pmenu ctermfg=black ctermbg=brown gui=bold
"highlight PmenuSel ctermfg=black ctermbg=lightmagenta gui=bold
"highlight LineNr ctermfg=235

"" Mappings
"map <Leader>m :make<CR>
map <Leader>m :GoTest<CR>
map <Leader>n :nohlsearch<CR>
map <Leader>p :set paste<CR>i
map <Leader>P :set nopaste<CR>i
map <Leader>s :setlocal spell! spelllang=en_us<CR>
map <Leader>l :TlistToggle<CR>
map <Leader>c :TagbarToggle<CR>

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)
