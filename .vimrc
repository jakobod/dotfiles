" This is my personal .vimrc file. 

" -- Generally useful settings ------------------------------------------------

set tabstop=2       " The width of a TAB is set to 4.
set shiftwidth=2    " Indents will have a width of 4
set softtabstop=2   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces
syntax on           " Set syntax highlighting to on
set relativenumber  " Set line numbering for files
set colorcolumn=80  " Show vertical bar after 80 chars
set textwidth=80    " use 80 characters for wrapping
set ignorecase      " case-insensitive search

" -- Appearance ---------------------------------------------------------------

" Cursor Settings -> see: https://vim.fandom.com/wiki/Change_cursor_shape_in_different_modes
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" -- Keybindings --------------------------------------------------------------

let mapleader = ","

" Open NERDTree on <,nn>
nnoremap <silent> <Leader>nn :NERDTree<CR>

" remap ESC for either jk or kj
inoremap kj <ESC>
inoremap jk <ESC>

" -- Plugins ------------------------------------------------------------------

" Make sure plug is installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install listed plugins
call plug#begin('~/.vim/plugged')

" Adds IDE-like file views in current path on the left
Plug 'scrooloose/nerdtree'

" Allows fuzzy-search when opening files
Plug 'ctrlpvim/ctrlp.vim'

let g:ctrlp_use_caching = 0
let g:ctrlp_max_files = 0
let g:ctrlp_root_markers = ['.ctrlp']
if has('win32')
  let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'
else
  if executable('rg')
    let g:ctrlp_user_command = "rg %s --no-ignore-vcs --files --color=never " .
    \                          "-g '!build' -g '!bundle' " .
    \                          "-g '!3rdparty' -g '!*.swp'"
  else
    let g:ctrlp_user_command = 'find %s -type f'
  endif
endif

" Add autocompletion to vim
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-clang'
let g:deoplete#enable_at_startup = 1
set runtimepath+=~/.vim/plugged/deoplete.nvim/

" adds a status/tabline to VIM
Plug 'vim-airline/vim-airline'

" themes for the status line
Plug 'vim-airline/vim-airline-themes'

let g:airline#extensions#tabline#enabled=2     " show open buffers
let g:airline#extensions#tabline#fnamemod=':t' " omit path to current file
let g:airline_powerline_fonts=1                " use powerline symbols

call plug#end()

