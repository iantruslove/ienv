set nocompatible
filetype plugin on

""" speed tweaks
set ttimeoutlen=30
set timeoutlen=700
set lazyredraw
set ttyfast

""" Persistent undos
if has('persistent_undo')
	set undodir=~/.vim/undos
	set undofile
	set undolevels=3000
	set undoreload=10000
endif

""" spacing and shifting
set tabstop=4           " tab width of 4 spaces 
set softtabstop=4       " tab = 4 spaces
set shiftwidth=4
set autoindent
set smartindent

""" misc
set laststatus=2        " always show status bar
set relativenumber      " line numbers
set showmatch           " Show matching brackets
set matchtime=5         " Bracket blinking
set hlsearch incsearch  " search highlight
set wildmenu            " menu for commands
set mouse=a             " enable mouse in all modes

""" folding
set foldenable
set foldmethod=syntax
set foldlevelstart=3
set foldnestmax=5

""" colors please
syntax enable
set cursorline
set background=light

""" auto complete
set completeopt=longest,menuone,preview
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
          \	if &omnifunc == "" |
          \		setlocal omnifunc=syntaxcomplete#Complete |
          \	endif
endif

""" load plugins
execute pathogen#infect()


""" try to set colorscheme
try
	let g:solarized_termtrans=1
	colorscheme solarized
catch
	" do nothing
endtry

""" remappings
nnoremap <leader><space> :nohlsearch<CR>  " clear search highlight
nnoremap z za                             " simpler folding toggle

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk


""" automatics
autocmd FocusLost * :set number
autocmd FocusGained * :set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

