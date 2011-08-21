syntax on
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on
"ほげほげばーかばーか
let g:Tex_CompileRule_dvi = 'platex $*'
let g:Tex_ViewRule_dvi = 'xdvi-ja'

set autoindent smartindent " 自動インデント，スマートインデント
" 入力補助
set backspace=indent,eol,start " バックスペースでなんでも消せるように
set formatoptions+=m           " 整形オプション，マルチバイト系を追加

" コマンド補完
set wildmenu           " コマンド補完を強化
set wildmode=list:full " リスト表示，最長マッチ

" 検索関連
set wrapscan
set ignorecase
set smartcase 
set incsearch
set hlsearch   " 検索文字をハイライト
" ファイル関連
set autoread   " 他で書き換えられたら自動で読み直す
set hidden
"表示関連
set showmatch         " 括弧の対応をハイライト
set showcmd           " 入力中のコマンドを表示
set number            " 行番号表示
set ruler
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell
" Enable use of the mouse for all modes
set mouse=a
set cmdheight=2

set autoread

let g:Tex_BibtexFlavor = 'jbibtex -kanji=euc-jp'

"バイナリエディット
augroup BinaryXXD
 autocmd!
 autocmd BufReadPre  *.bin let &binary =1
 autocmd BufReadPost * if &binary | silent %!xxd -g 1
 autocmd BufReadPost * set ft=xxd | endif
 autocmd BufWritePre * if &binary | %!xxd -r | endif
 autocmd BufWritePost * if &binary | silent %!xxd -g 1
 autocmd BufWritePost * set nomod | endif
augroup END
