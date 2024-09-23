" =========================
" TBD9rain defined settings
" =========================

" DISPLAY LANGUAGE
set langmenu=en_US
language messages en_US


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
" enable switching buffer files without saving
set hidden
" auto new line after text is too long
set textwidth=120
" set backspace functions
set backspace=indent,eol,start
" undo file
if has("persistent_undo")
    set undofile
endif
" command completion
set wildmenu
set wildmode=list:full
" jump to the last edition
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif


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
set lines=40
" column
set columns=120
" divide long line into adaptive lines
set wrap
" divide line after word boundary
set linebreak
" space number between right edge of window and divided line
set wrapmargin=2
" always display status bar
set laststatus=2
" status bar string format
set statusline=%<%f%M%R%=%y\ %p%%\ %l/%L\ %c
" display current cursor position, redundant when tabline is displaying
set ruler
" always display tabline
set showtabline=2
" tab page maximum
set tabpagemax=20
" built-in color scheme
colorscheme desert

" FONT SETTING
" font:height:other options
set encoding=utf-8
" set guifont=DejaVuSansM_Nerd_Font_Mono:h14:cANSI:qDEFAULT
" set guifont=JetBrainsMonoNL_NFM:h14:cANSI:qDEFAULT
set guifont=MesloLGS_Nerd_Font_Mono:h14:cANSI:qDEFAULT


" SEARCH SETTING
" match brackets
set showmatch
" highlight search results
set hlsearch
" increasing search results highlighting
set incsearch


" CONTENT FOLD SETTING
" creates folds according to indent
" set foldmethod=indent


" KEY-MAPPING
" set leader key
let g:mapleader = ' '
" delete current buffer file and change to previous buffer file
nnoremap <Leader>bd :bp<bar>bd#<CR>


" vim_files PATH
let g:my_vimfiles_path = '~/vim_files'


" SPELLING CHECK
set spell
set spelllang=en_us
execute 'set spellfile=' . g:my_vimfiles_path . '/spell/en.utf-8.add'


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


" TEMPLATES
execute 'source ' . g:my_vimfiles_path . '/template/config.vim'


" FORMATTING FUNCTIONS
" right align the first specific character of each line at tabstop
function! RAlignLastChar(char) range
    " find the rightest character
    let l:longest_line = a:firstline
    let l:max_col = 0
    for l:line_idx in range(a:firstline, a:lastline)
        let l:line = getline(l:line_idx)
        let l:col = stridx(l:line, a:char)
        if l:col > l:max_col
            let l:longest_line = l:line_idx
            let l:max_col = l:col
        endif
    endfor

    " add space to make the rightest character at tabstop
    let l:line = getline(l:longest_line)
    let l:new_line = l:line[:l:max_col - 1] . repeat(' ', (4 - l:max_col % 4)) . l:line[l:max_col:]
    call setline(l:longest_line, l:new_line)
    let l:max_col = stridx(l:new_line, a:char)

    " align other lines
    for l:line_idx in range(a:firstline, a:lastline)
        let l:line = getline(l:line_idx)
        let l:col = stridx(l:line, a:char)
        if l:col != -1 && l:col < l:max_col
            let l:new_line = l:line[:l:col - 1] . repeat(' ', l:max_col - l:col) . l:line[l:col:]
            call setline(l:line_idx, l:new_line)
        endif
    endfor
endfunction


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
    let g:vim_plug_path = '~/vimfiles/plugged'
    " load plugins
    call plug#begin(g:vim_plug_path)

        Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

        Plug 'preservim/nerdtree'

        Plug 'vim-airline/vim-airline'

        Plug 'ryanoasis/vim-devicons'

        Plug 'neoclide/coc.nvim', {'branch': 'release'}

        Plug 'SirVer/ultisnips'

        Plug 'morhetz/gruvbox'

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
    " enable powerline fonts display
    let g:airline_powerline_fonts = 1
    " change display icons
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
    let g:airline_symbols.readonly = '󱀰'
    let g:airline_symbols.whitespace = ''


    " Vim-DevIcons
    execute 'source ' . g:my_vimfiles_path . '/dev_icons/icon_config.vim'


    " coc.nvim
    set updatetime=300
    set signcolumn=yes
    " trigger completion manually
    inoremap <silent><expr> <C-Space> coc#refresh()
    " navigate items
    inoremap <silent><expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
    inoremap <silent><expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : ""
    " accept selected completion item or notify coc.nvim to format
    " <C-g>u breaks current undo, starts a new undo
    inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() :
        \ "\<C-g>u\<CR>\<C-r>=coc#on_enter()\<CR>"
    " set path of coc-settings.json
    let g:coc_config_home = expand('<sfile>:p:h')
    " set json comment prefix
    autocmd FileType json syntax match Comment +\/\/.\+$+
    " error navigation
    nnoremap <silent> [g <Plug>(coc-diagnostic-prev)
    nnoremap <silent> ]g <Plug>(coc-diagnostic-next)
    " code navigation
    nnoremap <silent> gd <Plug>(coc-definition)
    nnoremap <silent> gy <Plug>(coc-type-definition)
    nnoremap <silent> gi <Plug>(coc-implementation)
    nnoremap <silent> gr <Plug>(coc-references)
    " format selected code
    xmap <Leader>f <Plug>(coc-format-selected)


    " automatic installation for coc extensions
    let g:coc_global_extensions = ['coc-json', 'coc-vimlsp', 'coc-pyright']


    " verible
    " generate verible.filelist
    function! GetGitPath()
        let l:git_path_pre = ''
        let l:git_path_cur = fnamemodify(expand('%:p'), ':h')

        while 1
            if isdirectory(l:git_path_cur . '/.git')
                break
            elseif l:git_path_cur == l:git_path_pre
                let l:git_path_cur = '.'
                break
            else
                let l:git_path_pre = l:git_path_cur
                let l:git_path_cur = fnamemodify(l:git_path_cur, ':h')
            endif
        endwhile

        return l:git_path_cur
    endfunction
    function! AddVeribleFilelist()
        call extend(g:verible_filelist, globpath(expand('%:p:h'), '**/*.v', 0, 1))
        call extend(g:verible_filelist, globpath(expand('%:p:h'), '**/*.sv', 0, 1))

        call sort(g:verible_filelist)
        call uniq(g:verible_filelist)

        call DeleteVeribleFilelist()
        call writefile(g:verible_filelist, GetGitPath() . '/verible.filelist', 'a')
    endfunction
    function! DeleteVeribleFilelist()
        let l:filelist_path = GetGitPath()
        if filereadable(l:filelist_path . '/verible.filelist')
            call delete(l:filelist_path . '/verible.filelist')
        endif
    endfunction
    let g:verible_filelist = []
    autocmd BufRead,BufNewFile *.v,*.sv call AddVeribleFilelist()
    " autocmd VimLeave * call DeleteVeribleFilelist()


    " ultisnips
    " settings
    let g:UltiSnipsEnableSnipMate = 0
    let g:UltiSnipsEditSplit = 'vertical'
    let g:UltiSnipsSnippetDirectories = [g:my_vimfiles_path.'/ultisnips']
    " trigger key-mapping
    let g:UltiSnipsJumpOrExpandTrigger = '<C-Tab>'
    let g:UltiSnipsListSnippets = '<C-S-Tab>'
    let g:UltiSnipsJumpForwardTrigger = '<C-]>'
    let g:UltiSnipsJumpBackwardTrigger = '<C-[>'


    " gruvbox color scheme
    set background=dark
    let g:gruvbox_contrast_dark = 'hard'
    colorscheme gruvbox
endif

