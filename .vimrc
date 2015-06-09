"-----------------------------------------------------
"  INSTALL PLUGINS VIA VUNDLE
"-----------------------------------------------------

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
"Plugin 'vim-scripts/Decho'
Plugin 'altercation/vim-colors-solarized'
Plugin 'pangloss/vim-javascript'
Plugin 'groenewege/vim-less'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'vim-gitgutter'
Plugin 'kien/ctrlp.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'othree/html5.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'bigfish/vim-js-context-coloring'
Plugin 'junegunn/vim-easy-align'
Plugin 'Valloric/YouCompleteMe'
Plugin 'marijnh/tern_for_vim'
Plugin 'Raimondi/delimitMate'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/syntastic'

call vundle#end()
"-----------------------------------------------------
" SETTINGS
"-----------------------------------------------------

" Syntax/indent stuff
filetype plugin indent on
syntax on
set autoindent
set smartindent
set expandtab

" JS context coloring
let g:js_context_colors_enabled=0
let g:js_context_colors_comment_higroup=1

" Tab/indentation settings
set tabstop=2
set shiftwidth=2
set softtabstop=0
set expandtab
set fdm=marker
set textwidth=88
set cindent
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
let g:solarized_termtrans=1
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
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

" JS Syntax
autocmd BufReadPre *.js let b:javascript_lib_use_jquery     = 1
"" autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 1
autocmd BufReadPre *.js let b:javascript_lib_use_backbone   = 1
"" autocmd BufReadPre *.js let b:javascript_lib_use_prelude    = 0
autocmd BufReadPre *.js let b:javascript_lib_use_angularjs  = 1

" Git-gutter same color as number gutter
highlight SignColumn ctermbg=black
highlight GitGutterAdd ctermbg=black ctermfg=cyan
highlight GitGutterChange ctermbg=black ctermfg=cyan
highlight GitGutterDelete ctermbg=black ctermfg=cyan
highlight GitGutterChangeDelete ctermbg=black ctermfg=cyan

" Powerline stuff
set rtp+=/opt/boxen/homebrew/lib/python2.7/site-packages/powerline/bindings/vim
set laststatus=2
let g:Powerline_symbols='fancy'
let g:fugitive_github_domains = ['git.github.com']
"call vam#ActivateAddons(['powerline'])
set fillchars+=stl:\ ,stlnc:\

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

" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

set conceallevel=2 
let g:javascript_conceal = 1
let g:javascript_conceal_function = "ƒ"
