" Author: rei-ashine
" DATE: Feb. 4th, 2021
" *****************************************************************************
"" Vim-Plug core
" *****************************************************************************
let g:polyglot_disabled = ['python']
let vimplug_exists=expand('~/.vim/autoload/plug.vim')
if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!\curl -fLo " . vimplug_exists . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"
  autocmd VimEnter * PlugInstall
endif
"----- vim-plug -----
call plug#begin('~/.vim/plugged')
"----- color scheme -----
Plug 'fenetikm/falcon', {'do': 'cp colors/* ~/.vim/colors/'}
Plug 'arzg/vim-colors-xcode', {'do': 'cp colors/* ~/.vim/colors/'}
Plug 'NLKNguyen/papercolor-theme', {'do': 'cp colors/* ~/.vim/colors/'}
"----- supertab -----
Plug 'ervandew/supertab'
"----- vim-airline -----
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"----- others -----
Plug 'w0rp/ale'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-commentary'
Plug 'sheerun/vim-polyglot'
call plug#end()


" Required:
filetype plugin indent on
" ale
let g:ale_linters = {}

set fenc=utf-8
set encoding=utf-8
scriptencoding utf-8
if has("multi_lang")
    language C
endif

colorscheme xcodedark
"colorscheme falcon
"colorscheme papercolor
set nocompatible
set noswapfile
syntax enable
set ttyfast

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END
" python
" vim-python
augroup vimrc-python
  autocmd!
  autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
      \ formatoptions+=croq softtabstop=4
      \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END
" ale
:call extend(g:ale_linters, {
    \'python': ['flake8'], })
" Syntax highlight
" Default highlight is better than polyglot
let python_highlight_all = 1

" enables the active / inactive functionality.
let g:falcon_background = 0
let g:falcon_inactive = 1

set number
set cursorline
set whichwrap=b,s,h,l,<,>,[,],~
set autoindent
set smartindent
set shiftwidth=4
set hlsearch
set ruler

"----- No Beep
set visualbell t_vb=
"----------Activate delete_key ----------
set backspace=indent,eol,start
"----------Activate clipboard----------
set clipboard+=unnamed
set clipboard&
set clipboard^=unnamedplus
set clipboard+=autoselect
"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

"----- User Powerline fonts -----
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
"let g:airline_theme = 'tomorrow'
"let g:falcon_airline = 1
let g:airline_theme = 'papercolor'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'
" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

