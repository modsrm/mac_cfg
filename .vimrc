set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Bundle 'christoomey/vim-tmux-navigator'

Plugin 'gmarik/Vundle.vim'

Plugin 'bling/vim-airline'

Plugin 'tpope/vim-fugitive'

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

set number
syntax on
filetype on
filetype indent on
set list listchars=nbsp:¬,trail:·,extends:»,precedes:«,tab:>-,eol:¶
set tabstop=4
set expandtab
set shiftwidth=4
highlight NonText ctermfg=0
autocmd BufWritePre * :%s/\s\+$//e
set hidden
set t_Co=256
filetype plugin on
nnoremap <silent> <F5> :TlistToggle<CR>
colorscheme vibrantink
nnoremap <F3> :Rgrep --exclude=tags --exclude=.git/** --exclude=*.so --exclude=*.o --exclude=*.swp --exclude=cscope.*  <CR>

nnoremap <silent> <F2> :NERDTree<CR>
nnoremap = <C-W>+
nnoremap - <C-W>-
nnoremap < <C-W><
nnoremap > <C-W>>
set hlsearch
hi Search cterm=NONE ctermfg=grey ctermbg=red
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_match_window = 'results:100'
let g:ctrlp_custom_ignore = {
            \ 'file': '\v\.(so|swp|o)$'
            \}
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
let g:EclimCompletionMethod = 'omnifunc'
set wildignore+=**/\.git/**

"vim-tmux navigation.
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>

" For some reason vim is not interpreting correctly the backspace keystroke ^?
" coming from xterm. The following stops vim from asking for the xterm version
" string, which prevents the issue from happening.
set t_RV=

" Enable airline.
set laststatus=2
let g:airline_powerline_fonts=1

" Ctrl \: open in new tab.
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" Alt ]: open in vertical split.
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
