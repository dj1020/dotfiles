
" 這個檔會比 ~/.vimrc 先載入，所以注意設定的 override 

let g:airline_powerline_fonts = 0
if has("gui_running")
    highlight foldcolumn guibg=bg
    highlight LIneNr guibg=bg

    "Disable print key for Macvim
    macmenu &File.Print key=<nop>
    set macligatures
    set bg=dark

    "-------------- GUI Settings ------------"
    set guifont=DejaVu_Sans_Mono_for_Powerline:h20
    "set guifont=Source_Code_Pro_for_Powerline:h18
    "set guifont=Meslo_LG_M_for_Powerline:h18

    set linespace=15                    "Macvim specific line-height
    set guioptions-=e  			"拿掉上面的 Tab bar
    set guioptions-=l  			"拿掉左側 scroll bar
    set guioptions-=L  			"分割畫面時拿掉左側 scroll bar
    set guioptions-=r  			"拿掉右側 scroll bar
    set guioptions-=R  			"分割畫面時拿掉右側 scroll bar

    set nocursorline
    set showcmd

    augroup autosourcing
        autocmd!
        autocmd BufWritePost .gvimrc source %
        autocmd BufWritePost .vimrc source % | source ~/.gvimrc
    augroup END

endif
