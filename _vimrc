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
" divide line after break sumbols
set linebreak
" space number between right edge of window and divided line
set wrapmargin=2
" always display status bar
set laststatus=2
" status bar string format
set statusline=row=%04l/%04L,col=%04c\ %<%f
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
" verilog testbench template
autocmd BufNewFile *_tb.v execute '0r ' . g:template_path . 'verilog_testbench_template.v'
" verilog code template
autocmd BufNewFile *{_tb}\@<!.v execute '0r ' . g:template_path . 'verilog_source_template.v'
" systemverilog testbench template
autocmd BufNewFile *_tb.sv execute '0r ' . g:template_path . 'systemverilog_testbench_template.sv'
" systemverilog code template
autocmd BufNewFile *{_tb}\@<!.sv execute '0r ' . g:template_path . 'systemverilog_source_template.sv'
" modelsim do file template
autocmd BufNewFile *.do execute '0r ' . g:template_path . 'modelsimDo.do'
" c code template
autocmd BufNewFile *.c execute '0r ' . g:template_path . 'code.c'
" git ignore template
autocmd BufNewFile .gitignore execute '0r ' . g:template_path . 'template.gitignore'


" vim-plug
" set plugin directory path
let g:vim_plug_path = expand('<sfile>:p:h') . '/vimfiles/plugged'
" load plugins
call plug#begin(g:vim_plug_path)

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

Plug 'preservim/nerdtree'

Plug 'vim-airline/vim-airline'

call plug#end()


" NERDTree
" open NERDTree with vim starting
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
" close NERDTree after all files closed
autocmd BufEnter * if (winnr('$') == 1 && exists('t:NERDTreeBufName') && bufname('%') == t:NERDTreeBufName) | q | endif


" vim-airline
function! WordCount()
    let words = len(split(join(getline(1, '$')), '\W\+'))
    return words . ' words'
endfunction
" display buffer number
let g:airline_section_b = 'BN %n, %{WordCount()}'
" display buffer number
let g:airline_section_z = '%p%% l:%l/%L c:%c'
" display names of different files in buffer
let g:airline#extensions#tabline#enabled = 1

