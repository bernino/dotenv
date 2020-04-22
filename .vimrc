" USE:
" leader is default:    \
" commenting blocks: 	<leader> cc or cm
" uncommenting blocks: 	<leader> cu
" write file:		<leader> w
" quit:                 <leader> q
" nerdtreee browser:	<leader> n 
" latex structure:	<leader> t 
" fzf search in file:	<leader> /
" fzf search for files:	<ctrl> p
" fzf on all commands:  <leader><tab> 
" :UltisnipsEdit 	for more snippets
"
" This vim comes with powerful fzf intergrated, try the above commands
" and check out:
" https://medium.com/@sidneyliebrand/how-fzf-and-ripgrep-improved-my-workflow-61c7ca212861
" :h fzf-vim-commands

" PREREQUISITES:
" Python enabled Vim
" Vundle do: git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" start vim and do :PluginInstall
" fzf installed
" powerline installed
" ctags installed

set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim' 		" Plugin manager -- install first then run :PluginInstall
Plugin 'vim-scripts/indentpython.vim' 	" PEP8 indentation of Python https://github.com/vim-scripts/indentpython.vim
Plugin 'vim-scripts/taglist.vim' 	" browse function definitions
Plugin 'lervag/vimtex' 			" LaTeX helpers https://github.com/lervag/vimtex
Plugin 'ervandew/supertab' 		" Magic tab https://github.com/ervandew/supertab
Plugin 'Valloric/YouCompleteMe' 	" Autocompletion engine
Plugin 'vim-syntastic/syntastic' 	" checking syntax https://github.com/vim-syntastic/syntastic
Plugin 'scrooloose/nerdtree' 		" file browser \ n 
"Plugin 'jistr/vim-nerdtree-tabs' 	" nerdtree opens in new tab
Plugin 'tpope/vim-fugitive' 		" git commands https://github.com/tpope/vim-fugitive
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'mbbill/undotree' 		" https://github.com/mbbill/undotree
Plugin 'jiangmiao/auto-pairs' 		" automagic double pairs of ( etc.
Plugin 'scrooloose/nerdcommenter' 	" \cc comments see https://github.com/preservim/nerdcommenter
Plugin 'junegunn/fzf' 			" fuzzy engine https://github.com/junegunn/fzf.vim
Plugin 'junegunn/fzf.vim' 		" fuzzy engine https://github.com/junegunn/fzf.vim
Plugin 'sirver/ultisnips' 		" rocket science snippet engine https://github.com/sirver/UltiSnips
Plugin 'honza/vim-snippets' 		" snippets for ultisnips 
Plugin 'tpope/vim-surround' 		" magic surrounding word: try ysiw: iw is a word object https://github.com/tpope/vim-surround
Plugin 'airblade/vim-gitgutter' 	" git diff live https://github.com/airblade/vim-gitgutter
Plugin 'jnurmine/Zenburn'		" Just a color scheme
"Plugin 'altercation/vim-colors-solarized'

call vundle#end()            " required

filetype plugin indent on    " required

set background=dark
"colorscheme Zenburn

" youcompleteme behavior
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" various aliases
nmap <leader>n :NERDTreeToggle<cr>	" leader n is nerdtree
nmap <leader>t :VimtexTocOpen<cr>  	" leader t is latex tree
nmap <leader>w :w<cr>			" leader w is write
nmap <leader>q :q<cr>			" leader w is quit
nmap <leader>/ :Lines<cr>		" search for text
nmap <leader>s :source .vimrc<cr>	" leader w is write
nmap <leader>u :UndotreeToggle<CR> 	" toggle undo tree

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
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Use deoplete.
"let g:deoplete#enable_at_startup = 1

let g:ulti_expand_or_jump_res = 0 "default value, just set once
function! Ulti_ExpandOrJump_and_getRes()
    call UltiSnips#ExpandSnippetOrJump()
    return g:ulti_expand_or_jump_res
endfunction

inoremap <CR> <C-R>=(Ulti_ExpandOrJump_and_getRes() > 0)?"":"\n"<CR>
