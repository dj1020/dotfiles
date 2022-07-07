"  ______  __      __  __  __          __
" /\__  _\/\ \  __/\ \/\ \/\ \        /\ \    __
" \/_/\ \/\ \ \/\ \ \ \ \ \/'/'       \_\ \  /\_\
"    \ \ \ \ \ \ \ \ \ \ \ , <        /'_` \ \/\ \
"     \ \ \ \ \ \_/ \_\ \ \ \\`\     /\ \L\ \ \ \ \
"      \ \_\ \ `\___x___/\ \_\ \_\   \ \___,_\_\ \ \
"       \/_/  '\/__//__/  \/_/\/_/    \/__,_ /\ \_\ \
"                                            \ \____/
"                                             \/___/
" GitHub: https://github.com/dj1020/dotfiles

" Basic Settings {{{
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
set scrolloff=5                         "這個太棒了，不用每次都捲到最下面看不到後文
set updatetime=50
set timeoutlen=700                      "按下組合鍵不用等太久
set ttimeoutlen=10                      "<C-o> 在 insert mode 不用等太久
set wrap nolist                         "Soft-wrap 但不讓字斷在中間
set nu                                  "Line number
set smartindent
set ic                                  "搜尋時 Ignore case"

"-------------- Search --------------"
set hlsearch
set incsearch

" }}}

" Vim Life Easier {{{
noremap  zz     zz<C-e><C-e><C-e>

" 用 up 取代 :w 存檔!! 才不會動到 update timestamp
" 其實 zz 也有這功用，沒改動不會 write
inoremap ZW    <C-o>:up<cr>
nnoremap ZW    :up<cr>
nnoremap qq    :up<cr>
nnoremap qw    :up<cr>:q!<cr>

" }}}

" Custom Commands {{{
" 感覺有時候 leader key 沒那麼好用
command Erc    :tabe ~/.vimrc
command Ercp   :tabe ~/.ideavimrc
command Ercg   :tabe ~/.gvimrc
command Ercz   :tabe ~/.zshrc
command Etm    :tabe ~/.tmux.conf
command PI     :call SourceAndPluginInstall()
command PClean :PlugClean
" }}}


"  Key Mappings {{{
" 快速鍵新增原則: 2021/6/18 熟練之前，
" 先以原 Vim key 為主練習不忘為主，
" 再設新 keybind，除非實在太難按。
let mapleader=' '                       "The default leader
noremap <leader>,      :nohlsearch<cr>
noremap <leader>ral    :so $MYVIMRC<cr>:echo "~/.vimrc Reloaded"<cr>
noremap <leader>tm     :tabe ~/.tmux.conf<cr>

"-------------- Search --------------
noremap z/          /
imap    z/          <esc>/
noremap z'          ?
imap    z'          <esc>z'
nmap    S           <Plug>Sneak_S
nmap    zF          <Plug>Sneak_S
imap    zF          <esc>zF
nmap    s           <Plug>Sneak_s
nmap    zf          <Plug>Sneak_s
imap    zf          <esc>zf

"-------------- Editing Shortcuts ------------"
nnoremap <BS>    i<BS>
nnoremap <cr>    <C-o>o
nnoremap <S-cr>  i<cr><esc>
"<C-a> Increase Number / <C-S-a> Decrease Number
imap     <C-a>   <esc><C-a>
noremap  <C-S-a> <C-x>
inoremap <C-S-a> <esc><C-x>

"-------------- Quit ---------------"
nnoremap QQ      :q!<cr>

"Enter normal mode when type jk in insert mode
inoremap jk      <esc>

"Movement hotkeys
noremap  zh      ^
imap     zh      <esc>^i
noremap  zl      g_
imap     zl      <esc>g_a
"往返前一個位置``，但不到行首''，是跳到column
nnoremap ''      ``

"選取括號內文
nnoremap zvB     ?(<cr>nvib
imap     zvB     <esc>zbB
nnoremap zvb     /)<cr>vib
imap     zvb     <esc>zvb

"清除括號內文
inoremap zcb     <C-o>cib
inoremap zbb     <C-o>caw

" ci' 往前版，不時會用上
noremap  zcc     ?'<cr>ci'
imap     zcc     <esc>zcc

"------------- Enter Character -------------------
"在行尾加上分號 put semicolon at the end of line
" g_ 是移到行尾，近似 $
nnoremap z;      i<esc>g_a;<esc>
imap     z;      <esc>g_a;<esc>
nnoremap z,      g_a,<esc>
imap     z,      <esc>g_a,

"------------- Clipboard 剪貼相關 ----------------
"貼上的快速鍵, 但不是從 deleted 的來的
noremap <leader>p   "0p
noremap <leader>P   "0P
"複製到 System Clipboard
noremap <leader>yy  ^"*yg_
noremap <leader>Y   ^"*yy
noremap <leader>y   ^"*y
noremap <leader>yl  "*yg_
noremap <leader>yh  v^"*y

" Tabs 操作
noremap <leader>l  gt
noremap <C-l>      gt
noremap <leader>h  gT
noremap <C-h>      gT

" }}}

"  Plugins Customized {{{
"Gitgutter Mappings
nmap <leader>,n  <Plug>(GitGutterNextHunk)
nmap <leader>,p  <Plug>(GitGutterPrevHunk)
nmap <leader>,r  <Plug>(GitGutterPreviewHunk)
nmap <leader>,c  :call gitgutter#hunk#close_hunk_preview_window()<cr>

"EasyMotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
map  <leader>e    <Plug>(easymotion-bd-E)
"map  <leader>/    <Plug>(easymotion-bd-w)

"Sneak
let g:sneak#label = 1

"Movement by easymotion，天啊! 忘了不能下 nore 不然整個在 PhpStorm 都失效
map  ze         <Plug>(easymotion-bd-e)
map  <leader><leader>  <Plug>(easymotion-bd-f)
map  zg         <Plug>(easymotion-bd-jk)
imap zg         <esc>zg
map  zx         <Plug>(easymotion-bd-w)
imap zx         <esc>zx

"NERDTree
if !has("gui_running")
    nnoremap <leader>1    :NERDTreeToggle<cr>
endif

"Fzf
noremap  <C-p>        :Files<cr>
nnoremap <leader>ru   :FZFMru<cr>

"Vim-Surround
"把 word 變 "word"
nmap <leader>s"   ysiw"
"把 word 變 'word'
nmap <leader>s'   ysiw'
"把標示處括起來，準備打 function name
vmap ((           dmbi(<C-r>")<esc>`b
vmap af           dmbi(<C-r>")<C-o>`b

" EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga  <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga  <Plug>(EasyAlign)

" }}}

" Plugins Installed by `vim-plug` {{{
set rtp+=/usr/local/opt/fzf
call plug#begin('~/.vim/plugged')

Plug 'sonph/onehalf', { 'rtp': 'vim' }                    " onehalfdark https://github.com/sonph/onehalf/tree/master/vim
Plug 'joshdick/onedark.vim'                               " onedark https://github.com/joshdick/onedark.vim
Plug 'junegunn/vim-easy-align'                            " viga = gaip
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' } " 取代 Colorizer
Plug 'kana/vim-textobj-user'                              " 是 vim-textobj-entire 的 dependency
Plug 'kana/vim-textobj-entire'                            " text-object, use `vae` to try
Plug 'kana/vim-textobj-line'                              " cil, vil, cal, val Line 的 text object
" Plug 'kana/vim-textobj-indent'                            " ii 選整個 indent 的 text object
Plug 'michaeljsmith/vim-indent-object'                    " 同 'kana/vim-textobj-indent', 但可以用在 ideaVim
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
Plug 'vim-scripts/argtextobj.vim'                         " daa, cia, to operate argument in functions
Plug 'machakann/vim-highlightedyank'                      " 再 y 的時候會高亮 yank 了什麼地方
Plug 'farmergreg/vim-lastplace'                           " 每次開檔案回到最後編輯位置, 還是裝外掛比較快
Plug 'justinmk/vim-sneak'                                 " 按 s/S + 2 chars 就直接到位，';', ',' 來上下一個
Plug 'numToStr/Comment.nvim'                              " gc2j, gcii, gc 來 comment lines 方便, 預設改 cm
Plug 'vim-scripts/ReplaceWithRegister'                    " gr (go replacing), yiw 再 griw 可以直接貼上取代

call plug#end()

" Plugin 'numToStr/Comment.nvim' from https://github.com/numToStr/Comment.nvim
" 但 MacVim 會報錯qq 好像不能用 lua
if !has("gui_running")
lua << EOF
require('Comment').setup({
    toggler = {
        line = 'cmm',
        block = 'cmb',
    },
    opleader = {
        line = 'cm',
        block = 'cb',
    }
})
EOF
endif

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

filetype plugin on

" 要先載入 onehalfdark 才能用
" colorscheme onehalfdark
" let g:rainbow_active = 1

" }}}

" Etc. AutoCommand, Split, Functions  {{{
"-------------- Auto-Commands -------------"
"Automatically source the Vimrc on save
"              trim trailing spaces
"
augroup autosourcing
    autocmd!
    autocmd BufWritePre * :%s/\s\+$//e
    autocmd BufWritePost .vimrc source %
augroup END
" 如果目前檔案是 .vimrc 就移到最後編輯位置，如果有 fold 就 zo 打開
" 這樣存檔後才不會自動關起來, 即使加了 vim-lastplace 這段還是有用！
if ".vimrc" == expand('%:t')
    if &foldenable && foldlevel(line(".")) > 0
        normal! zozz
    endif
endif


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

" }}}

" 自動折疊, 用 :set foldmarker 看 marker 是什麼
" vim:foldmethod=marker:foldlevel=0

