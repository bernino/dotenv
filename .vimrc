" USE:
" leader is default                        : \
" notes in markdown                        : <leader> a
" easymotion max search 		   : <leader><leader> /
" commenting blocks                        : <leader> cc or cm or toggle       : c space
" uncommenting blocks                      : <leader> cu
" write file                               : <leader> w
" quit                                     : <leader> q
" nerdtreee browser                        : =
" easymotion two char                      : s
" latex structure                          : <leader> t
" fzf search in file                       : <leader> /
" fzf search for files                     : <leader> f
" fzf on all commands                      : <leader> c
" swap windows                             : <leader> ww
" list of bindings                         : <leader> m
" ctrl+p enabled - modes                   : ctrl+f
" easymotion                               : normal mode s + two chars
" for more snippets - snip                 : :UltisnipsEdit
"
" The power of Normal mode + s + two chars
" The power of Normal mode + z/ + search
"
" This vim comes with powerful fzf intergrated, try the above commands
" and check out:
" https://medium.com/@sidneyliebrand/how-fzf-and-ripgrep-improved-my-workflow-61c7ca212861
" :h fzf-vim-commands

" PREREQUISITES:
" Inspired by https://dev.to/allanmacgregor/vim-is-the-perfect-ide-e80
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

Plugin 'gmarik/Vundle.vim'                          " Plugin manager -- install first then run :PluginInstall
Plugin 'vim-scripts/indentpython.vim'               " PEP8 indentation of Python https://github.com/vim-scripts/indentpython.vim
Plugin 'vim-scripts/taglist.vim'                    " browse function definitions
Plugin 'majutsushi/tagbar'                          " https://github.com/majutsushi/tagbar
Plugin 'wesQ3/vim-windowswap'                       " https://github.com/wesQ3/vim-windowswap
Plugin 'godlygeek/tabular'                          " http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
Plugin 'jeetsukumaran/vim-buffergator'              " https://github.com/jeetsukumaran/vim-buffergator
Plugin 'reedes/vim-pencil'  		            " https://github.com/reedes/vim-pencil
Plugin 'lervag/vimtex'                              " LaTeX helpers https://github.com/lervag/vimtex
Plugin 'ervandew/supertab'                          " Magic tab https://github.com/ervandew/supertab
Plugin 'Valloric/YouCompleteMe'                     " Autocompletion engine
Plugin 'vim-syntastic/syntastic'                    " checking syntax https://github.com/vim-syntastic/syntastic
Plugin 'scrooloose/nerdtree'                        " file browser \ n
"Plugin 'jistr/vim-nerdtree-tabs' 		    " nerdtree opens in new tab
Plugin 'mbbill/undotree'                            " https://github.com/mbbill/undotree
Plugin 'jiangmiao/auto-pairs'                       " automagic double pairs of ( etc.
Plugin 'preservim/nerdcommenter'                    " \cc comments see https://github.com/preservim/nerdcommenter
Plugin 'junegunn/fzf',                              " { 'dir': '~/.fzf', 'do': './install --all' } " fuzzy engine https://github.com/junegunn/fzf.vim
Plugin 'junegunn/fzf.vim'                           " fuzzy engine https://github.com/junegunn/fzf.vim
Plugin 'sirver/ultisnips'                           " rocket science snippet engine https://github.com/sirver/UltiSnips
Plugin 'honza/vim-snippets'                         " snippets for ultisnips
Plugin 'tpope/vim-surround'                         " magic surrounding word: try ysiw: iw is a word object https://github.com/tpope/vim-surround
Plugin 'altercation/vim-colors-solarized'  	    " color scheme
Plugin 'https://github.com/alok/notational-fzf-vim' " nValt for vim
Plugin 'plasticboy/vim-markdown'                    " for markdown https://github.com/plasticboy/vim-markdown
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'shime/vim-livedown'                         " shows markdown live https://github.com/shime/vim-livedown
Plugin 'vim-pandoc/vim-pandoc'                      " https://github.com/vim-pandoc/vim-pandoc
Plugin 'vim-pandoc/vim-pandoc-syntax'               " needed for pandoc above
Plugin 'jnurmine/Zenburn'                           " Just a color scheme
Plugin 'mileszs/ack.vim'                            " https://github.com/mileszs/ack.vim for using ag
Plugin 'vim-airline/vim-airline'                    " https://github.com/vim-airline/vim-airline
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tomasr/molokai'                             " as in the color
Plugin 'tpope/vim-repeat'                           " allows for complex . repeats
Plugin 'easymotion/vim-easymotion'                  " https://github.com/easymotion/vim-easymotion
Plugin 'haya14busa/incsearch.vim'                   " building searches https://github.com/haya14busa/incsearch.vim
Plugin 'haya14busa/incsearch-easymotion.vim'        " enables full text for easymotion
Plugin 'kien/ctrlp.vim'                             " https://github.com/kien/ctrlp.vim
Plugin 'terryma/vim-multiple-cursors'               " https://github.com/terryma/vim-multiple-cursors
Plugin 'dpelle/vim-LanguageTool'                    " https://github.com/dpelle/vim-LanguageTool
" Git Support
Plugin 'kablamo/vim-git-log'
Plugin 'gregsexton/gitv'
Plugin 'tpope/vim-fugitive' 			    " git commands https://github.com/tpope/vim-fugitive
Plugin 'airblade/vim-gitgutter'                     " git diff live https://github.com/airblade/vim-gitgutter
Plugin 'davidhalter/jedi-vim'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'benmills/vimux'

call vundle#end()           " required

filetype plugin indent on   " required
set omnifunc=syntaxcomplete#Complete

color molokai               " molokai, zenburn and solarized are nice

" bookmark settings
highlight BookmarkSign ctermbg=NONE ctermfg=160
highlight BookmarkLine ctermbg=194 ctermfg=NONE
let g:bookmark_sign = '♥'
let g:bookmark_highlight_lines = 1

" commenter settings
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Prompt for a command to run
map <Leader>c :VimuxPromptCommand<CR>

" Settings for Writting
let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'

" Vim-pencil Configuration
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd,md call pencil#init()
  " autocmd FileType text            call pencil#init()
augroup END

" Disable arrow movement, resize splits instead.
"let g:elite_mode=1
"if get(g:, 'elite_mode')
    "nnoremap <Up>    :resize +2<CR>
    "nnoremap <Down>  :resize -2<CR>
    "nnoremap <Left>  :vertical resize +2<CR>
    "nnoremap <Right> :vertical resize -2<CR>
"endif

"incsearch related stuff...
"nmap z/ <Plug>(incsearch-easymotion-/)
"nmap <leader><leader>/ <Plug>(incsearch-easymotion-/)
nmap / <Plug>(incsearch-easymotion-/)
nmap z? <Plug>(incsearch-easymotion-?)
nmap zg/ <Plug>(incsearch-easymotion-stay)

" stuff for easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)
nmap <leader><leader>f <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" youcompleteme behavior
let g:ycm_autoclose_preview_window_after_completion=1
"map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" various aliases and maps
let NERDTreeWinSize = 45
let NERDTreeQuitOnOpen=1
nmap = :NERDTreeToggle<cr>         " leader o is nerdtree for files
nmap <leader>t :VimtexTocOpen<cr>  " leader t is latex tree
nmap <leader>w :w<cr>              " leader w is write
nmap <leader>q :q<cr>              " leader q is quit
nmap <leader><leader>q :q!<cr>     " leader leader q is quit!
nmap <leader>/ :Lines<cr>          " search for text
nmap <leader>u :UndotreeToggle<CR> " toggle undo tree
nmap pr :LivedownToggle<CR>        " preview markdown
nmap pdf :Pandoc pdf<CR>           " generate pdf by typing pdf
nnoremap <leader>r :!%:p<CR>       " run buffer with \r
map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>
nmap <leader>' ysiw'

if exists(":Tabularize")
  nmap <Leader><Leader>a= :Tabularize /=<CR>
  vmap <Leader><Leader>a= :Tabularize /=<CR>
  nmap <Leader><Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader><Leader>a: :Tabularize /:\zs<CR>
endif

" leader ww swaps windows
let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <silent> <leader>yw :call WindowSwap#MarkWindowSwap()<CR>
nnoremap <silent> <leader>pw :call WindowSwap#DoWindowSwap()<CR>
nnoremap <silent> <leader>ww :call WindowSwap#EasyWindowSwap()<CR>

nmap t :TagbarToggle<CR>

" fzf tweaking and shortcuts
"let g:fzf_preview_window = 'right:60%'

" open fzf f for files
nnoremap <leader>f :Files<CR>		
" open fzf grep for content in file - g for grep
nnoremap <leader>g :Rg<CR> 	
" fzf help search all commands available
nmap <leader>m <plug>(fzf-maps-n)
xmap <leader>m <plug>(fzf-maps-x) test what 
omap <leader>m <plug>(fzf-maps-o)

" Insert mode completion
imap <c-w> <plug>(fzf-complete-word)
imap <c-p> <plug>(fzf-complete-path):
imap <c-j> <plug>(fzf-complete-file-ag)
imap <c-l> <plug>(fzf-complete-line)

" buffer tabbing
nnoremap <leader><tab> :Buffers<cr>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

set cursorline 				" line where cursor is
" cursor rectangle when normal mode and vertical line when insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

"setlocal spell
set spelllang=en_gb
inoremap <C-s> <c-g>u<Esc>[s1z=`]a<c-g>u

set showcmd

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
"nnoremap <leader>a :Ack!<Space>

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

"au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

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
" try :NV or leader+n
let g:nv_search_paths = ['~/notes', 'notes.md']
let g:nv_default_extension = '.md'
let g:nv_create_note_key = 'n' 	" After searching, press ctrl-s and save new note with filename
nnoremap <silent> <leader>a :NV<CR> 	" leader n searches notes

"make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

"better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsEditSplit="vertical" " If you want :UltiSnipsEdit to split your window.

let g:ulti_expand_or_jump_res = 0 "default value, just set once
function! Ulti_ExpandOrJump_and_getRes()
    call UltiSnips#ExpandSnippetOrJump()
    return g:ulti_expand_or_jump_res
endfunction

inoremap <CR> <C-R>=(Ulti_ExpandOrJump_and_getRes() > 0)?"":"\n"<CR>

" toggles vertical to horizontal split with leader wt
function! ToggleWindowHorizontalVerticalSplit()
  if !exists('t:splitType')
    let t:splitType = 'vertical'
  endif

  if t:splitType == 'vertical' " is vertical switch to horizontal
    windo wincmd K
    let t:splitType = 'horizontal'

  else " is horizontal switch to vertical
    windo wincmd H
    let t:splitType = 'vertical'
  endif
endfunction

nnoremap <silent> <leader>wt :call ToggleWindowHorizontalVerticalSplit()<cr>
