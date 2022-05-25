"VUNDLE STUFF"
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"MY PLUGINS"
"Autocomplete
Plugin 'neoclide/coc.nvim'
"directory F6
Plugin 'scrooloose/nerdtree'
"Theme
Plugin 'dracula/vim'
Plugin 'zenorocha/dracula-theme',{'rtp':'vim/'}
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Syntax checing
Plugin 'w0rp/ale'
"Git
Plugin 'airblade/vim-gitgutter'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'christoomey/vim-conflicted'
Plugin 'tpope/vim-fugitive'
"Tagbar F8
Plugin 'majutsushi/tagbar'
"Search
Plugin 'junegunn/fzf.vim'
Plugin 'blueyed/vim-diminactive'
Plugin 'jiangmiao/auto-pairs'
"Golang
Plugin 'fatih/vim-go'
"brackets
Plugin 'tpope/vim-surround'


" Start NERDTree on Vim start and focus on edit pane
"autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
nmap <F6> :NERDTreeToggle<CR>

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on"
set shiftwidth=4

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
let g:SuperTabCrMapping = 1

set number
syntax on
"set relative line number
set rnu

"display 5 lines above/below cuser when scrolling"
set scrolloff=5

"backspace problems"
set backspace=indent,eol,start

"increased scrolling"
set ttyfast

"status bar"
set laststatus=2

"display options
set showmode
set showcmd

"highlight matching brackets
set matchpairs+=<:>
hi MatchParen ctermbg=black ctermfg=white

"display different types of whitespaces
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

"set status line display
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

"highlight matching patterns search
set hlsearch

"ignore case when searching
set ignorecase

"audo indent on new lines
set autoindent

"highlight line
set cul!


"split below
set splitbelow

"NerdTree prefs
"let NerdTreeShowHidden=1
let NerdTreeIgnore = ['.pyc$']

"Vertsplit
"highlight VertSplit ctermbg=cyan
"highlight VertSplit ctermfg=cyan
"hi VertSplit ctermfg=Cyan ctermbg=Cyan
highlight VertSplit guibg=Orange guifg=Orange ctermbg=6 ctermfg=0
set fillchars+=vert:\ 
highlight ColorColumn ctermbg=0 guibg=DarkGrey

"Highlight function calls
syntax match pythonFunction /\v[[:alpha:]_.]+\ze(\s?\()/
hi def link pythonFunction Function

"set tab = 4 spaces
set tabstop=4

"Dracula theme
set t_Co=256
au ColorScheme * hi Normal ctermbg=None
set background=dark
let g:dracula_italic = 0
colorscheme dracula

"Ale stuff
let g:ale_linters = {'python': ['flake8']}
let g:ale_linters_explicit = 1
let g:airline#extensions#ale#enabled = 1

"remaps
inoremap kj <Esc>
inoremap jk <Esc>
"nmap <tab> <C-w>w
"nmap <S-tab> <C-w><Left>
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"remaps for coc
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
		let col = col('.') - 1
		return !col || getline('.')[col-1] =~# '\s'
endfunction

"fold methods
set foldmethod=indent
"to have folds start opened
set foldlevel=20

"tagbar
let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'
nmap <F8> :TagbarToggle<CR>

"Javascript
autocmd FileType javascript setlocal ts=4 sts=4 sw=4

"Paste
set pastetoggle=<F2>

"FZF
set rtp+=/usr/local/opt/fzf

"wildmenu
set wildmenu
set wildmode=list:longest,full

"vim fugitive customizations
nnoremap <leader>gd :Gvdiff<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

"diff save stuff
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()
