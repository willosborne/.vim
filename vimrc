set nocompatible
filetype off

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle/')

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-pathogen'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-sensible'
Plug 'flazz/vim-colorschemes'
" Plug 'rafi/awesome-vim-colorschemes'
Plug 'valloric/youcompleteme'
Plug 'mbbill/undotree'
Plug 'junegunn/goyo.vim'
Plug 'scrooloose/nerdtree'
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'w0rp/ale'
Plug 'ervandew/supertab'
Plug 'tpope/vim-endwise'
Plug 'mattn/emmet-vim'
Plug 'alvan/vim-closetag'
Plug 'sheerun/vim-polyglot'
" Plug 'townk/vim-autoclose'
let g:polyglot_disabled = ['lua', 'haskell']
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'kien/rainbow_parentheses.vim'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-salve'
Plug 'neovimhaskell/haskell-vim'

call plug#end()
"undotree
if has("persistent_undo")
        set undodir=~/.vimundo/
        set undofile
        set undolevels=1000
        set undoreload=10000
endif

"backup 
set backup
set backupdir=~/.vim/tmp,.
set directory=~/.vim/tmp,.

let g:ackprg = 'ag --nogroup --nocolor --column --smart-case'


"###### LEADER SHORTCUTS ########
let mapleader=","

nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
" ,r reloads vimrc
" nnoremap <leader>r :source $MYVIMRC<CR>

nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader><space> :noh<CR>
nnoremap \t :NERDTreeToggle<CR>

nmap <C-e> :b#<CR>
nmap <C-n> :bn<CR>
nmap <C-p> :bp<CR>

nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>
"####### COLOURS ############

set t_Co=256
set t_ut=

set background=dark
" colorscheme gruvbox
colorscheme molokai
" colorscheme badwolf

" syntax enable

"set linespace=0

" let you click to move the cursor
set mouse=a

"set foldenable
set foldlevelstart=20 "open 10 levels of fold at file open

"open/close folds
nnoremap <space> za
set foldmethod=syntax 

"set history=1000

""#############~MOVEMENT~#################
"" nice movement for long lines
nnoremap j gj
nnoremap k gk

""########### Formatting ##################
"set autoindent
"set shiftwidth=4

set tabstop=4 "spaces per tab
set softtabstop=4 "insert 4 spaces, let backspace delete it
set expandtab "tabs to spaces
set shiftwidth=0

set number "line nos
"set cursorline "line under cursor lone number

function! ProseMode()
  call goyo#execute(0, [])
  set spell noci nosi noai nolist noshowmode noshowcmd
  set complete+=s
  set bg=light
  if !has('gui_running')
    let g:solarized_termcolors=256
  endif
  colors solarized
endfunction

command! ProseMode call ProseMode()
nmap \p :ProseMode<CR>

set guioptions-=m
set guioptions-=T
set guioptions-=r

"" ###### CLOJURE #####
nmap <leader>e :Eval<CR>
nmap <leader>E :%Eval<CR>
" autocmd BufRead, BufNewFile *.clj :RainbowParenthesesActivate<CR>
au VimEnter *.clj RainbowParenthesesToggle
au Syntax *.clj RainbowParenthesesLoadRound
au Syntax *.clj RainbowParenthesesLoadSquare
au Syntax *.clj RainbowParenthesesLoadBraces
