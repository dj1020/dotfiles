syntax on
set nocompatible                        "不使用 Vi 舊設定的樣子, 不太確定用途
set cursorline                          "高亮目前所在行數
set wildmenu                            "讓 help 時更好用 :h pyt<tab>
set expandtab				"用 space 取代 tab
set tabstop=8				"設成tab是8個空白，這樣會比較明顯，該取代成空白
set softtabstop=4			"設成insert mode 按tab會變4個空白
set shiftwidth=4                        "設定indent時是4格空白
set textwidth=120                       "不要 80 chars 就換行
set relativenumber                      "設定行號為相對行號!!! 好用
set laststatus=2                        "給 airline 顯示用
set noshowmode                          "有 airline 就不需要最底下狀態列
set backspace=indent,eol,start          "Make backspace behave like every other editor.
set scrolloff=8                         "這個太棒了，不用每次都捲到最下面看不到後文
set updatetime=50
set timeoutlen=700                      "按下組合鍵不用等太久
set ttimeoutlen=10                      "<C-o> 在 insert mode 不用等太久
set nowrap                              "No wrap
set nu                                  "Line number
set smartindent
set ic                                  "搜尋時 Ignore case"

"-------------- Vim Life Easier ---------
" ref: https://www.youtube.com/watch?v=I0PrxH53Rfc
vnoremap ; :
nnoremap ; :

" 用 up 取代 :w 存檔!! 才不會動到 update timestamp
" 其實 zz 也有這功用，沒改動不會 write
inoremap ZW    <C-o>:up<cr>
nnoremap ZW    :up<cr>
nnoremap WW    :up<cr>
nnoremap WQ    :up<cr>:q!<cr>


"-------------- Search --------------"
set hlsearch
set incsearch

"-------------- Mappings ----------------"
" 快速鍵新增原則: 2021/6/18 熟練之前，
" 先以原 Vim key 為主練習不忘為主，
" 再設新 keybind，除非實在太難按。
let mapleader=' '                       "The default leader
nnoremap <leader>ev  :tabe ~/.vimrc<cr>
nnoremap <leader>eiv :tabe ~/.ideavimrc<cr>
nnoremap <leader>egv :e ~/.gvimrc<cr>
nnoremap <leader>pi  :call SourceAndPluginInstall()<cr>
nnoremap <C-S-l>     :so ~/.vimrc<cr>:echo "~/.vimrc Reloaded"<cr>
imap     <C-S-l>     <C-o><C-S-l>
nnoremap <leader>,   :nohlsearch<cr>

"-------------- Search --------------
nmap z/          /
imap z/          <esc>/
vmap z/          <esc>/
nmap z.          ?
imap z.          <esc>?
vmap z.          <esc>?

"-------------- Editing Shortcuts ------------"
inoremap AA      <esc>A
inoremap II      <esc>I
inoremap zcb     <C-o>cb
nnoremap <BS>    i<BS>
nnoremap <cr>    o<esc>
"<C-a> Increase Number / <C-S-a> Decrease Number
noremap  <C-S-a> <C-x>
inoremap <C-S-a> <esc><C-x>

"-------------- Quit ---------------"
nnoremap QQ    :q!<cr>

"Enter normal mode when type jj or JK in insert mode
inoremap jj    <esc>
inoremap jk    <esc>
inoremap <C-a> <esc>

"Movement hotkeys
nmap     zh      ^
vmap     zh      ^
imap     zh      <esc>^
nmap     zl      $
vmap     zl      $be
imap     zl      <esc>$a
"往返前一個位置``，但不到行首''，是跳到column
nnoremap ''      ``

"Movement 系列，定位 (), {} 的方式，尾字大寫"反向"
nnoremap gbj     /(<cr>
nnoremap gbJ     ?(<cr>
nnoremap gbk     /)<cr>
nnoremap gbK     ?)<cr>
nnoremap gbh     /{<cr>
nnoremap gbH     ?{<cr>
nnoremap gbl     /}<cr>
nnoremap gbL     ?}<cr>

"選取括號內文
nnoremap zvB     ?(<cr>nvib
imap     zvB     <esc>zbB
nnoremap zvb     /)<cr>vib
imap     zvb     <esc>zvb

"向前後定位 (), {} 並進入插入模式
nnoremap zbj     /(<cr>a
imap     zbj     <esc>zbj
nnoremap zbJ     ?(<cr>a
imap     zbJ     <esc>zbJ
nnoremap zbk     /)<cr>i
imap     zbk     <esc>zbk
nnoremap zbK     ?)<cr>i
imap     zbK     <esc>zbK
nnoremap zbh     /{<cr>o
imap     zbh     <esc>zbh
nnoremap zbH     ?{<cr>o
imap     zbH     <esc>zbH
nnoremap zbl     ?}<cr>O
imap     zbl     <esc>zbl
nnoremap zbL     /}<cr>O
imap     zbL     <esc>zbL

"------------- Enter Character -------------------
"在行尾加上分號 put semicolon at the end of line
" g_ 是移到行尾，近似 $
inoremap z;      <esc>g_a;<esc>
nnoremap z;      i<esc>g_a;<esc>
nnoremap z,      g_a,<esc>
inoremap z,      <esc>g_a,

"貼上的快速鍵, 但不是從 deleted 的來的
nnoremap <leader>p   "0p
vnoremap <leader>p   "0p
nnoremap <leader>P   "0P
vnoremap <leader>P   "0P

"------------- Plugins Customized --------------
"Githutter Mappings
nmap <leader>hn  <Plug>(GitGutterNextHunk)
nmap <leader>hp  <Plug>(GitGutterPrevHunk)
nmap <leader>hr  <Plug>(GitGutterPreviewHunk)
nmap <leader>hc  :call gitgutter#hunk#close_hunk_preview_window()<cr>

"EasyMotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
map  <leader>j    <Plug>(easymotion-bd-f)
map  <leader>e    <Plug>(easymotion-bd-e)
map  <leader>/    <Plug>(easymotion-bd-w)

"NERDTree
nnoremap <leader>1    :NERDTreeToggle<cr>

"Fzf
noremap  <C-p>        :Files<cr>
nnoremap <leader>r    :FZFMru<cr>

"Vim-Surround
"把 word 變 "word"
nmap <leader>s"   ysiw"
"把 word 變 'word'
nmap <leader>s'   ysiw'
"把標示處括起來，準備打 function name
vmap (            dmbi(<C-r>")<esc>`b
vmap af           dmbi(<C-r>")<C-o>`b

" EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga  <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga  <Plug>(EasyAlign)


"--------------Split Management ----------------
"set splitbelow   "我比較不喜歡
"set splitleft    "我比較不喜歡

" :vsp, :sp  垂直/水平分割，常用再來設快速鍵
" ^W ^W, ^W ^L, ^W ^K 是預設跳轉用的快捷鍵
" ^W | 最大化  ^W = 平均分配

"------------- Functions --------------"
function! SourceAndPluginInstall()
    :PlugInstall
    :sleep 2
    :q
endfunction

"-------------- Plugins ----------------"
set rtp+=/usr/local/opt/fzf
call plug#begin('~/.vim/plugged')

Plug 'sonph/onehalf', { 'rtp': 'vim' }                    " onehalfdark https://github.com/sonph/onehalf/tree/master/vim
Plug 'joshdick/onedark.vim'                               " onedark https://github.com/joshdick/onedark.vim
Plug 'junegunn/vim-easy-align'                            " viga = gaip
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' } " 取代 Colorizer
Plug 'kana/vim-textobj-user'                              " 是 vim-textobj-entire 的 dependency
Plug 'kana/vim-textobj-entire'                            " text-object, use `vae` to try
Plug 'wellle/targets.vim'                                 " ci/, ci' 時會自動搜尋上下行
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'preservim/nerdcommenter'                            " <leader>c<space>, <leader>ci, <leader>cu
Plug 'vim-airline/vim-airline'                            " 狀態列加強版，和 gitgutter 相性比較好
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'                             " 要搭 airline 它的 hank preview 顏色才會對
Plug 'frazrepo/vim-rainbow'                               " 讓對稱的括號有顏色
Plug 'easymotion/vim-easymotion'                          " <leader><leader>w
Plug 'morhetz/gruvbox'                                    " 感覺真的很厲害的 theme 支援超多 plugin
Plug 'tpope/vim-surround'                                 " ysiw", cs'", ds", yssb 或 yss)
Plug 'junegunn/fzf.vim'                                   " Fuzzy file finder
Plug 'pbogut/fzf-mru.vim'                                 " Fzf MRU (Most Recent Usage files)  :FZFMru

call plug#end()

filetype plugin on

" 要先載入 onehalfdark 才能用
"colorscheme onehalfdark
autocmd vimenter * ++nested colorscheme gruvbox

" Fzf MRU
let g:fzf_mru_no_sort = 1     "沒試過，避免 FZFMru 時被 fzf 給重排序，維持 recent 順序

" Airline Settings
let g:airline_theme='murmur'
if !has("gui_running")
    let g:airline_powerline_fonts = 1
    "let g:airline#extensions#tabline#enabled = 1
    "let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
endif

" Gitgutter Settings
set updatetime=150
set signcolumn=yes
let g:gitgutter_set_sign_backgrounds = 1
let g:gitgutter_map_keys = 0
highlight GitGutterAdd        guifg=#009900 ctermfg=2
highlight GitGutterChange     guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete     guifg=#ff2222 ctermfg=1
highlight GitGutterAddLine    guibg=#009900
highlight GitGutterChangeLine guibg=#bbbb00
highlight GitGutterDeleteLine guibg=#ff2222

" Colorizer 之 Hexokinase 設定
let g:Hexokinase_highlighters = [ 'backgroundfull' ]
set termguicolors
nmap <leader>co  :HexokinaseToggle<cr>

" Vim-rainbow 讓括號成對顯示顏色
" let g:rainbow_active = 1



"-------------- Auto-Commands -------------"
"Automatically source the Vimrc on save
"              trim trailing spaces

if !has("gui_running")
    augroup autosourcing
        autocmd!
        autocmd BufWritePost .vimrc source %
        autocmd BufWritePre * :%s/\s\+$//e
    augroup END
endif

imap <A-.>  i;;;
