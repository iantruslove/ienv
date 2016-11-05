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
set nowrap
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set shiftround 

""" misc
set laststatus=2        " always show status bar
set relativenumber      " line numbers
set showmatch           " Show matching brackets
set matchtime=5         " Bracket blinking
set hlsearch incsearch  " search highlight
set wildmenu            " menu for commands
set list
set directory=$HOME/.vim/swapfiles//
set rtp+=~/.fzf

""" List chars
set listchars=""
set listchars=tab:\ \
set listchars+=trail:·
set listchars+=tab:»·
set listchars+=extends:>
set listchars+=precedes:<
set showbreak=↪ " Visualize wrapped lines when wrap toggled

augroup golang
    autocmd BufRead *.go set nolist
augroup END

""" folding
set foldenable
set foldmethod=syntax
set foldlevelstart=3
set foldnestmax=4

""" colors please
syntax enable
set cursorline
set background=light

""" auto complete
set completeopt=longest,menuone,preview
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
    \ if &omnifunc == "" |
    \     setlocal omnifunc=syntaxcomplete#Complete |
    \ endif
endif

""" load plugins
execute pathogen#infect()


""" try to set colorscheme
try
  let g:solarized_termtrans=1
  colorscheme solarized
  hi StatusLine term=none cterm=none
catch
  " do nothing
endtry

""" Statusline
set statusline=%<%F\ %m\ %{&ff}\/%{&fileencoding?&fileencoding:&encoding}
set statusline+=%=
set statusline+=0x\%02.2B\(\%03.3b)\ %3v\ %10(%l/%L%)

""" remappings
nnoremap <leader><space> :nohlsearch<CR>  " clear search highlight
nnoremap z za                             " simpler folding toggle

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

noremap <Up> <C-a>
noremap <Down> <C-x>
noremap <Left> <NOP>
noremap <Right> <NOP>

""" automatics
autocmd FocusLost * :set number
autocmd FocusGained * :set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

autocmd FocusLost,TabLeave * call feedkeys("\<C-\>\<C-n>")
