let mapleader = "\<Space>"
set relativenumber
set tabstop=2
set expandtab
set smartindent
set list listchars=tab:\▸\-
set cursorline
set cursorcolumn
set completeopt=menuone
set shiftwidth=2
" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>



set showtabline=2 
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

let s:plugin = '~/.config/nvim/plugins/dein.toml'

let $CACHE = expand('~/.cache')
if !isdirectory($CACHE)
  call mkdir($CACHE, 'p')
endif

if &runtimepath !~# '/dein.vim'
  let s:dein_dir = fnamemodify('dein.vim', ':p')
  if !isdirectory(s:dein_dir)
    let s:dein_dir = $CACHE . '/dein/repos/github.com/Shougo/dein.vim'
    if !isdirectory(s:dein_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
    endif
  endif
  execute 'set runtimepath^=' . substitute(
        \ fnamemodify(s:dein_dir, ':p') , '[/\\]$', '', '')
endif

" Let dein manage dein


if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  " dein.tomlを起動時ロードの設定ファイルとして読み込む
  call dein#load_toml(s:plugin, {'lazy': 0})
  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif



" Required:
filetype plugin indent on
syntax enable

"End dein Scripts-------------------------

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

autocmd InsertLeave * set nopaste
inoremap <C-c> <Esc>
set cursorline
highlight CursorLine ctermbg=5
set belloff=all
set mouse=a

vnoremap <TAB> >gv
vnoremap <S-TAB> <gv
inoremap <TAB> <C-t>
inoremap <S-TAB> <C-d>
