" TODO:
" - UltiSnips enabled with YCM
"
" USE:
" commenting blocks: 	<leader> cc or cm
" write file:		<leader> w
" nerdtreee browser:	<leader> n 
" fzf in file:		<leader> /
" fzf on files:		<ctrl> p
" fzf on all commands:  <leader><tab> 
"
" This vim comes with powerful fzf intergrated, try the above commands
" and check out:
" https://medium.com/@sidneyliebrand/how-fzf-and-ripgrep-improved-my-workflow-61c7ca212861
" :h fzf-vim-commands
"
" PREREQUISITES:
" Python enabled Vim
" fzf installed
" powerline installed

set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'jnurmine/Zenburn'		" Just a color scheme
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-fugitive'
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'sjl/gundo.vim'
Plugin 'jiangmiao/auto-pairs' 
Plugin 'scrooloose/nerdcommenter'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

call vundle#end()            " required
filetype plugin indent on    " required

" youcompleteme behavior
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" various aliases
nmap <leader>n :NERDTree<cr>	" leader n is nerdtree
nmap <leader>w :w<cr>		" leader w is write
nmap <leader>/ :Lines<cr>	" leader w is write
nmap <leader>s :source .vimrc<cr>	" leader w is write
nmap <leader>u :GundoToggle<CR> " toggle gundo

" fzf tweaking and shortcuts
nnoremap <C-p> :Files<Cr>	" open fzf ctrl+p
" fzf help search all commands available
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x) test what 
omap <leader><tab> <plug>(fzf-maps-o)
" Insert mode completion
imap <leader><tab> <plug>(fzf-complete-word)
imap <leader><p> <plug>(fzf-complete-path):
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

set cursorline
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"autocmd VimLeave * silent !echo -ne "\<Esc>]50;CursorShape=0\x7"

set timeout timeoutlen=1500 	" timeout for command completion
set mouse=a			" enable mouse
set clipboard=unnamed		" integrate with system clipboard
let python_highlight_all=1
set backspace=indent,eol,start	" enable backspace
syntax on			" where exists, show syntax
set number			" visible line numbers 
set encoding=utf-8		" guess what... UTF-8 encoded
syntax enable           	" enable syntax processing
set splitbelow
set splitright
filetype indent on		" load filetype-specific indent files
set wildmenu			" visual autocomplete for commands
set showmatch 			" highlight matching [{()}]
set incsearch           	" search as characters are entered
set hlsearch            	" highlight matches
set t_Co=256			" powerline requires colors
set laststatus=2		" always show status / powerline

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" setup powerline specials
let g:Powerline_symbols = "fancy"
set fillchars+=stl:\ ,stlnc:\
let g:Powerline_mode_V="V·LINE"
let g:Powerline_mode_cv="V·BLOCK"
let g:Powerline_mode_S="S·LINE"
let g:Powerline_mode_cs="S·BLOCK"
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup


"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" fold docstring
let g:SimpylFold_docstring_preview=1

au BufNewFile,BufRead *.py
    \ set tabstop=4
    \  softtabstop=4
    \  shiftwidth=4
    \  textwidth=79
    \  expandtab
    \  autoindent
    \  fileformat=unix
