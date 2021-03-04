syntax enable
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
set number
set relativenumber
set backspace=indent,eol,start
set spelllang=en_us

set list
set listchars=eol:┐,space:.
hi NonText ctermfg=8 guifg=#222222
hi SpecialKey ctermfg=8 guifg=#222222

au BufRead,BufNewFile *.vert setfiletype cpp
au BufRead,BufNewFile *.frag setfiletype cpp

