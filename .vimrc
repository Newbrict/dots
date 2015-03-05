set nocompatible
set t_Co=16
call pathogen#infect()
set background=dark " dark | light "
colorscheme solarized
filetype plugin on
set cursorline
set colorcolumn=80
call togglebg#map("<F5>")

"Tabs
set noexpandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
nnoremap    <F2> :<C-U>setlocal lcs=tab:>-,trail:-,eol:$ list! list? <CR>

"Undo Options
set undodir=~/.vim/vimundo
set undofile
set undolevels=1000
set undoreload=10000

"Annoying autocorrect
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"Trailing White Space
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
