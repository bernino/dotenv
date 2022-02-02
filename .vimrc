" Inspired by https://dev.to/allanmacgregor/vim-is-the-perfect-ide-e80 e80

" PREREQUISITES:
" - Python enabled Vim
" - Vundle do: git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" - start vim and do :PluginInstall
" - fzf installed
" - brew install the_silver_searcher if on mac https://github.com/ggreer/the_silver_searcher

" USE:
" leader is 		   : <space>
" TagBar	           : <leader>=
" buffers                  : <leader>tab
" bookmark 		   : mm and ma
" leader z is zen 	   : <leader> z
" notes in markdown        : <leader> n
" easymotion fuzzy search  : <leader>/
" comenting blocks        : <leader>cc or cm or toggle : <leader>c+space or C+]
" uncommenting blocks      : <leader> cu
" write file               : <leader> w
" quit                     : <leader> q
" nerdtreee browser        : <leader> (next to 1)
" easymotion two char      : s
" latex structure          : <leader>
" table mode 		   : <leader><leader>
" fzf search in file       : <leader><leader>/
" fzf search for files     : <leader><leader>f
" fzf on all commands      : <leader>m
" swap windows             : <leader>ww
" easymotion               : normal mode s + two chars
" for more snippets - snip : :UltisnipsEdit
" split window sizes       : <shitf>+hjkl
"
" Don't forget zz, zt, zb more here https://unix.stackexchange.com/questions/110251/how-to-put-current-line-at-top-center-bottom-of-screen-in-vim#110252
" Don't forget gd (go to definition) and gr (references)
"
" And don't forget spellchecking ]s and z= https://www.linux.com/training-tutorials/using-spell-checking-vim/
"
" The power of Normal mode + s + two chars
" The power of Normal mode + \/ + search
"
" This vim comes with powerful fzf intergrated, try the above commands and check out:
" https://medium.com/@sidneyliebrand/how-fzf-and-ripgrep-improved-my-workflow-61c7ca212861
" :h fzf-vim-commands

set nocompatible              " required
filetype off                  " required it changes below

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

Plugin 'gmarik/Vundle.vim'                          	" Plugin manager -- install first then run :PluginInstall
Plugin 'vim-scripts/indentpython.vim'               	" PEP8 indentation of Python https://github.com/vim-scripts/indentpython.vim
Plugin 'majutsushi/tagbar'                          	" https://github.com/majutsushi/tagbar
" Plugin 'wesQ3/vim-windowswap'                       	" https://github.com/wesQ3/vim-windowswap
Plugin 'godlygeek/tabular'                          	" http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
Plugin 'jeetsukumaran/vim-buffergator'              	" https://github.com/jeetsukumaran/vim-buffergator
" Plugin 'reedes/vim-pencil'  		            	    " https:github//github.com/reedes/vim-pencil does softwraps
Plugin 'lervag/vimtex'                              	" LaTeX helpers https://github.com/lervag/vimtex
" Plugin 'ervandew/supertab'                          	" Magic tab https://github.com/ervandew/supertab
Plugin 'vim-syntastic/syntastic'                    	" checking syntax https://github.com/vim-syntastic/syntastic
Plugin 'scrooloose/nerdtree'                        	" file browser <leader>f
Plugin 'jiangmiao/auto-pairs'                       	" automagic double pairs of ( etc.
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }
Plugin 'junegunn/fzf.vim'
Plugin 'preservim/nerdcommenter'                    	" <leader>c+space comments see https://github.com/preservim/nerdcommenter
Plugin 'tpope/vim-surround'                         	" magic surrounding word: try ysiw: iw is a word object https://github.com/tpope/vim-surround
Plugin 'https://github.com/alok/notational-fzf-vim' 	" nValt for vim
Plugin 'plasticboy/vim-markdown'                    	" for markdown https://github.com/plasticboy/vim-markdown
" Plugin 'jtratner/vim-flavored-markdown' 		" ditto
" Plugin 'shime/vim-livedown'                         	" shows markdown live https://github.com/shime/vim-livedown
Plugin 'vim-pandoc/vim-pandoc'                      	" https://github.com/vim-pandoc/vim-pandoc
Plugin 'vim-pandoc/vim-pandoc-syntax'               	" needed for pandoc above
" Plugin 'mileszs/ack.vim'                            	" https://github.com/mileszs/ack.vim for using ag
Plugin 'vim-airline/vim-airline'                    	" https://github.com/vim-airline/vim-airline
Plugin 'vim-airline/vim-airline-themes' 		" ditto
Plugin 'tpope/vim-repeat'                           	" allows for complex . repeats
Plugin 'easymotion/vim-easymotion'                  	" https://github.com/easymotion/vim-easymotion
Plugin 'haya14busa/incsearch.vim'                   	" building searches https://github.com/haya14busa/incsearch.vim
Plugin 'haya14busa/incsearch-easymotion.vim'        	" enables full text for easymotion
Plugin 'haya14busa/incsearch-fuzzy.vim'
Plugin 'terryma/vim-multiple-cursors'               	" https://github.com/terryma/vim-multiple-cursors
" Plugin 'kablamo/vim-git-log' 			    	" https://github.com/kablamo/vim-git-log
" Plugin 'gregsexton/gitv' 			   	" https://github.commands/gregsexton/gitv
" Plugin 'tpope/vim-fugitive' 			    	" git commands https://github.com/tpope/vim-fugitive
" Plugin 'airblade/vim-gitgutter'                     	" git diff live https://github.com/airblade/vim-gitgutter
Plugin 'MattesGroeger/vim-bookmarks' 		        " try mm and ma
" Plugin 'christoomey/vim-tmux-navigator' 	        " https://github.com/christoomey/vim-tmux-navigator
" Plugin 'benmills/vimux' 			    	" https://github.com/benmills/vimux
Plugin 'junegunn/goyo.vim' 			    	" Zen mode for vim https://github.com/junegunn/goyo.vim
Plugin 'junegunn/limelight.vim' 		    	" https://github.com/junegunn/limelight.vim
" Plugin 'tpope/vim-abolish' 				" https://github.com/tpope/vim-abolish manipulates words
Plugin 'dhruvasagar/vim-table-mode' 			" \tm table mode https://github.com/dhruvasagar/vim-table-mode
Plugin 'vim-scripts/SearchComplete' 			" tab enabled / search - powerful
Plugin 'arcticicestudio/nord-vim' 			" a fine colorscheme
" Plugin 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
" Plugin 'vimwiki/vimwiki' 				" conflicts with ultisnips
Plugin 'luochen1990/rainbow'
Plugin 'machakann/vim-sandwich'
" Plugin 'codota/tabnine-vim'				" autocompletion engine cant exist with ultisnips
" Plugin 'sirver/ultisnips'                          	" rocket science snippet engine https://github.com/sirver/UltiSnips
Plugin 'honza/vim-snippets'                         	" snippets for ultisnips
Plugin 'neoclide/coc.nvim', {'branch': 'release'}

call vundle#end()           			    	        " required
filetype plugin indent on 				        " required

let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

" Create default mappings for nerdcommenter
let g:NERDCreateDefaultMappings = 1

" coc tab next snippet placeholder
let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<s-tab>'


" Some general settings
" set virtualedit=block
set belloff=all
" set rtp+=/opt/homebrew/opt/fzf
set guicursor=
set complete+=kspell 		" ctrl-p ctrl-n are word completion
set hidden
" set omnifunc=syntaxcomplete#Complete 	"destroys ultisnips
set termguicolors
set signcolumn=yes
set updatetime=50
let mapleader=" "
set spelllang=en_gb
map <F5> :setlocal spell! spelllang=en_us<CR>
set cursorline 				    " line where cursor is
set showcmd
set timeout timeoutlen=1500 	" timeout for command completion
set mouse=a			" enable mouse

if system('uname -s') == "Darwin\n"
  set clipboard=unnamed
else
  set clipboard=unnamedplus
endif

let python_highlight_all=1

set backspace=indent,eol,start	" enable backspace
syntax on			" where exists, show syntax
set number			" visible line numbers 
set rnu				" relative numbers
set encoding=utf-8		" guess what... UTF-8 encoded
set splitbelow
set splitright
set wildmenu			" visual autocomplete for commands
set showmatch 			" highlight matching [{()}]
set incsearch           	" search as characters are entered
set hlsearch            	" highlight matches
set t_Co=256			" powerline requires colors
set laststatus=2		" always show status / powerline
set nofoldenable    		" disable folding
set foldmethod=syntax

" <leader>c to nerdcommenter toggle
map <leader>c <Plug>NERDCommenterToggle

" Enable folding with leader 1 (its off default)
nnoremap <leader>1 za
vnoremap <leader>2 zf

" coc-yank list
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

"Completion settings
"Use complete_info() if you need confirm completion only when there's selected complete item
if exists('*complete_info')
    inoremap <silent><expr> <cr> complete_info(['selected'])['selected'] != -1 ? "\<C-y>" : "\<C-g>u\<CR>"
endif
"Use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<Tab>" :
            \ coc#refresh()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" alt backspace to delete previous word
" this doesn't work though
imap <M-BS> <C-w>
nmap <M-BS> db

" handy stuff
" yank current word
nmap <leader>yw yiw
" delete current word
nmap <leader>dw diw
"delete word then paste
" nnoremap <leader>cp "_diwP

" Color and such
colorscheme nord
" let g:airline_theme='molokai'   			" molokai, zenburn and solarized are nice, can also use :AirlineTheme
let g:airline#extensions#tabline#enabled = 1

" various aliases and maps
" leader f is nerdtree for files
nmap <leader>§ :NERDTreeToggle<cr> 

nmap <leader>o :so %<cr>
" nmap <leader>t :VimtexTocOpen<cr>  " leader t is latex tree
nmap <leader>w :w<cr>      	   " leader w is write
nmap <leader>q :q<cr>              " leader q is quit
nmap <leader>e :wq!<cr>            " leader e is write quit!
nmap <leader><leader>q :q!<cr>     " leader leader q is quit!
" search for text in fzf mode
nmap <leader><leader>/ :Lines<cr>
nmap <leader>z :Goyo<cr>  	   " magic zen mode
" nmap pr :LivedownToggle<CR>        " preview markdown
" nmap pdf :Pandoc pdf<CR>           " generate pdf by typing pdf
nnoremap <leader>r :!%:p<CR>       " run buffer with leader r

" resize current buffer by +/- 5 
" nnoremap <S-l> :vertical resize -5<cr>
" nnoremap <S-h> :vertical resize +5<cr>
" nnoremap <S-j> :resize +5<cr>
" nnoremap <S-k> :resize -5<cr>

" go through buffers
" map gn :bn<cr>
" map gp :bp<cr>

" Go to first char of line - could also use shift i
map 0 ^

" shortcuts for edit surrounding with ' and "
nmap <leader>' ysiw'
nmap <leader>" ysiw"

" tagbar
nmap <leader>= :TagbarToggle<CR>

" tablemode
" nmap <leader><leader>t :TableModeToggle<CR>

" Bookmark settings
" mm sets and ma browse bookmarks
highlight BookmarkSign ctermbg=NONE ctermfg=160
highlight BookmarkLine ctermbg=194 ctermfg=NONE
let g:bookmark_sign = '♥'
let g:bookmark_highlight_lines = 1

" NERDcommenter settings
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1
let g:NERDDefaultAlign = 'left'
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
map <C-]> <plug>NERDCommenterToggle

" Prompt for a command to run
" map <Leader>c :VimuxPromptCommand<CR>

" Settings for Writting
" just makes it nicer
" let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'

" Vim-pencil Configuration
" augroup pencil
  " autocmd!
  " autocmd FileType markdown,mkd,md call pencil#init()
  " " autocmd FileType text            call pencil#init()
" augroup END

" stuff for easymotion
" let g:EasyMotion_do_mapping = 0 " Disable default mappings
" map <leader>/ <Plug>(incsearch-easymotion-/)

" incsearch.vim x fuzzy x vim-easymotion

" function! s:config_easyfuzzymotion(...) abort
  " return extend(copy({
  " \   'converters': [incsearch#config#fuzzy#converter()],
  " \   'modules': [incsearch#config#easymotion#module()],
  " \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  " \   'is_expr': 0,
  " \   'is_stay': 1
  " \ }), get(a:, 1, {}))
" endfunction

" noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())

function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzyword#converter()],
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> <leader>/ incsearch#go(<SID>config_easyfuzzymotion())

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
" nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)
" map  w <Plug>(easymotion-bd-w)
" nmap w <Plug>(easymotion-overwin-w)
" nmap <leader><leader>f <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
" map <Leader>j <Plug>(easymotion-j)
" map <Leader>k <Plug>(easymotion-k)

"incsearch related stuff..
" nmap / <Plug>(incsearch-easymotion-/)
" nmap z/ <Plug>(incsearch-easymotion-/)
" nmap <leader>/ <Plug>(incsearch-easymotion-/)
" nmap z? <Plug>(incsearch-easymotion-?)
" nmap zg/ <Plug>(incsearch-easymotion-stay)
" You can use other keymappings like <C-l> instead of <CR> if you want to
" use these mappings as default search and sometimes want to move cursor with
" EasyMotion.

function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))

" youcompleteme behavior
" let g:ycm_autoclose_preview_window_after_completion=1
" map <leader>gd  :YcmCompleter GoToDefinitionElseDeclaration<CR>
" nmap <leader>gr :YcmCompleter GoToReferences<CR>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" nerdtree defaults
let NERDTreeWinSize = 45
let NERDTreeQuitOnOpen=1

" Goyo stuff
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
nmap <Leader><leader>l <Plug>(Limelight)
xmap <Leader><leader>l <Plug>(Limelight)

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
" let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
" let g:limelight_paragraph_span = 1

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
" let g:limelight_bop = '^\s'
" let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
" let g:limelight_priority = -1

" Tabularize shortcut
if exists(":Tabularize")
  nmap <leader><leader>a :Tabularize /=<CR>
  vmap <leader><leader>a :Tabularize /=<CR>
  nmap <leader><leader>a: :Tabularize /:\zs<CR>
  vmap <leader><leader>a: :Tabularize /:\zs<CR>
endif

" leader ww swaps windows
let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <silent> <leader>yw :call WindowSwap#MarkWindowSwap()<CR>
nnoremap <silent> <leader>pw :call WindowSwap#DoWindowSwap()<CR>
nnoremap <silent> <leader>] :call WindowSwap#EasyWindowSwap()<CR>

" fzf tweaking and shortcuts
"let g:fzf_preview_window = 'right:60%'

" open fzf f for files with ctrl-p
nnoremap <c-p> :Files<CR>

" open fzf grep for content in file - g for grep
" nnoremap <leader>g :Rg<CR>
" fzf help search all commands available
nmap <leader>m <plug>(fzf-maps-n)
xmap <leader>m <plug>(fzf-maps-x)
omap <leader>m <plug>(fzf-maps-o)

" Insert mode completion
imap <c-w> <plug>(fzf-complete-word)
imap <c-f> <plug>(fzf-complete-path):
imap <c-j> <plug>(fzf-complete-file-ag)
imap <c-l> <plug>(fzf-complete-line)

" navigating easier with ctrl hjkl
" also available is ctrl+w hjkl
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

" buffer tabbing
nnoremap <leader><tab> :Buffers<cr>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" turn on/off search highlight
nnoremap <leader>\ :set invhlsearch<CR>

" setup powerline specials
let g:airline_powerline_fonts=1
"set fillchars+=stl:\ ,stlnc:\

" searching files with ag is fast
" let g:ackprg = 'ag --vimgrep'
" nnoremap <leader>a :Ack!<Space>

"split navigations
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>

" fold docstring
let g:SimpylFold_docstring_preview=1

au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

" augroup markdown
    " au!
    " au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
" augroup END

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
let g:nv_search_paths = ['~/Dropbox/notes']
let g:nv_default_extension = '.md'
let g:nv_create_note_window = 'tabedit'
" After searching, press ctrl-x and save new note
" String. Must be in the form 'ctrl-KEY' or 'alt-KEY'
let g:nv_create_note_key = 'ctrl-n'
let g:nv_wrap_preview_text = 1

" leader n searches notes
nnoremap <silent> <leader>n :NV<CR>

"make YCM compatible with UltiSnips (using supertab)
" let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
" let g:SuperTabDefaultCompletionType = '<C-n>'

"better key bindings for UltiSnipsExpandTrigger
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger = "<tab>"
" let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" let g:UltiSnipsEditSplit="vertical" " If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsListSnippets="<c-l>"
" inoremap <s-tab> <C-p>

" let g:ulti_expand_or_jump_res = 0 "default value, just set once
" function! Ulti_ExpandOrJump_and_getRes()
"     call UltiSnips#ExpandSnippetOrJump()
"     return g:ulti_expand_or_jump_res
" endfunction

" inoremap <CR> <C-R>=(Ulti_ExpandOrJump_and_getRes() > 0)?"":"\n"<CR>

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

nnoremap <silent> <leader>h :call ToggleWindowHorizontalVerticalSplit()<cr>

if has("gui_running")
   let s:uname = system("uname")
   if s:uname == "Darwin\n"
      set guifont=Meslo\ LG\ S\ for\ Powerline
   endif
endif
