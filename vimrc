let g:airline_powerline_fonts = 0
let g:airline_left_sep=''
let g:airline_right_sep=''

set encoding=utf-8

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set runtimepath+=~/.pear/vim/bundle/Vundle.vim
call vundle#begin('~/.pear/vim/bundle')

" add snippets to the runtimepath for UltiSnips (plugin added below)
set runtimepath+=~/.pear/vim-snippets

" Install vundle packages
Plugin 'gmarik/Vundle.vim' " Required by Vundle, must be first
Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'alunny/pegjs-vim'
Plugin 'ervandew/supertab'
Plugin 'bling/vim-airline'
Plugin 'kchmck/vim-coffee-script'
Plugin 'zerowidth/vim-copy-as-rtf'
Plugin 'heartsentwined/vim-emblem'
Plugin 'tpope/vim-haml'
Plugin 'nono/vim-handlebars'
Plugin 'digitaltoad/vim-jade'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-liquid'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'slim-template/vim-slim'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'mattn/emmet-vim'
" Completes blocks like `do ... end` in ruby
Plugin 'tpope/vim-endwise'
" Use leader-cc to comment out visual selected blocks
Plugin 'scrooloose/nerdcommenter'
" Use Ctrl-n to select/edit the same word multiple times
Plugin 'terryma/vim-multiple-cursors'
" expand snippets, docs here: https://github.com/SirVer/ultisnips/blob/master/doc/UltiSnips.txt
" Snippets are in .pear/vim-snippets/UltiSnips/:filetype/some-name.snippets
" The only current snippets are ember-specific JavaScript snippets
Plugin 'SirVer/ultisnips'
" see https://github.com/easymotion/vim-easymotion
Plugin 'easymotion/vim-easymotion'
Plugin 'leafgarland/typescript-vim'
" see https://github.com/christoomey/vim-tmux-navigator
Plugin 'christoomey/vim-tmux-navigator'

" Hit <tab> to expand a snippet, and ctrl-j and -k to move forward and
" backward between the tab stops in the snippet
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" center the cursor in the screen vertically
set scrolloff=10000

let mapleader = ";"

" Mitch setting
nmap , ;

inoremap <leader>j <Esc>
vnoremap <leader>j <Esc>
inoremap <leader>w <Esc>:w<CR>
vnoremap <leader>w <Esc>:w<CR>

noremap <leader>q :q<CR>
noremap <leader>w :w<CR>

noremap <C-h> <C-W>h
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-l> <C-W>l

" prev buffer
noremap <leader>s :b#<CR>

" ctrl-p
noremap <leader>t :CtrlP<CR>

" Open buffers
noremap <leader>b :CtrlPBuffer<CR>

" leader-f opens Ag searching
let g:ag_prg="ag --vimgrep --ignore ^bower_components --ignore ^node_modules --ignore ^tmp --ignore ^dist"
noremap <leader>f :Ag 

" mappings for fugitive
" leader-gs opens git status
noremap <leader>gs :Gstatus<CR>
" leader-gc opens git commit
noremap <leader>gc :Gcommit<CR>
" leader-gb opens git blame
noremap <leader>gb :Gblame<CR>

" leader-d toggles NERDTree drawer
noremap <leader>d :NERDTreeToggle<CR>

" redraw the screen
noremap <leader>r :redraw!<CR>

" vertical bar
set cc=80

" Taken from unimpaired paste plugin
" Type "yo" or "yO" to switch to insert mode with "paste" set on the line below/above
" Exiting insert mode exits paste mode
" See https://github.com/tpope/vim-unimpaired/blob/master/plugin/unimpaired.vim#L239-L260
function! s:setup_paste() abort
  let s:paste = &paste
  let s:mouse = &mouse
  set paste
  set mouse=
  augroup unimpaired_paste
    autocmd!
    autocmd InsertLeave *
          \ if exists('s:paste') |
          \   let &paste = s:paste |
          \   let &mouse = s:mouse |
          \   unlet s:paste |
          \   unlet s:mouse |
          \ endif |
          \ autocmd! unimpaired_paste
  augroup END
endfunction

nnoremap <silent> <Plug>unimpairedPaste :call <SID>setup_paste()<CR>
nnoremap <silent> yo  :call <SID>setup_paste()<CR>o
nnoremap <silent> yO  :call <SID>setup_paste()<CR>O

" 2-space indentation and filetype for for less
au BufNewFile,BufReadPost *.less setl shiftwidth=2 filetype=css expandtab

" go syntax highlighting
au BufRead,BufNewFile *.go set filetype=go

" Highlight matched search teams
:set hlsearch
" Clear highlighted search terms by hitting return
:nnoremap <CR> :nohlsearch<cr>

" Better case searching
" http://linuxcommando.blogspot.com/2008/06/smart-case-insensitive-incremental.html
set ignorecase
set smartcase
set incsearch

colorscheme Tomorrow-Night
highlight  CursorLine cterm=None ctermbg=236
autocmd InsertEnter * highlight  CursorLine cterm=None ctermbg=234
autocmd InsertLeave * highlight  CursorLine cterm=None ctermbg=236

" use ag instead of ack https://github.com/ggreer/the_silver_searcher
" let g:ackprg = 'ag --nogroup --nocolor --column'

" text block matching for ruby requires this
" https://github.com/nelstrom/vim-textobj-rubyblock
runtime macros/matchit.vim

let g:rspec_command = "!bundle exec rspec {spec}"

set guifont=Inconsolata\ 16
set modelines=1

set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab
set ruler
set number
set backspace=2
set vb t_vb=
set guioptions-=T

set undofile

syn on
syntax enable
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

au BufNewFile,BufRead *.es6 set filetype=javascript

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

set wildmode=longest,list,full
set wildmenu

au WinLeave * set nocursorline nocursorcolumn
set cursorline

set laststatus=2

set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip     " Linux/MacOSX"

" Save your backups to a less annoying place than the current directory.
" If you have .vim-backup in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/backup or . if all else fails.
if isdirectory($HOME . '/.vim/backup') == 0
  :silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup

" Save your swp files to a less annoying place than the current directory.
" If you have .vim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
  :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif

" speed up ctr-p file matcher by using `ag` if it is around
" see http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
let g:ctrlp_use_caching = 0
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor

    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
    \ }
endif

" Adds a dummy sign that ensures that the sign column is always shown and
" won't flicker on/off when syntastic finds errors
" see http://superuser.com/questions/558876/how-can-i-make-the-sign-column-show-up-all-the-time-even-if-no-signs-have-been-a
autocmd BufEnter * sign define dummy
autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')

let g:airline#extensions#branch#enabled = 0

" Enable mouse, option-click for normal clicks
set mouse=a
