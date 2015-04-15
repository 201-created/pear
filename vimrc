set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.pear/vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
call vundle#begin('~/.pear/vim/bundle')

" Install vundle packages
Plugin 'gmarik/Vundle.vim' " Required by Vundle, must be first
Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'alunny/pegjs-vim'
Plugin 'ervandew/supertab'
Plugin 'bling/vim-airline'
Plugin 'kchmck/vim-coffee-script'
" Plugin 'aniero/vim-copy-as-rtf' " FIXME: is no longer available
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

" close quickfix window
noremap <leader>C :ccl<CR>

" cntr-p
noremap <leader>t :CtrlP<CR>
" ctrl-p ignore some files
" Not sure if both of these are necessary
let g:ctrlp_custom_ignore= {
  \ 'dir': 'node_modules'
  \ }

set wildignore+=*/tmp/*,node_modules/*

" vertical bar
set cc=80

" 2-space indentation for coffeescript, taken from the coffeescript
" syntax README file
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

" 2-space indentation and filetype for for less
au BufNewFile,BufReadPost *.less setl shiftwidth=2 filetype=css expandtab

" go syntax highlighting
au BufRead,BufNewFile *.go set filetype=go

" Clear the search buffer when hitting return
:nnoremap <CR> :nohlsearch<cr>

colorscheme Tomorrow-Night

" use ag instead of ack https://github.com/ggreer/the_silver_searcher
" let g:ackprg = 'ag --nogroup --nocolor --column'

" text block matching for ruby requires this
" https://github.com/nelstrom/vim-textobj-rubyblock
runtime macros/matchit.vim

let g:rspec_command = "!bundle exec rspec {spec}"

set guifont=Inconsolata\ 16
set modelines=1
