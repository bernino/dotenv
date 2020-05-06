" USE:
" leader is default:    \
" commenting blocks: 	<leader> cc or cm
" uncommenting blocks: 	<leader> cu
" write file:		<leader> w
" quit:                 <leader> q
" nerdtreee browser:	<leader> n 
" latex structure:	<leader> t 
" fzf search in file:	<leader> /
" fzf search for files:	<leader> f
" fzf on all commands:  <leader> tab
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
" brew install the_silver_searcher if on mac https://github.com/ggreer/the_silver_searcher

set nocompatible              " required
filetype off                  " required it changes below

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
"Plugin 'powerline/powerline' 		", {'rtp': 'powerline/bindings/vim/'}
Plugin 'mbbill/undotree' 		" https://github.com/mbbill/undotree
Plugin 'jiangmiao/auto-pairs' 		" automagic double pairs of ( etc.
Plugin 'preservim/nerdcommenter' 	" \cc comments see https://github.com/preservim/nerdcommenter
					"and \c<space> is toggle
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } 			" fuzzy engine https://github.com/junegunn/fzf.vim
Plugin 'junegunn/fzf.vim' 		" fuzzy engine https://github.com/junegunn/fzf.vim
Plugin 'sirver/ultisnips' 		" rocket science snippet engine https://github.com/sirver/UltiSnips
Plugin 'honza/vim-snippets' 		" snippets for ultisnips 
Plugin 'tpope/vim-surround' 		" magic surrounding word: try ysiw: iw is a word object https://github.com/tpope/vim-surround
Plugin 'airblade/vim-gitgutter' 	" git diff live https://github.com/airblade/vim-gitgutter
Plugin 'altercation/vim-colors-solarized'
Plugin 'https://github.com/alok/notational-fzf-vim' " nValt for vim
Plugin 'godlygeek/tabular' 		" for markdown
Plugin 'plasticboy/vim-markdown' 	" for markdown https://github.com/plasticboy/vim-markdown
Plugin 'shime/vim-livedown' 		" https://github.com/shime/vim-livedown
Plugin 'vim-pandoc/vim-pandoc' 		" https://github.com/vim-pandoc/vim-pandoc
Plugin 'vim-pandoc/vim-pandoc-syntax' 	" needed for pandoc above
Plugin 'jnurmine/Zenburn'		" Just a color scheme
Plugin 'mileszs/ack.vim'  		" https://github.com/mileszs/ack.vim for using ag
Plugin 'vim-airline/vim-airline' 	" https://github.com/vim-airline/vim-airline
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tomasr/molokai' 		" as in the color
Plugin 'tpope/vim-repeat'

call vundle#end()            		" required

filetype plugin indent on    		" required

color molokai 				" molokai, zenburn and solarized are nice

" youcompleteme behavior
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" various aliases
nmap <leader>f :NERDTreeToggle<cr>	" leader f is nerdtree for files
nmap <leader>t :VimtexTocOpen<cr>  	" leader t is latex tree
nmap <leader>w :w<cr>			" leader w is write
nmap <leader>q :q<cr>			" leader w is quit
nmap <leader>/ :Lines<cr>		" search for text
nmap <leader>s :source .vimrc<cr>	" leader w is write
nmap <leader>u :UndotreeToggle<CR> 	" toggle undo tree
nmap pr :LivedownToggle<CR> 		" preview markdown
nmap pdf :Pandoc pdf<CR> 		" generate pdf by typing pdf
nnoremap <leader>r :!%:p<CR> 		" run buffer with \r

"fzf tweaking and shortcuts
nnoremap <leader>f :Files<Cr>	" open fzf \f
" fzf help search all commands available
nmap <leader>c <plug>(fzf-maps-n)
xmap <leader>c <plug>(fzf-maps-x) test what 
omap <leader>c <plug>(fzf-maps-o)

" Insert mode completion
imap <c-w> <plug>(fzf-complete-word)
imap <c-p> <plug>(fzf-complete-path):
imap <c-j> <plug>(fzf-complete-file-ag)
imap <c-l> <plug>(fzf-complete-line)

set cursorline 				" line where cursor is
" cursor rectangle when normal mode and vertical line when insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

"setlocal spell
set spelllang=en_gb
inoremap <C-s> <c-g>u<Esc>[s1z=`]a<c-g>u

set timeout timeoutlen=1500 	" timeout for command completion
set mouse=a			" enable mouse
set clipboard=unnamed		" integrate with system clipboard
let python_highlight_all=1
set backspace=indent,eol,start	" enable backspace
syntax on			" where exists, show syntax
set number			" visible line numbers 
set encoding=utf-8		" guess what... UTF-8 encoded
set splitbelow
set splitright
set wildmenu			" visual autocomplete for commands
set showmatch 			" highlight matching [{()}]
set incsearch           	" search as characters are entered
set hlsearch            	" highlight matches
set t_Co=256			" powerline requires colors
set laststatus=2		" always show status / powerline

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" setup powerline specials
let g:airline_powerline_fonts=1
"set fillchars+=stl:\ ,stlnc:\

" searching file with ag is fast
let g:ackprg = 'ag --vimgrep'
nnoremap <leader>s :Ack!<Space>

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

au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

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

" for nvalt
" see https://github.com/Alok/notational-fzf-vim
" try :NV or ctrl+n
let g:nv_search_paths = ['~/notes', 'notes.md']
let g:nv_default_extension = '.md'
let g:nv_create_note_key = 'ctrl-s' 	" After searching, press ctrl-s and save new note with filename
nnoremap <silent> <leader>n :NV<CR> 	" leader n searches notes

"make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

"better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let g:ulti_expand_or_jump_res = 0 "default value, just set once
function! Ulti_ExpandOrJump_and_getRes()
    call UltiSnips#ExpandSnippetOrJump()
    return g:ulti_expand_or_jump_res
endfunction

inoremap <CR> <C-R>=(Ulti_ExpandOrJump_and_getRes() > 0)?"":"\n"<CR>
