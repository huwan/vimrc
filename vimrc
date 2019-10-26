set nu
set ruler
set hlsearch
set ignorecase smartcase

" Enable cursor line position tracking:
set cursorline
" hi CursorLine   cterm=bold ctermbg=lightyellow ctermfg=black
" Remove the underline from enabling cursorline:
highlight clear CursorLine
" Set line numbering to red background:
" highlight CursorLineNR ctermbg=yellow

let mapleader=","

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundles/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.vim/bundles')
  call dein#begin('~/.vim/bundles')

  " Let dein manage dein
  " Required:
  call dein#add('~/.vim/bundles/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('vim-airline/vim-airline')
  call dein#add('tpope/vim-fugitive')
  call dein#add('vim-scripts/autotags')
  call dein#add('chazy/cscope_maps')
  call dein#add('tpope/vim-commentary')
  call dein#add('vim-scripts/a.vim')
  " call dein#add('terryma/vim-multiple-cursors')
  " call dein#add('scrooloose/nerdtree')
  " call dein#add('majutsushi/tagbar')
  " call dein#add('terryma/vim-expand-region')
  " call dein#add('junegunn/vim-easy-align')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" Airline
set laststatus=2
set t_Co=256
set noshowmode
set ambiwidth=double
let g:airline_section_y=''
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#whitespace#checks = [ 'trailing' ]
" let g:airline#extensions#whitespace#mixed_indent_algo = 1

" set expandtab
" set shiftwidth=4
" set softtabstop=4
set cindent
set cinoptions=(0
" Allow tabs in Makefiles.
autocmd FileType make,automake set noexpandtab shiftwidth=8 softtabstop=8
" Trailing whitespace and tabs are forbidden, so highlight them.
" highlight ForbiddenWhitespace ctermbg=red guibg=red
" match ForbiddenWhitespace /\s\+$\|\t/
" Do not highlight spaces at the end of line while typing on that line.
" autocmd InsertEnter * match ForbiddenWhitespace /\t\|\s\+\%#\@<!$/

" Removes trailing spaces
function TrimWhiteSpace()
  %s/\s*$//
  ''
" retab
:endfunction

map <F2> :call TrimWhiteSpace()<CR>
map! <F2> :call TrimWhiteSpace()<CR>

" Nerdtree
nmap <Leader>fl :NERDTreeToggle<CR>
let NERDTreeWinSize=32
let NERDTreeWinPos="left"
let NERDTreeShowHidden=0
let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeIgnore=['\.pyc', '\.pyo', '\.swp', '\~']
let NERDTreeQuitOnOpen=1

" Tagbar
nnoremap <Leader>tl :TagbarToggle<CR>
let g:tagbar_width = 32 " tagbar's width, default 20
let g:tagbar_right = 1  " on the right side

" Cscope
" Maps ctrl-c to find functions calling the function in cscope
nnoremap <C-c> :cs find c <C-R>=expand("<cword>")<CR><CR>

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" Jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" mkdir -p ~/.vim/swapfiles
set directory=~/.vim/swapfiles//

" To have *.inc files be recognized as Makefile
:let g:filetype_inc = "make"

" vim-commentary
autocmd FileType cfg setlocal commentstring=#\ %s
autocmd FileType c,cpp setlocal commentstring=//\ %s

" Mapping to toggle line numbers
nnoremap <silent> <leader>n :set nu!<CR>
nnoremap <silent> <leader>r :set relativenumber!<CR>
" nnoremap <silent> <leader>r :set relativenumber! <bar> set nu!<CR>

" open a file in readonly mode if it already has a swapfile
autocmd SwapExists * let v:swapchoice = "o"

" Autotags
let g:autotags_ctags_opts = "--c++-kinds=+p --fields=+iaS --extra=+q --extra=+f"
