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

""" unite.vim
" 入力モードで開始する
" let g:unite_enable_start_insert=1
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

