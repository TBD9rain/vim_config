" Vim with all enhancements
source $VIMRUNTIME/vimrc_example.vim

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

" =========================
" TBD9rain defined settings
" =========================

" BASIC SETTING
" not compatible with Vi
set nocompatible
" highlight syntax word
syntax on
" activate operations with mouse
set mouse=a
" display mode
set showmode
" display command
set showcmd
" auto new line after text is too long
set textwidth=100


" INDENT SETTING
" keep indent after Enter
set autoindent
" tab width in insert mode
set tabstop=4
" tab width in normal mode
set shiftwidth=4
" replace tab with space
set expandtab
" the number of space tab was transformed from tab
set softtabstop=4


" DISPLAY SETTING
" display line number
set number
" display relative line number
set relativenumber
" highlight cursor
set cursorline
" line
set lines=30
" column
set columns=90
" divide long line into adaptive lines
set wrap
" divide line after break symbols
set linebreak
" space number between right edge of window and divided line
set wrapmargin=2
" always display status bar
set laststatus=2
" status bar string format
set statusline=%<%f%M%R%=%y\ %p%%\ %l/%L\ %c
" display current cursor position, redundent when tabline is displaying
set ruler
" always display tabline
set showtabline=2
" tab page maximum
set tabpagemax=20
" color scheme
colorscheme desert


" FONT SETTING
" font:height:other options
set encoding=utf-8
" set guifont=DejaVuSansM_Nerd_Font_Mono:h14:cANSI:qDEFAULT
" set guifont=JetBrainsMonoNL_NFM:h14:cANSI:qDEFAULT
set guifont=MesloLGS_Nerd_Font_Mono:h14:cANSI:qDEFAULT


" SEARCH SETTING
" match brakets
set showmatch
" highlight search results
set hlsearch
" increasing search results highlighting
set incsearch


" CONTENT FOLD SETTING
" creates folds according to indent
" set foldmethod=indent


" FILE TYPE
" verilog files
autocmd BufNewFile,BufRead *.v set filetype=verilog
" systemverilog files
autocmd BufNewFile,BufRead *.sv set filetype=systemverilog
" c files
autocmd BufNewFile,BufRead *.c set filetype=c
" modelsim do files
autocmd BufNewFile,BufRead *.do set filetype=tcl
" git ignore files
autocmd BufNewFile,BufRead .gitignore set filetype=gitignore


" LOAD TEMPLATE
" set template relative path
let g:template_path = expand('<sfile>:p:h') . '/vimfiles/template/'
" verilog code template
autocmd BufNewFile *{_tb}\@<!.v execute '0r ' . g:template_path . 'source.v'
" verilog testbench template
autocmd BufNewFile *_tb.v execute '0r ' . g:template_path . 'testbench.v'
" modelsim do file template
autocmd BufNewFile *.do execute '0r ' . g:template_path . 'modelsim.do'
" systemverilog code template
autocmd BufNewFile *{_tb}\@<!.sv execute '0r ' . g:template_path . 'source.sv'
" systemverilog testbench template
autocmd BufNewFile *_tb.sv execute '0r ' . g:template_path . 'testbench.sv'
" c code template
autocmd BufNewFile *.c execute '0r ' . g:template_path . 'source.c'
" git ignore template
autocmd BufNewFile .gitignore execute '0r ' . g:template_path . 'template.gitignore'


" BUFFER SETTING
" allow buffer file changing without saving
set hidden
" kep-mapping delete current buffer file and change to previous buffer file
nnoremap <Leader>bd :bp<bar>bd#<CR>


" LOAD PLUGIN
" load plugins when vim is opened with files not too big
let g:file_size_thold = 2 * 1024 * 1024
function! ShouldLoadPlugins() abort
    let l:file_size = getfsize(expand('%:p'))
    return l:file_size < g:file_size_thold || l:file_size == -1
endfunction
if ShouldLoadPlugins()
    " vim-plug
    " set plugin directory path
    let g:vim_plug_path = expand('<sfile>:p:h') . '/vimfiles/plugged'
    " load plugins
    call plug#begin(g:vim_plug_path)

        Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

        Plug 'preservim/nerdtree'

        Plug 'vim-airline/vim-airline'

        Plug 'ryanoasis/vim-devicons'

    call plug#end()


    " NERDTree
    " open NERDTree with vim starting
    autocmd VimEnter * NERDTree | wincmd p
    " execute 'q' if NERDTree is the only window remaining in current tab.
    autocmd BufEnter * if winnr('$') == 1 && &filetype == 'nerdtree' | call timer_start(1, { tid -> execute('q') }) | endif
    " open the existing NERDTree on each new tab.
    autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif
    " change display icons
    let g:NERDTreeDirArrowExpandable = '󰡏'
    let g:NERDTreeDirArrowCollapsible = '󰡍'


    " vim-airline
    " display buffer number
    let g:airline_section_b = 'BufFile %n'
    " display buffer number
    let g:airline_section_z = '%p%% %l/%L %c'
    " display names of different files in buffer
    let g:airline#extensions#tabline#enabled = 1
    " enable powerline fonts dislpay
    let g:airline_powerline_fonts = 1
    " change display icons
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
    let g:airline_symbols.readonly = '󱀰'
    let g:airline_symbols.whitespace = ''


    " Vim-DevIcons
    " change the default character when no match found
    let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = '󰈔'
    " add or override individual additional filetypes
    let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
    let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['v'] = '󰻟'
    let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['sv'] = '󰻠'
    let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['m'] = '󰯃'
    let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['tcl'] = '󰯃'
    let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['do'] = '󰯃'
    let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['gitignore'] = ''
    let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['md'] = '󰍔'
    let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['txt'] = ''
    let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['log'] = ''
    let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['bin'] = ''
    let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['bit'] = ''
    let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['doc'] = '󱎒'
    let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['docx'] = '󱎒'
    let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['xls'] = '󱎏'
    let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['xlsx'] = '󱎏'
    let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['ppt'] = '󱎐'
    let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['pptx'] = '󱎐'
    let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['zip'] = ''
    let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['7c'] = ''
    let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['tar'] = ''
    let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['dll'] = ''
    let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['exe'] = ''
endif


