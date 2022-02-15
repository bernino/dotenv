" README
" This .vimrc intends to make it easier to write Python, LaTeX and Markdown as
" well as making Vim faster to use in general along the lines of VSCode, such
" as binding quit, write and other frequently used things to <leader>q. See
" below for more info.
"
" TODO: refactor entire file that each plugin has its configs just after it.
" And test:
" https://github.com/t9md/vim-textmanip
"
" Autocomplete: It offers autocomplete via CoC and using ultisnips; tab and enter are your friends here.
" It takes a while to get use to but becomes a super power real quick.
"
" Autopairs: and surrounding are automatic for (),[],{} etc. (via CoC coc-pairs)
"
" EasyMotion: is enabled to jump around with chars, try s and / making it much
" faster to search and jump. <tab> also goes through search results.
"
" Wordobjects: Smart word objects such as delete word: diw and a more powerful . repeater.
"
" FZF: is also integrated see below shortcuts and below :
" https://medium.com/@sidneyliebrand/how-fzf-and-ripgrep-improved-my-workflow-61c7ca212861
"
" Notes: Its got a notetaker with fuzzy search that can be integrated with Dropbox,
" so notes are in Markdown and available everywhere.
"
" Jumps: This is standard Vim stuff, but do have a reminder of jumping to last
" edits, namely CTRL+o and CTRL+i amongst other things... :help jumplist. I
" guess shortcuts are your friend: https://vim.rtorr.com/
"
" LaTeX: Vimtex gives some commands such as:
" cse/dse change delete environment
" csc/dsc change delete command
" \ll \lv and \lc - compile, open, clear
" ctrl-] ctrl-t jump tags
"
" See below for instructions on all the smart stuff and their keybindings.

" PREREQUISITES:
" No power comes without dependencies... standing on the shoulders of giants:
"
" - Python enabled Vim
" - Vundle do: git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" - start vim and do :PluginInstall
" - fzf and other apps installed - it will spit errors...
" - Mac: brew install the_silver_searcher if on mac https://github.com/ggreer/the_silver_searcher
"   similar tools needed on UNIX but don't worry, it spits errors, then
"   install.
" - Do also install some CoC plugins like CocInstall ultisnips; search around
"   for more...
" TODO: try a clean install and find all dependencies

" USE:
" leader                  : <space>
" source current file     : <leader>o - nice for .vimrc testing
" jump windows            : ctrl+ww
" Last Prev edit          : ctrl+o and i
" zen writing mode        : <leader>z to toggle
" easymotion search       : / - don't enter but <tab> through then enter then
" quit                    : <leader> q - making life easy
" write file              : <leader> w - making life easy
" easymotion two char     : s for quick easymotion navigation
" latex structure         : \lt
" latex compile           : \ll
" latex clear             : \lc
" nerdtreee browser       : <leader> (next to 1)
" TagBar                  : <leader>= to toggle
" bookmark                : mm and ma
" notes in markdown       : <leader>n and <c-v> to open note in split view, <c-n> to create new note
" toggle commenting       : <leader>c to toggle.. <leader>cc or cm
" table mode              : <leader><leader>t
" fzf search in file      : <leader>l (: Lines) for when searching is hard
" fzf search in file      : <leader>h (: History) of past files opened
" fzf search for files    : <leader>f (: Files) fuzzy search files
" list buffers            : <leader>b (: Buffer) fuzzy see buffers
" fzf on all commands     : <leader>m map of all vim commands
" swap windows            : <c-w>r TODO: remap swap windows
" go to references        : gr as part of CoC
" go to definition        : gd as part od CoC
" center screen           : zz as part od CoC
" delete word             : <ctrl> backspace based on diwi
" insert last entered     : <ctrl> r . - might depend on plugin repeat
" pg fwd/bwd reminder     : <ctrl> f and b
" add '' around word      : <leader>' - remember u to undo...
" add "" around word      : <leader><leader>' (because its faster than shift ')
" vsplit buffers          : <leader>arrows - this splits buffers to vsplit
" mark all words for easy : <leader>j
" tabularize text         : <leader><leader>a visual select text first (tAbularize maybe lame)
" turn off search light   : <leader>\
" check diff since last w : <leader>d - for diff
" zoom tab toggle         : <leader><leader>z

" USE end

" Required settings for Vundle
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" TODO:  order plugin by topic
" The order matters!
Plugin 'gmarik/Vundle.vim'                          	" The manager -- install first then run :PluginInstall
Plugin 'neoclide/coc.nvim', {'branch': 'release'}       " autocomplete and language server https://github.com/neoclide/coc.nvim
Plugin 'preservim/vim-wordy.git'                        " https://github.com/preservim/vim-wordy
Plugin 'majutsushi/tagbar'                          	" https://github.com/majutsushi/tagbar
Plugin 'godlygeek/tabular'                          	" http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
Plugin 'preservim/vim-markdown'                         " https://github.com/preservim/vim-markdown
Plugin 'jeetsukumaran/vim-buffergator'              	" https://github.com/jeetsukumaran/vim-buffergator prob not needed with :Buffer as well?
Plugin 'reedes/vim-pencil'  		                	" https://github.com/reedes/vim-pencil does softwraps TODO: settings and test
Plugin 'vim-syntastic/syntastic'                    	" checking syntax https://github.com/vim-syntastic/syntastic
Plugin 'scrooloose/nerdtree'                        	" file browser <leader>f https://github.com/preservim/nerdtree
" Plugin 'tpope/vim-surround'                         	" ysiw iw a word object https://github.com/tpope/vim-surround
                                                        " ysaw is also cool https://weibeld.net/vim/surround-plugin.html
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } } 	" fzf integration https://github.com/junegunn/fzf
Plugin 'junegunn/fzf.vim'                               " https://github.com/junegunn/fzf.vim
Plugin 'preservim/nerdcommenter'                    	" https://github.com/preservim/nerdcommenter
Plugin 'https://github.com/alok/notational-fzf-vim' 	" nValt for vim
Plugin 'vim-pandoc/vim-pandoc'                      	" https://github.com/vim-pandoc/vim-pandoc
Plugin 'vim-pandoc/vim-pandoc-syntax'               	" needed for pandoc above
Plugin 'conornewton/vim-pandoc-markdown-preview'    	" https://github.com/conornewton/vim-pandoc-markdown-preview
Plugin 'vim-airline/vim-airline' 	            		" https://github.com/vim-airline/vim-airline
Plugin 'vim-airline/vim-airline-themes'         		" https://github.com/vim-airline/vim-airline-themes
Plugin 'tpope/vim-repeat'                           	" https://github.com/tpope/vim-repeat allows for complex . repeats
Plugin 'easymotion/vim-easymotion'                  	" https://github.com/easymotion/vim-easymotion
Plugin 'mg979/vim-visual-multi', {'branch': 'master'}   " <c-n> on top of word magic https://github.com/mg979/vim-visual-multi
" TODO: git integration
" Plugin 'kablamo/vim-git-log' 			            	" https://github.com/kablamo/vim-git-log
" Plugin 'gregsexton/gitv' 			                	" https://github.commands/gregsexton/gitv
" Plugin 'tpope/vim-fugitive' 			            	" git commands https://github.com/tpope/vim-fugitive
" Plugin 'airblade/vim-gitgutter'                     	" git diff live https://github.com/airblade/vim-gitgutter
Plugin 'MattesGroeger/vim-bookmarks' 		            " try mm and ma https://github.com/mattesgroeger/vim-bookmarks
" Plugin 'christoomey/vim-tmux-navigator' 	            " https://github.com/christoomey/vim-tmux-navigator
" Plugin 'benmills/vimux' 			                 	" https://github.com/benmills/vimux
Plugin 'junegunn/goyo.vim' 			                	" Zen mode for vim https://github.com/junegunn/goyo.vim
Plugin 'junegunn/limelight.vim' 		            	" https://github.com/junegunn/limelight.vim
Plugin 'dhruvasagar/vim-table-mode' 	        		" table mode https://github.com/dhruvasagar/vim-table-mode
Plugin 'arcticicestudio/nord-vim' 		            	" https://github.com/arcticicestudio/nord-vim my fav colorscheme
Plugin 'luochen1990/rainbow'                            " colored nested parenthesis https://github.com/luochen1990/rainbow
Plugin 'https://github.com/tpope/vim-surround'          " https://github.com/tpope/vim-surround.git
Plugin 'machakann/vim-sandwich'		                	" https://github.com/machakann/vim-sandwich change surroundings of a sandwiched textobject
Plugin 'lervag/vimtex'                              	" LaTeX helpers https://github.com/lervag/vimtex
Plugin 'ludovicchabant/vim-gutentags'                   " https://github.com/ludovicchabant/vim-gutentags.git
Plugin 'sirver/ultisnips'                            	" rocket science snippet engine https://github.com/sirver/UltiSnips
Plugin 'honza/vim-snippets'                         	" snippets for ultisnips https://github.com/honza/vim-snippets
Plugin 'ntpeters/vim-better-whitespace' 	        	" https://vimawesome.com/plugin/better-whitespace
Plugin 'ryanoasis/vim-devicons' 	            		" https://github.com/ryanoasis/vim-devicons
Plugin 'troydm/zoomwintab.vim'                          " zooms tabs https://github.com/troydm/zoomwintab.vim
Plugin 'lambdalisue/battery.vim'                        " https://github.com/lambdalisue/battery.vim
Plugin 'sheerun/vim-polyglot'                           " https://github.com/sheerun/vim-polyglot
Plugin 'Chiel92/vim-autoformat'                         " https://github.com/vim-autoformat/vim-autoformat

" CoC installation
" CoC allows for its own plugins and you could consider:
"   - coc-snippets (multiple snippets support) https://github.com/neoclide/coc-snippets
"   - coc-ultisnips (support ultisnips) https://www.npmjs.com/package/coc-ultisnips
"   - coc-ltex (spellchecking) https://valentjn.github.io/ltex/index.html
"   - coc-yank (yank history and autocomplete) https://github.com/neoclide/coc-yank
"   - coc-webview (external browser to support webview) https://github.com/weirongxu/coc-webview
"   - coc-marketplace (list all extensions) https://github.com/fannheyward/coc-marketplace
"   - coc-browser (autocomplete words from browser) https://github.com/voldikss/coc-browser
"   - coc-vimtex (integration with  vimtex) https://github.com/neoclide/coc-vimtex
"   - coc-texlab (LaTeX more completion) https://github.com/fannheyward/coc-texlab
"   see https://github.com/latex-lsp/texlab-vscode for demo
"
"   - coc-pyright (python linter) https://github.com/fannheyward/coc-pyright
"   - coc-markdown-preview-enhanced (markdown preview) https://github.com/weirongxu/coc-markdown-preview-enhanced
"   :CocCommand markdown-preview-enhanced.openPreview TODO: keybindings
"
"   - coc-diagnostic (another linter) https://github.com/iamcco/coc-diagnostic
"   - coc-lightbulb (codeactions notifier) https://github.com/xiyaowong/coc-lightbulb-
"   - coc-pairs (auto pairs) https://github.com/neoclide/coc-pairs
"
" Note you can add extension names to the g:coc_global_extensions
" variable, and coc will install the missing extensions after coc.nvim service started. For example:
"
let g:coc_global_extensions = [
            \ 'coc-snippets',
            \ 'coc-ultisnips',
            \ 'coc-ltex',
            \ 'coc-yank',
            \ 'coc-webview',
            \ 'coc-marketplace',
            \ 'coc-browser',
            \ 'coc-vimtex',
            \ 'coc-texlab',
            \ 'coc-pyright',
            \ 'coc-diagnostic',
            \ 'coc-lightbulb',
            \ 'coc-pairs',
            \ 'coc-tag'
            \ ]

" Or you can install by ':CocList marketplace' or :CocInstall coc-lightbulb

" Handy stuff to edit snippets:
" :CocList snippets to open snippets list.
" :CocCommand snippets.editSnippets to edit user snippet of current filetype.
" :CocCommand snippets.openSnippetFiles to open snippet files of current filetype.

" required for vundle
call vundle#end()
filetype plugin indent on

" Configuration of Plugins and general settings below
"
" <leader> is space which is fast and easy for me because my thumb rests
let mapleader=" "

autocmd FileType markdown let b:coc_pairs_disabled = ['`']

" Airline, Color and tabline settings
colorscheme nord
let g:airline_theme='nord_minimal'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#battery#enabled = 1
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#coc#show_coc_status = 1
let g:airline#extensions#fzf#enabled = 1

" rainbow - colored nested () turned on
let g:rainbow_active = 1

" use 4 spaces for tabs
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround

" make MacVim font awesome work
set guifont=MesloLGS\ NF:h14
" set virtualedit=all
set belloff=all
set complete+=kspell
" set hidden allows for unsaved buffers
set hidden
" no wrapping; get's set by filetype at end
set nowrap
set termguicolors
set signcolumn=yes
set updatetime=750
set spelllang=en_gb
set cursorline
set showcmd
" timeout for command completion
set timeout timeoutlen=500
" enable mouse
set mouse=a
" clipboard on mac
if system('uname -s') == "Darwin\n"
  set clipboard=unnamed
else
  set clipboard=unnamedplus
endif
let python_highlight_all=1
" enable backspace
set backspace=indent,eol,start
" where exists, show syntax
syntax on
syntax enable
" visible line numbers
set number
" relative numbers so its easy to eg 10j
set rnu
" guess what... UTF-8 encoded
set encoding=utf-8
set fileencodings=utf-8
set splitbelow
set splitright
" visual autocomplete for commands
set wildmenu
" highlight matching [{()}]
set showmatch
" search as characters are entered
set incsearch
" highlight matches
" set hlsearch
" powerline requires colors
set t_Co=256
" always show status / powerline
set laststatus=2
" disable folding
" set nofoldenable
" set foldmethod=indent

" Markdown previewer
let g:md_pdf_viewer="open -a Skim"
let g:vim_markdown_folding_disabled = 1

" CoC setup is tricky to configure with <tab> and <cr>
" first get rid of ultisnips tab expansion
let g:UltiSnipsExpandTrigger = "<Nop>"
" let g:UltiSnipsJumpForwardTrigger = "<TAB>"
" let g:UltiSnipsJumpBackwardTrigger = "<TAB>"

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

inoremap <expr> <tab>
   \ pumvisible() ? "\<c-n>" :
   \ coc#jumpable() ? "\<c-r>=coc#rpc#request('snippetNext', [])<cr>" :
   \ "\<tab>"

" shit tab reverse completion menu
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" <CR> is select if pumvisible
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                  \: "\<c-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use <c-space> to trigger completion menu
inoremap <silent><expr> <c-space> coc#refresh()

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

" Use [g and ]g to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" CoC references
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"
"
" KEYBINDINGS GENERAL
"
"
nmap <leader>d :w !diff % - <CR>


" put \begin{} \end{} tags tags around the current word
" map  <C-B>      YpkI\begin{<ESC>A}<ESC>jI\end{<ESC>A}<esc>kA
" map! <C-B> <ESC>YpkI\begin{<ESC>A}<ESC>jI\end{<ESC>A}<esc>kA

" double "" (( around visual adds them
" vnoremap (( "sc(<C-r>s)<Esc>
" vnoremap "" "sc"<C-r>s"<Esc>
" delete current word in insert mode
inoremap <C-w> <ESC>diwi
" ctrl backspace to delete current word in insert mode
imap <C-BS> <C-w>
" backspace delete word in normal mode
nmap <C-BS> diw
map <F5> :setlocal spell! spelllang=en_us<CR>
nmap <leader>§ :NERDTreeToggle<cr>
nmap <leader>o :so %<cr>
" nmap <leader>t :VimtexTocOpen<cr>
nmap <leader>w :w<cr>
nmap <leader>q :q<cr>
nmap <leader>Q :q!<cr>
nmap <leader>e :edit<space>
nmap <leader>l :Lines<cr>
nnoremap <leader>f :Files<CR>
map <c-p> :Files<CR>
nnoremap <C-g> :Rg<Cr>
nnoremap <leader><leader>b :Buffers<cr>
map <c-e> :Buffers<cr>
nmap <silent> <leader>h :History<CR>
nmap <leader>m <plug>(fzf-maps-n)
xmap <leader>m <plug>(fzf-maps-x)
omap <leader>m <plug>(fzf-maps-o)
nmap <leader><leader>z :ZoomWinTabToggle<CR>
nmap <leader>= :TagbarToggle<CR>
" Go to first char of line - could also use shift i
map 0 ^
" shortcuts for edit surrounding with ' and "
" TODO toggle ' with cs'
nmap <leader>' ysiw'
nmap <leader><leader>' ysiw"
nmap <leader>} ysiw}
"turn on/off search highlight
nnoremap <leader>\ :set invhlsearch<CR>
" nerdcommenter toggle set to / almost like VSCode
map <leader>/ <Plug>NERDCommenterToggle
" folding with leader 1
nnoremap <leader>1 za
vnoremap <leader>1 zf
" coc-yank history list
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>
" tablemode
nmap <leader><leader>t :TableModeToggle<CR>

" Bookmark settings
let g:bookmark_sign = '♥'

" NERDcommenter settings
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1
let g:NERDDefaultAlign = 'left'
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" vimux prompt for a command to run
" map <Leader>c :VimuxPromptCommand<CR>

" Vim-pencil Configuration
" let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'
" augroup pencil
  " autocmd!
  " autocmd FileType markdown,mkd,md call pencil#init()
  " " autocmd FileType text            call pencil#init()
" augroup END

" stuff for easymotion
map  <Leader>j <Plug>(easymotion-bd-w)
nmap <Leader>j <Plug>(easymotion-overwin-w)
nmap s <Plug>(easymotion-overwin-f)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
" Turn on case-insensitive feature
" let g:EasyMotion_smartcase = 1
" JK motions: Line motions
" map <Leader>j <Plug>(easymotion-j)
" map <Leader>k <Plug>(easymotion-k)

" nerdtree defaults
let NERDTreeWinSize = 45
let NERDTreeQuitOnOpen=1

" zen/limelight settins
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Tabularize shortcut
if exists(":Tabularize")
  nmap <leader><leader>a :Tabularize /=<CR>
  vmap <leader><leader>a :Tabularize /=<CR>
  nmap <leader><leader>a: :Tabularize /:\zs<CR>
  vmap <leader><leader>a: :Tabularize /:\zs<CR>
endif

" Insert mode completion for fzf
" imap <c-w> <plug>(fzf-complete-word)
imap <c-f> <plug>(fzf-complete-path):
imap <c-a> <plug>(fzf-complete-file-ag)
" imap <c-l> <plug>(fzf-complete-line)

" navigating splits easier with ctrl hjkl
" nnoremap <C-H> <C-W>h
" nnoremap <C-J> <C-W>j
" nnoremap <C-K> <C-W>k
" nnoremap <C-L> <C-W>l

" ctrl-v to vsplit files in fzf and ctrl-e ctrl-e magic
  " \ 'ctrl-t': 'tab split',
  " \ 'ctrl-x': 'split',
let g:fzf_action = {
  \ 'ctrl-e': 'edit',
  \ 'ctrl-v': 'vsplit' }

" fold docstring
let g:SimpylFold_docstring_preview=1

" wrap markdown and tex
au BufNewFile,BufFilePre,BufRead *.tex
    \ set filetype=tex
    \ wrap
    \ autoindent

au BufNewFile,BufFilePre,BufRead *.md
    \ set filetype=markdown
    \ wrap
    \ autoindent

" is this needed versus python3 plugin?
" au BufNewFile,BufRead *.py
"     \ set tabstop=4
"     \  softtabstop=4
"     \  shiftwidth=4
"     \  textwidth=79
"     \  expandtab
"     \  autoindent
"     \  fileformat=unix

" vimtex settings
let g:vimtex_view_method='skim'
" ignore some warnings (regex based)
let g:vimtex_quickfix_ignore_filters = [
          \ 'Overfull',
          \ 'Underfull',
          \ 'hyperindex',
          \ 'global',
          \ 'inputenc',
          \]
" focus quick fix
let g:vimtex_quickfix_mode = 1
let g:tex_flavor = 'latex'
let g:vimtex_compiler_latexmk = {
        \ 'executable' : 'latexmk',
        \ 'build_dir' : 'metafiles',
        \ 'callback' : 1,
        \ 'continuous' : 1,
        \ 'options' : [
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \   '-shell-escape',
        \   '-8bit',
        \ ],
        \}

" let g:vimtex_view_general_options = '-r @line @pdf @tex'
" let g:vimtex_compiler_latexmk_engines = {
    " \ '_'                : '-xelatex',
"     \ 'pdflatex'         : '-pdf',
"     \ 'dvipdfex'         : '-pdfdvi',
"     \ 'lualatex'         : '-lualatex',
"     \ 'xelatex'          : '-xelatex',
"     \ 'context (pdftex)' : '-pdf -pdflatex=texexec',
"     \ 'context (luatex)' : '-pdf -pdflatex=context',
"     \ 'context (xetex)'  : '-pdf -pdflatex=''texexec --xtx''',
"     \}

" Notes in nvalt (notational velocity)
let g:nv_search_paths = ['~/Dropbox/notes']
let g:nv_default_extension = '.md'
let g:nv_create_note_window = 'vertical split'
let g:nv_create_note_key = 'ctrl-n'
let g:nv_wrap_preview_text = 1
nnoremap <silent> <leader>n :NV<CR>

" function to toggles vertical to horizontal window split
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

" magic zen mode
function! s:goyo_enter()
  set scrolloff=999
  set wrap
  Limelight
endfunction

function! s:goyo_leave()
  set scrolloff=5
  set nowrap
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
nmap <leader>z :Goyo<cr>
