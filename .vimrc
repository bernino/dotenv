" TODO:
" - UltiSnips enabled with YCM
"
" USE:
" leader is:            \
" commenting blocks: 	<leader> cc or cm
" uncommenting blocks: 	<leader> cu
" write file:		<leader> w
" quit:                 <leader> q
" nerdtreee browser:	<leader> n 
" latex structure:	<leader> t 
" fzf search in file:	<leader> /
" fzf search for files:	<ctrl> p
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
Plugin 'vim-scripts/indentpython.vim'
Plugin 'lervag/vimtex'
Plugin 'ervandew/supertab'
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
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'

call vundle#end()            " required

filetype plugin indent on    " required

" youcompleteme behavior
"let g:ycm_autoclose_preview_window_after_completion=1
"map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" various aliases
nmap <leader>n :NERDTreeToggle<cr>	" leader n is nerdtree
nmap <leader>t :VimtexTocOpen<cr> " leader t is latex tree
nmap <leader>w :w<cr>		" leader w is write
nmap <leader>q :q<cr>		" leader w is quit
nmap <leader>/ :Lines<cr>	" search for text
nmap <leader>s :source .vimrc<cr>	" leader w is write
"nmap <leader>u :GundoToggle<CR> " toggle gundo

" fzf tweaking and shortcuts
nnoremap <C-p> :Files<Cr>	" open fzf ctrl+p
" fzf help search all commands available
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x) test what 
omap <leader><tab> <plug>(fzf-maps-o)
" Insert mode completion
imap <c-x><c-w> <plug>(fzf-complete-word)
imap <c-x><c-p> <plug>(fzf-complete-path):
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

set cursorline
highlight Cursor guifg=green guibg=black
highlight iCursor guifg=green guibg=steelblue
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10

"setlocal spell
set spelllang=en_gb
inoremap <C-s> <c-g>u<Esc>[s1z=`]a<c-g>u

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

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
"filetype on			" load filetype-specific files
set wildmenu			" visual autocomplete for commands
set showmatch 			" highlight matching [{()}]
set incsearch           	" search as characters are entered
set hlsearch            	" highlight matches
set t_Co=256			" powerline requires colors
set laststatus=2		" always show status / powerline

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" setup powerline specials
"let g:Powerline_symbols = "fancy"
"set fillchars+=stl:\ ,stlnc:\
"let g:Powerline_mode_V="V·LINE"
"let g:Powerline_mode_cv="V·BLOCK"
"let g:Powerline_mode_S="S·LINE"
"let g:Powerline_mode_cs="S·BLOCK"
"python3 from powerline.vim import setup as powerline_setup
"python3 powerline_setup()
"python3 del powerline_setup


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

let g:vimtex_view_method='skim'
let g:tex_flavor = 'latex'
let g:vimtex_view_general_options = '-r @line @pdf @tex'

let g:vimtex_compiler_latexmk_engines = {
    \ '_'                : '-xelatex',
    \ 'pdflatex'         : '-pdf',
    \ 'dvipdfex'         : '-pdfdvi',
    \ 'lualatex'         : '-lualatex',
    \ 'xelatex'          : '-xelatex',
    \ 'context (pdftex)' : '-pdf -pdflatex=texexec',
    \ 'context (luatex)' : '-pdf -pdflatex=context',
    \ 'context (xetex)'  : '-pdf -pdflatex=''texexec --xtx''',
    \}

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger = "<C-tab>"
let g:UltiSnipsJumpBackwardTrigger = "<S-tab>"

" Use deoplete.
"let g:deoplete#enable_at_startup = 1

let g:ulti_expand_or_jump_res = 0 "default value, just set once
function! Ulti_ExpandOrJump_and_getRes()
    call UltiSnips#ExpandSnippetOrJump()
    return g:ulti_expand_or_jump_res
endfunction

inoremap <CR> <C-R>=(Ulti_ExpandOrJump_and_getRes() > 0)?"":"\n"<CR>
