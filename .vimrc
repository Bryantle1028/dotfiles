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
"Plugin 'davidhalter/jedi-vim'
"Plugin 'ervandew/supertab'
Plugin 'neoclide/coc.nvim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'dracula/vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'zenorocha/dracula-theme',{'rtp':'vim/'}
Plugin 'w0rp/ale'
Plugin 'airblade/vim-gitgutter'
Plugin 'majutsushi/tagbar'

" Start NERDTree on Vim start and focus on edit pane
"autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
nmap <F6> :NERDTreeToggle<CR>

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
let g:SuperTabCrMapping = 1

set number
syntax on

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

"set relative line number
set rnu

"split below
set splitbelow

"NerdTree prefs
"let NerdTreeShowHidden=1
let NerdTreeIgnore = ['.pyc$']

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
nmap <tab> <C-w>w
nmap <S-tab> <C-w><Left>

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
