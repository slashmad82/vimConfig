"colors
colorscheme gentooish
"colorscheme desert 
set t_Co=256
syntax enable 

"general
set nocompatible
filetype plugin on
"set autochdir

"disabilitare freccie
"nnoremap <Left> :echo "No left for you!"<CR>
"vnoremap <Left> :<C-u>echo "No left for you!"<CR>
"inoremap <Left> <C-o>:echo "No left for you!"<CR>
"nnoremap <Right> :echo "No left for you!"<CR>
"vnoremap <Right> :<C-u>echo "No left for you!"<CR>
"inoremap <Right> <C-o>:echo "No left for you!"<CR>
"nnoremap <Up> :echo "No left for you!"<CR>
"vnoremap <Up> :<C-u>echo "No left for you!"<CR>
"inoremap <Up> <C-o>:echo "No left for you!"<CR>
"nnoremap <Down> :echo "No left for you!"<CR>
"vnoremap <Down> :<C-u>echo "No left for you!"<CR>
"inoremap <Down> <C-o>:echo "No left for you!"<CR>

"tab_spaces
set tabstop=4 "number of visual spaces per TAB
set softtabstop=4 " number of spaces in tab when editing
set smartindent
set shiftwidth=4

"UI config
set relativenumber "set numbers to lines
set nu "add absolute number to current line
set showcmd " show command in bottom bar
set wildmenu " visual autocomplete for command menu
set modeline
set ls=2 "show name

set incsearch           " search as characters are entered
set hlsearch            " highlight matches

"folding
set foldmethod=syntax

"switch between buffer witout saving
set hidden

"path
set path+=** "search down into subfolders-provides tab-completion for all file related task

"key mapping
inoremap jj <ESC>

"ctags stuff..
map <F2> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q . /usr/include/alsa/ /usr/include/Wt/<CR>
"map <F2> :!ctags -R * --fields=+S /usr/include<CR>
"map <F2> :!ctags -R *

"let project_make_path = 'build' "set here the makefile dir.current folder: getcwd()
"autocmd filetype c nnoremap <F7> :w <bar> exec '!cd '.shellescape(project_make_path).' && make'<CR><CR>:cw<CR>

"change here below the path of makefile with -> -C <path_where_makefile_is_loacted>
map <F7> <ESC>:w<CR>:cexpr []<CR>:make<CR>:cw<CR>
"example: map <F7> <ESC>:w<CR>:cexpr []<CR>:make -C build<CR>:cw<CR>
"
"map <F7> <ESC>:w<CR>:!cd build && make<CR>:cw<CR>
"map <F7> <ESC>:w<CR>:!make<CR>:cw<CR>

map <F8> <ESC>:w<CR>:!make clean<CR>:make<CR>

"try to fast compile by type
autocmd filetype python nnoremap <F9> :w <bar> exec '!python<CR>
autocmd filetype c nnoremap <F9> :w <bar> exec '!gcc -g '.shellescape('%').' -o '.shellescape('%:r')<CR>
autocmd filetype cpp nnoremap <F9> :w <bar> exec '!g++ -g -std=c++11 '.shellescape('%').' -o '.shellescape('%:r')<CR>
"try to fast compile and run
autocmd filetype python nnoremap <F5> :w <bar> exec '!python '.shellescape('%')<CR>
autocmd filetype c nnoremap <F5> :w <bar> exec '!gcc -g '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype cpp nnoremap <F5> :w <bar> exec '!g++ -g -std=c++11 '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>

map <C-F12> <C-w>g<C-]>
map <F12> <ESC>:w<CR> <C-]>

	"find
nmap <F3> :execute "grep! -Irn --exclude=tags " . shellescape(expand("<cword>")) . " ."<cr>:cw<cr>
vmap <F3> y:vimgrep '<c-r>"' **/*.c **/*.cpp **/*.h<CR>:cw<cr>
"vmap :%s/parolaDaSost/Sostituta/gc 

" bind § to grep shortcut
command! -nargs=+ -complete=file -bar Cerca execute 'silent! grep! -Ir <args> --exclude=tags' | execute 'redraw!' | execute 'cw'
nnoremap § :Cerca<SPACE>

" bind  for breakpoints to clipboard for gdb
command! Xg :let @+ = 'b ' . expand('%:p') . ':' . line('.')
nnoremap °° :Xg<CR>

"ALT mapping for moving lines
nnoremap <C-j> ddp
nnoremap <C-k> ddkP

"in insert and visual mode ctrl-jk to move line up and down
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

"in normal mode ctrl-jklh to move between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"highlight tab and spaces
map <F4> :match Pmenu /\t/
"set match Error /\S\zs\s\+$

"cycling between buffers
map <F6> :bn<CR>

"jump to header in C++
nmap ,h :find %:t:r.h<CR>
nmap ,H :sp %:t:r.h<CR>
nmap ,s :find %:t:r.cpp<CR>
nmap ,S :sp %:t:r.cpp<CR>

"insert line without go in insert mode
nmap oo o<Esc>k 
nmap OO O<Esc>j
