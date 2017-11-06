"  vim: ts=8 et sw=4 sts=4 foldlevel=0 foldmethod=marker

" Install plug if it doesn't exists"{{{
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config//nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif
"}}}
" Remap leader key to <space>"{{{
nnoremap <space> <Nop>
let mapleader=' '
let maplocalleader='\'
"}}}

set termguicolors

let g:python_host_prog='/usr/bin/python'
let g:python3_host_prog='/usr/bin/python3'

call plug#begin('~/.config/nvim/plugged')
" Plugins {{{
    Plug 'joshdick/onedark.vim'
    Plug 'icymind/NeoSolarized'
    Plug 'dracula/vim'
    Plug 'mhartington/oceanic-next'

    Plug 'vim-airline/vim-airline'
    Plug 'HarnoRanaivo/vim-neatfoldtext'
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'Yggdroot/indentLine'

    Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'mattn/emmet-vim'
    Plug 'Chiel92/vim-autoformat'

    Plug 'neomake/neomake'

    Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
    Plug 'zchee/deoplete-jedi', {'for': 'python', 'do': 'git submodule update --recursive --init'}
    Plug 'tmhedberg/SimpylFold', {'for': 'python'}
    Plug 'zchee/deoplete-clang'
    Plug 'zchee/deoplete-go', {'do': 'make'}

    Plug 'Shougo/neco-vim'
    Plug 'Shougo/neco-syntax', {'for': 'vim'}

    Plug 'Shougo/neoinclude.vim'

    Plug 'tpope/vim-repeat'
    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'sheerun/vim-polyglot'

    Plug 'Shougo/echodoc.vim'
"}}}
" Plugins Config"{{{
    " airline"{{{
    let g:airline_theme = 'dracula'
    let g:airline#extensions#ctrlp#show_adjacent_modes=0
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#ale#enabled = 1
    let g:airline_mode_map = {
        \ '__' : '-',
        \ 'n'  : 'N',
        \ 'i'  : 'I',
        \ 'R'  : 'R',
        \ 'c'  : 'C',
        \ 'v'  : 'V',
        \ 'V'  : 'V',
        \ '' : 'V',
        \ 's'  : 'S',
        \ 'S'  : 'S',
        \ '' : 'S',
        \ }

    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

    " unicode symbols
    let g:airline_left_sep = ''
    let g:airline_right_sep = ''
    let g:airline_symbols.crypt = '🔒'
    let g:airline_symbols.branch = '⎇'
    "}}}
    " neatfoldtext"{{{
    let NeatFoldTextFancy=1
    "}}}
    " nerdtree"{{{
    let NERDTreeIgnore = ['__pycache__']
    map<c-n> :NERDTreeToggle<cr>
    let NERDTreeQuitOnOpen=1
    "}}}
    " fzf"{{{
    let g:fzf_nvim_statusline = 0
    nnoremap <silent> <leader>f :Files<cr>
    nnoremap <silent> <leader>b :Buffers<cr>
    "}}}
    " neomake"{{{
    autocmd! BufWritePost * Neomake

    function! LocationNext()
        try
            lnext
        catch
            try | lfirst | catch | endtry
        endtry
    endfunction

    nnoremap <leader><Tab> :call LocationNext()<cr>
    "}}}
    " deoplete"{{{
    let g:deoplete#enable_at_startup = 1
    " " use tab and shift-tab
    inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
    inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
    "}}}
    " deoplete-jedi"{{{
    let g:deoplete#sources#jedi#show_docstring = 1
    let g:deoplete#sources#jedi#python_path = 'python3'
    "}}}
    " deoplete-clang"{{{
    let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-4.0/lib/libclang.so.1'
    let g:deoplete#sources#clang#clang_header = '/usr/lib/llvm-4.0'
    let g:deoplete#sources#clang#sort_algo = 'priority'
    "}}}
    " deoplete-go"{{{
    let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
    let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'const']
    "}}}
    " auto-pairs"{{{
    " see issue #116
    let g:AutoPairsMapCR = 0
    imap <silent><CR> <CR><Plug>AutoPairsReturn
    "}}}
    " indentLine"{{{
    let g:indentLine_color_gui = '#343d46'
    let g:indentLine_char = '⋮'
    "}}}
    " colorschemes"{{{
    let g:onedark_terminal_italics = 1
    "}}}
    " echodoc"{{{
    let g:echodoc#enable_at_startup=1
    "}}}
"}}}
call plug#end()

" General"{{{
set background=dark
colorscheme onedark
set lazyredraw
set clipboard+=unnamedplus
set breakindent                 " indent wrapped lines to mach start
set breakindentopt=shift:2      " emphasize broken lines by indenting them
set nowrap                      " don't wrap long lines
set linebreak                   " break long lines at characters in 'breakat'
set cursorline                  " show cursor line
set list                        " show whitespace
set listchars=nbsp:⦸
set listchars=tab:▸-
set listchars+=extends:»
set listchars+=precedes:«
set listchars+=trail:•
set showbreak=…
set scrolloff=3                 " start scrolling 3 lines before edge of viewport
set shiftround                  " always indent by multiple of shiftwidth
set showcmd                     " extra info at end of command line
set splitbelow                  " open horizontal splits below current window
set splitright                  " open vertical splits to the right of the current window
set virtualedit=block           " allow cursor to move where there is no text in visual block mode
set hidden                      " allows you to hide buffers with unsaved changes without being prompted
set spelllang=pt,en
set completeopt+=noinsert
set foldlevel=10
set inccommand=split
set ignorecase                  " case insensitive search
set completeopt-=noinsert       " dont auto select autocompletion
set colorcolumn=80
set fdo+=jump
set noshowmode
set modeline
set foldmethod=syntax
set tabstop=4
set shiftwidth=4
"}}}

" equalize splits on vim resize"{{{
augroup VimResized
    autocmd!
    autocmd VimResized * wincmd =
augroup END
"}}}
" Filetype Terminal"{{{
augroup TerminalEnter
    autocmd!
    autocmd WinEnter term://* :startinsert
    autocmd TermOpen term://* :startinsert
    " autoresize terminal window
    autocmd WinLeave term://* :resize 3
    autocmd WinEnter term://* :resize 15
augroup END
"}}}
" Filetype Vim"{{{
augroup FileTypeVim
    autocmd!
    " Use K to search for help in vim files
    autocmd Filetype vim setlocal keywordprg=:help
    " source config file on write
    autocmd BufWritePost $MYVIMRC nested source $MYVIMRC | doautocmd BufRead | normal! zv
augroup END
" "}}}
" Filetype Help"{{{
augroup FileTypeHelp
    autocmd!
    " Press Enter to jump to the subject (topic) under the cursor.
    " Press Backspace to return from the last jump.
    " Press s to find next subject, or S to find previous subject.
    " Press o to find next option, or O to find previous option.
    autocmd Filetype help nnoremap <buffer> <CR> <C-]>
    autocmd Filetype help nnoremap <buffer> <BS> <C-T>
    autocmd Filetype help nnoremap <buffer> o /'\l\{2,\}'<CR>
    autocmd Filetype help nnoremap <buffer> O ?'\l\{2,\}'<CR>
    autocmd Filetype help nnoremap <buffer> s /\|\zs\S\+\ze\|<CR>
    autocmd Filetype help nnoremap <buffer> S ?\|\zs\S\+\ze\|<CR>
augroup END
"}}}
" Filetype Json"{{{
augroup FileTypeJson
    autocmd!
    " format json files with python -m json.tool (gq command)
    autocmd Filetype json setlocal formatprg=python\ -m\ json.tool
augroup END
"}}}
" Filetype Python "{{{
augroup FileTypePython
    autocmd!
    " au Filetype python setlocal keywordprg=:!python3\ -m\ pydoc
    au Filetype python setlocal ts=8 et sw=4 sts=4
    au FileType python map <buffer> <leader>r :w <bar> :5split <bar> :set wfh <bar> :terminal python3 %<cr>
    au FileType python map <buffer> <leader>d :w <bar> :buf <bar> :terminal python3 -m pudb %<cr>
augroup END
"}}}
" Filetype Go "{{{
augroup FileTypePython
    autocmd!
    au FileType go map <buffer> <leader>r :w <bar> :5split <bar> :set wfh <bar> :terminal go run %<cr>
augroup END
"}}}

" Some alterations to python syntax"{{{
    au Filetype python syn keyword pythonStatement     def nextgroup=pythonFunction skipwhite
    au Filetype python syn keyword pythonStatement     class nextgroup=pythonClassName skipwhite
    au Filetype python syn match   pythonClassName    '\h\w*' display contained

    hi def link pythonClassName Structure
    hi Function gui=italic
    hi Statement gui=bold
    hi Identifier gui=italic
"}}}

" Mappings"{{{
    " < > -- indenting"{{{
    vnoremap <silent> < <gv
    vnoremap <silent> > >gv
    nnoremap <silent> < <<
    nnoremap <silent> > >>
    "}}}
    " <tab> -- folding"{{{
    " In normal mode, press Tab to toggle the current fold open/closed.
    " In addition, with the manual fold method, you can create a fold
    " by visually selecting some lines, then pressing Space.
    nnoremap <silent> <Tab> @=(foldlevel('.')?'za':"\<Tab>")<CR>
    vnoremap <Tab> zf
    "}}}
    " <z-up> <z-down> -- Navigating folds"{{{
    nnoremap z<UP> zk
    nnoremap z<DOWN> zj
    "}}}
    " move in soft wrapped lines"{{{
    map <silent> <Up> gk
    imap <silent> <Up> <C-o>gk
    map <silent> <Down> gj
    imap <silent> <Down> <C-o>gj
    map <silent> <home> g<home>
    imap <silent> <home> <C-o>g<home>
    map <silent> <End> g<End>
    imap <silent> <End> <C-o>g<End>
    "}}}
    " <c-arrows> -- move and between windows"{{{
    nnoremap <C-LEFT> <C-w>h
    nnoremap <C-DOWN> <C-w>j
    nnoremap <C-UP> <C-w>k
    nnoremap <C-RIGHT> <C-w>l
    " terminal windows
    tnoremap <C-LEFT> <C-\><C-n><C-w>h
    tnoremap <C-DOWN> <C-\><C-n><C-w>j
    tnoremap <C-UP> <C-\><C-n><C-w>k
    tnoremap <C-RIGHT> <C-\><C-n><C-w>l

    "}}}
    " <a-arrows> -- resize windows"{{{
    nnoremap <A-LEFT> <C-w><
    nnoremap <A-DOWN> <C-W>-
    nnoremap <A-UP> <C-W>+
    nnoremap <A-RIGHT> <C-w>>
    " terminal window
    tnoremap <A-LEFT> <C-\><C-n><C-w><
    tnoremap <A-DOWN> <C-\><C-n><C-W>-
    tnoremap <A-UP> <C-\><C-n><C-W>+
    tnoremap <A-RIGHT> <C-\><C-n><C-w>>

    "}}}
    " <c-\> exit terminal mode"{{{
    tnoremap <c-\> <C-\><C-n>
    "}}}
    " <leader>tt -- Open a terminal split"{{{
    nnoremap <leader>tt :15split <bar> :set wfh <bar> :terminal<cr>
    "}}}
    " <leader>sp -- show pop-up with corrections"{{{
    nnoremap <leader>sp ea<C-X><C-S>
    "}}}
    " <leader>ev -- edit $MYVIMRC"{{{
    nmap <silent> <leader>ev :execute 'edit' resolve($MYVIMRC) <CR>
    "}}}
    " <c-l> -- clear highlight"{{{
    nnoremap <silent> <c-l> :nohlsearch<c-r>=has('diff')?'<bar>diffupdate':''<cr><cr><c-l>
    "}}}
    " Y -- Make Y act like C or D, yank from cursor to the end of line"{{{
    nnoremap Y y$
    "}}}
    " <leader>c replace all words under cursor"{{{
    " Allows you to easily change the current word and all occurrences
    " to something else.
    nnoremap <leader>c :%s/\<<C-r><C-w>\>/<C-r><C-w>
    vnoremap <leader>c y:%s/<C-r>"/<C-r>"
    "}}}
    " gb, gB -- change buffers as gt for tabs"{{{
    map gb :bn<cr>
    map gB :bp<cr>
    "}}}
    " <Leader><Leader> -- Open last buffer."{{{
    nnoremap <Leader><Leader> <C-^>
    "}}}
    " <Leader>p -- Show the path of the current file"{{{
    nnoremap <Leader>p :echo expand('%')<CR>
    "}}}
    " <c-a> <c-e> -- command mode bash mapping"{{{
    cnoremap <C-a> <Home>
    cnoremap <C-e> <End>
    "}}}
    " Q -- stop messing with me!!!"{{{
    map Q <nop>
    "}}}
"}}}

" Show group highlight under cursor"{{{
    function! SynGroup()
        let l:s = synID(line('.'), col('.'), 1)
        echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
    endfun

    nnoremap <leader>sh :call SynGroup()<CR>
"}}}
