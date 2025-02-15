set go+=!,

let mapleader = "\\"
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

let NERDTreeWinPos=0
let NERDTreeShowHidden=1
" Use the Solarized Dark theme
set background=dark
colorscheme solarized
set colorcolumn=40,50,79,81,129,131,159,161,209,211
highlight ColorColumn ctermbg=0 guibg=lightgrey

let g:solarized_termtrans=1

" Make Vim more useful
set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure

" Enable syntax highlighting
syntax on
" enable all Python syntax highlighting features
let python_highlight_all = 1
" Highlight current line


set cursorline
" Make tabs as wide as two spaces
set tabstop=4
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
" set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t nnoremapshow the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
auto BufEnter * let &titlestring = hostname() . "/" . expand("%:p")

" add useful stuff to title bar (file name, flags, cwd)
" based on @factorylabs
if has('title') && (has('gui_running') || &title)
"  set titlestring=
    set titlestring+=%f
    set titlestring+=%h%m%r%w
    set titlestring+=\ -\ %{v:progname}
    set titlestring+=\ -\ %{substitute(getcwd(),\ $HOME,\ '~',\ '')}
endif


" Show the (partial) command as it’s being typed
set showcmd
" Enable line numbers
set number
" Use hybrid line numbers
 if exists("&relativenumber")
		set number relativenumber
		au BufReadPost * set relativenumber
 endif

" Start scrolling three lines before the horizontal window border
set scrolloff=3

"" Strip trailing whitespace (,ss)
"function! StripWhitespace()
"	let save_cursor = getpos(".")
"	let old_query = getreg('/')
"	:%s/\s\+$//e
"	call setpos('.', save_cursor)
"	call setreg('/', old_query)
"endfunction
"noremap <leader>ss :call StripWhitespace()<CR>

" Save a file as root (,W)
noremap <leader>WW :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif

" --------------------------------------------------------------------------------
" configure editor with tabs and nice stuff...
" --------------------------------------------------------------------------------
" NOTE: effects git message editing
set nocompatible
set expandtab           " enter spaces when tab is pressed
set textwidth=160       " break lines when line length increases
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " copy indent from current line when starting a new line
set smartindent
set smarttab!
set number

let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11"}

if has("autocmd")
    " map to <Leader>cf in C++ code
    " autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
    " autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
    " if you install vim-operator-user
    " autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
endif

" Toggle auto formatting:
" nmap <Leader>C :ClangFormatAutoToggle<CR>

set noexpandtab " default dont mess with tabs!!!
" set expandtab!
set list       " default show stuff!!! "
:inoremap <cr> <space><bs><cr>
:inoremap <cr> <tab><bs><cr>

if has("autocmd")
    " configure expanding of tabs for various file types
    au BufRead,BufNewFile *.py set expandtab
    au BufRead,BufNewFile *.py set list
    au BufRead,BufNewFile *.h set noexpandtab
    au BufRead,BufNewFile *.c set noexpandtab
    au BufRead,BufNewFile *.cpp set noexpandtab
    au BufRead,BufNewFile *.h set list
    au BufRead,BufNewFile *.c set list
    au BufRead,BufNewFile *.cpp set list
endif

" GNUmakefile Makefile *.mk
if has("autocmd")
    autocmd FileType make              set noexpandtab
    autocmd FileType make              set softtabstop=4
    autocmd FileType make              set list

    au BufRead,BufNewFile Makefile     set noexpandtab
    au BufRead,BufNewFile Makefile     set softtabstop=4
    au BufRead,BufNewFile Makefile     set list

    au BufRead,BufNewFile GNUmakefile  set noexpandtab
    au BufRead,BufNewFile GNUmakefile  set softtabstop=4
    au BufRead,BufNewFile GNUmakefile  set list

    au BufRead,BufNewFile GNUmakefile.in  set noexpandtab
    au BufRead,BufNewFile GNUmakefile.in  set softtabstop=4
    au BufRead,BufNewFile GNUmakefile.in  set list

    au BufRead,BufNewFile *.mk         set noexpandtab
    au BufRead,BufNewFile *.mk         set softtabstop=4
    au BufRead,BufNewFile *.mk         set list


    au BufRead,BufNewFile *.sh* set list
    au BufRead,BufNewFile *.vimrc* set list
    au BufRead,BufNewFile *.vimrc* set noexpandtab

    au BufRead,BufNewFile *ockerfile* set noexpandtab list
    au BufRead,BufNewFile *.yml  set noexpandtab softtabstop=2 list
    au BufRead,BufNewFile *.yaml set noexpandtab softtabstop=2 list

    au BufRead,BufNewFile *.md set noexpandtab
    au BufRead,BufNewFile *.md set softtabstop=4
    " au BufRead,BufNewFile *.md set expandtab!
    au BufRead,BufNewFile *.md set list
endif

" make backspaces more powerfull
set backspace=indent,eol,start

set ruler               " show line and column number
syntax on               " syntax highlighting
set showcmd             " show (partial) command in status line


" clang format and code completion support
" path to directory where library can be found
let g:clang_library_path='/Library/Developer/CommandLineTools/usr/lib/'
" or path directly to the library file
" let g:clang_library_path='/usr/lib64/libclang.so.3.8'

"m autocmd FileType c ClangFormatAutoEnable


if has("autocmd")
function! s:expand_commit_template() abort
  let context = {
        \ 'MY_BRANCH': matchstr(system('git rev-parse --abbrev-ref HEAD'), '\p\+'),
        \ 'AUTHOR': 'Tommy A',
        \ }

  let lnum = nextnonblank(1)
  while lnum && lnum < line('$')
    call setline(lnum, substitute(getline(lnum), '\${\(\w\+\)}',
          \ '\=get(context, submatch(1), submatch(0))', 'g'))
    let lnum = nextnonblank(lnum + 1)
  endwhile
endfunction
endif

autocmd BufRead */.git/COMMIT_EDITMSG call s:expand_commit_template()