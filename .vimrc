"  INSTALL PLUGINS VIA VUNDLE
"-----------------------------------------------------

" Required stuff
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'vim-scripts/Decho'
Bundle 'altercation/vim-colors-solarized'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'pangloss/vim-javascript'
"Bundle 'vim-scripts/JavaScript-Indent'
Bundle 'groenewege/vim-less'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'vim-gitgutter'
Bundle 'kien/ctrlp.vim'
"Bundle 'scrooloose/syntastic'
Bundle 'othree/javascript-libraries-syntax.vim'
Bundle 'othree/html5.vim'
Bundle 'nathanaelkane/vim-indent-guides.git'
"Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-fugitive'
"Bundle 'wookiehangover/jshint.vim'
"Bundle 'Lokaltog/powerline'
"Bundle 'bling/vim-airline'
"Bundle 'edkolev/tmuxline.vim'
Bundle 'morhetz/gruvbox'
"Bundle 'csapprox'
Bundle 'kchmck/vim-coffee-script'
Bundle 'bigfish/vim-js-context-coloring'
Bundle 'junegunn/vim-easy-align'
Bundle 'nicklasnygren/vim-ngdoc'
Bundle 'Valloric/YouCompleteMe'
Bundle 'marijnh/tern_for_vim'
Bundle 'Raimondi/delimitMate'
"Bundle 'vim-scripts/HTML-AutoCloseTag'
Bundle 'mattn/emmet-vim'

"-----------------------------------------------------
" SETTINGS
"-----------------------------------------------------

" Syntax/indent stuff
syntax on
filetype plugin indent on
set autoindent
set smartindent
set expandtab

let g:js_context_colors_enabled=0
" let g:js_context_colors_foldlevel=16
" g:js_context_colors
" let g:js_context_colors_insertmode=1
" let g:js_context_colors_usemaps=1
" let g:js_context_colors_colorize_comments=1
let g:js_context_colors_comment_higroup=1
" g:js_context_colors_debug

" Tab/indentation settings
set tabstop=2
set shiftwidth=2
set softtabstop=0
set expandtab
set fdm=marker
set textwidth=88
set nocindent
set ruler

"   highlight all its matches.
set hlsearch

"   allow backspacing over indentation, end-of-line, and
"   start-of-line; see 'help bs'.
set backspace=indent,eol,start

"   turn off the beep!
set noerrorbells

" Set encoding to UTF8
set encoding=utf-8

" Enable line numbers
set number

" Enable mouse
set mouse=a

" As-you-type-search
set incsearch

" Ignore case by default
set ignorecase
set smartcase

" Update window title
set title

" Undo levels
set undodir=$HOME/.vim/undo
set undolevels=500

" Don't do swap files
set noswapfile
set nowb
set nobackup

" improves performance -- let OS decide when to flush disk
set nofsync

" Show the current mode
set showmode

"-------------------------------------------------
" VISUAL
"-------------------------------------------------

" Theme settings
"set t_Co=256
"let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
set background=dark
"let g:solarized_termcolors=256
"let g:solarized_visibility="high"
"let g:solarized_contrast="high"
"let g:solarized_termtrans=0
"let g:solarized_termcolors=256
colorscheme solarized
"highlight Normal ctermbg=base03

let c_C99=1
let c_c_vim_compatible=1
let c_comment_strings=1
let c_comment_numbers=1
let c_comment_types=1
let c_warn_nested_comments=1
let c_cpp_comments=1
let c_ansi_typedefs=1
let c_ansi_constants=1
let c_posix=1
let c_comment_date_time=1
let c_minlines=25
let c_C89=1
let c_gnu=1
let c_syntax_for_h=1

"--------------------------------------------------
" PLUGIN SPECIFIC
"--------------------------------------------------

" Puts a dummy to not make git gutter jumpy 
:sign define dummy
:execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_ruby_exec = '~/.rvm/bin/ruby-1.9.3-p194'

" JS Syntax
" autocmd BufReadPre *.js let b:javascript_lib_use_jquery     = 1
" autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 1
" autocmd BufReadPre *.js let b:javascript_lib_use_backbone   = 1
" autocmd BufReadPre *.js let b:javascript_lib_use_prelude    = 0
" autocmd BufReadPre *.js let b:javascript_lib_use_angularjs  = 1

" Indent guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 2
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgrey

" Git-gutter same color as number gutter
highlight SignColumn ctermbg=black
highlight GitGutterAdd ctermbg=black ctermfg=cyan
highlight GitGutterChange ctermbg=black ctermfg=cyan
highlight GitGutterDelete ctermbg=black ctermfg=cyan
highlight GitGutterChangeDelete ctermbg=black ctermfg=cyan

" Powerline stuff
"set rtp+=/Users/nicklasnygren/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim
set laststatus=2
let g:Powerline_symbols='fancy'
let g:fugitive_github_domains = ['git.github.com']
"call vam#ActivateAddons(['powerline'])
set fillchars+=stl:\ ,stlnc:\

" JSLint for Syntastic
let g:syntastic_javascript_checkers = ['jslint']

" Airline/Tmuxline
let g:airline_powerline_fonts = 1
let g:tmuxline_preset = {
  \'a'    : '#S',
  \'b'    : ' #(git rev-parse --abbrev-ref HEAD)',
  \'win'  : ['#I', '#W'],
  \'cwin' : ['#I', '#W', '#F'],
  \'z'    : '#(whoami)'}

" Redraw on focus
au FocusGained * :q!

" Nerdtree stuff
map <Leader>m <plug>NERDTreeTabsToggle<CR>

"--------------------------------------------------
" BINDINGS
"--------------------------------------------------

" Remap leader
let mapleader=","

" Unmap stuff 
nnoremap Q <Nop>
imap <BS> <Nop>

" Some text expansion
"inoremap ( ()<Esc>i
"inoremap [ []<Esc>i
"inoremap { {<CR>}<Esc>O

" Map directional buttons to hjkl
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

nmap <silent> f @f<CR>

" Paste toggle on F2
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" Leader stuff
map <leader>gq :CtrlPQuickfix<cr>
map <leader>gt :CtrlPTag<cr>
map <leader>f :CtrlP<cr>
map <leader>b :CtrlPBuffer<cr>
map <leader>e :edit %%
map <leader>v :view %%;
map <leader>. :JSContextColorToggle<CR>
map <leader>c !defcol<cr>
nnoremap <leader><leader> <c-^>

" Splits
map <leader>gr :topleft 100 :split README.md<cr>
map <leader>gb :topleft 100 :split bower.json<cr>
map <leader>gg :topleft 100 :split Gruntfile.js<cr>

" CSS Mega indent thing
function! Incr()
  let a = line('.') - line("'<")
  let c = virtcol("'<")
  if a > 0
    execute 'normal! '.c.'|'.a."\<C-a>"
  endif
  normal `<
endfunction
vnoremap <C-a> :call Incr()<CR>

" Javascript stuff
" ----------------------------------------------------
" au FileType javascript JSContextColor


" Spelling check
" ----------------------------------------------------
"     Misspelled            Correctly spelled
abbr  anme                  name
abbr  asve                  save
abbr  avr                   var
abbr  evnet                 event
abbr  fcuntion              function
abbr  fnuction              function
abbr  fucntion              function
abbr  funciton              function
abbr  functino              function
abbr  funtion               function
abbr  funtion               function
abbr  mnae                  name
abbr  restirct              restrict
abbr  scpe                  scope
abbr  scpoe                 scope
abbr  serach                search
abbr  serach                search
abbr  svae                  save
abbr  unfction              function

" EasyAlign
" ----------------------------------------------------
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" JSDoc
" ----------------------------------------------------
let g:jsdoc_allow_input_prompt=1

" Auto expand
let delimitMate_expand_cr=1

" You complete me
set completeopt-=preview
let g:ycm_add_preview_to_completeopt=0

" Emmet
let g:user_emmet_leader_key='<C-j>'
