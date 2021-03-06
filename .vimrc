"Enable 256 color support 
set t_Co=256
set termguicolors

"Are those two lines needed anymore?? I guess they are, things look colorless without them
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

"Call in Vim-Plug, to install all the listed plugins from github

call plug#begin()
"Colorschemes
   Plug 'ayu-theme/ayu-vim' "color scheme ayu in 3 variants
   Plug 'morhetz/gruvbox' "gruvbox colorscheme
   Plug 'nanotech/jellybeans.vim' "color theme
   Plug 'jnurmine/Zenburn' "Zenburn is a low-contrast color scheme for Vim
   Plug 'arcticicestudio/nord-vim' "Nord colorscheme
   Plug 'joshdick/onedark.vim' "Onedark colorscheme
"Utilities
   Plug 'scrooloose/nerdtree'  "directory tree
   Plug 'Xuyuanp/nerdtree-git-plugin' "git support for nerdtree
   Plug 'tpope/vim-surround' "Surround is all about parentheses, brackets, quotes, XML tags, and more.
"Plug 'mkitt/tabline.vim' "Formats tabline to a more 'succint' output
   Plug 'tmhedberg/SimpylFold' "Simple code folding designed for Python
   Plug 'Valloric/YouCompleteMe' "Code completion engine
   Plug 'vim-syntastic/syntastic' "Syntax checking/highlighting
   Plug 'nvie/vim-flake8' "PEP8 checking
   Plug 'tpope/vim-fugitive' "git integration
   Plug 'kien/ctrlp.vim' "Super searching engine
   Plug 'jeetsukumaran/vim-buffergator' " Vim plugin to list, select and switch between buffers
   Plug 'junegunn/vim-easy-align' " Easy alignment tool (use: ga...)
"Airline
   Plug 'vim-airline/vim-airline'
   Plug 'vim-airline/vim-airline-themes'
"Tmux integration
   Plug 'christoomey/vim-tmux-navigator' "merges navigation between panes in tmux and splits in vim
   Plug 'benmills/vimux' "enable interaction with tmux from vim (used mostly for console
   Plug 'edkolev/tmuxline.vim' "modifies tmux status bar to match theme from airline statusbar in vim
"LaTeX plugins
   Plug 'xuhdev/vim-latex-live-preview' "live latex preview from vim
   Plug 'lervag/vimtex' "A plugin that provides support for writing LaTeX documents
"Snippets
   Plug 'SirVer/ultisnips' "Ultimate solution for snippets in vim; a so-called snippet engine
   Plug 'honza/vim-snippets' "A repo for various snippets for vim to be used with snippet engine
"Visual
   Plug 'joeytwiddle/sexy_scroller.vim' "with this plugin vim will scroll smoothly
call plug#end()

"When vim-arirline doesn't appear until I create a new split
set laststatus=2

" Set character encoding to utf-8
set encoding=utf-8

" Set text width to 120 columns
set textwidth=120

" Remove the pause when leaving insert mode (Was it added by Airline plugin??)
set ttimeoutlen=50

"Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

"Format indentation in accordance with PEP8 standards for .py files
"I do not know if this works
au BufNewFile,BufRead *.py
			\ set tabstop=4 |
			\ set softtabstop=4 |
			\ set shiftwidth=4 |
			\ set textwidth=79 |
			\ set expandtab |
			\ set autoindent |
			\ set fileformat=unix
" Flag Unnecessary Whitespace
" I do not know if this works either...
au BufRead,BufNewFile *.py, *.pyw, *.c, *.h match BadWhitespace /\s\+$/

let python_highlight_all=1
syntax on

"Onedark colorscheme
"let g:onedark_termcolors=256
"let g:onedark_terminal_italics=0
"let g:lightline={'colorscheme':'onedark',}
"colorscheme onedark

"Ayu colorscheme
"let ayucolor="light"
"let ayucolor="mirage"
let ayucolor="dark"
colorscheme ayu

"Gruvbox colorscheme
"set background=dark
"let g:gruvbox_italic=0
"let g:gruvbox_contrast_dark='hard'
"colorscheme gruvbox

"Airline configuration
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='default'
let g:airline_powerline_fonts=1
"Tmuxline configuration
let g:tmuxline_powerline_separators=1

"Tmuxline custom preset with shell commands
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'c'    : ['#(whoami)', '#(uptime  | cut -d " " -f 3,5)'], 
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W', '#F'],
      \'y'    : ['%R', '%a', '%Y'],
      \'z'    : '#H'}

let g:airline#extensions#tmuxline#enabled=0

" Enable line numbers
set nu

" Enable spellchecking
map <F6> :setlocal spell! spelllang=en_us<CR>

" Bind keys for tab switching
nnoremap tn :tabnext<CR>
nnoremap tp :tabprev<CR>
" Prompts for file name; if existing then open file; if new then create new
nnoremap t* :tabnew<Space> 
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>
nnoremap tq :tabclose<CR>

"""" BUFFER APPROACH
" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you want to use buffers in this way
set hidden

" To open a new empty buffer
nmap <leader>T :enew<CR>

" Move to the next buffer
nmap <leader>] :bnext<CR>

" Move to the previous buffer
nmap <leader>[ :bprevious<CR>

" Close the current buffer and move to the previous one
" As in closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

"""" BUFFERGATOR Options
"Use the right side of the screen
let g:buffergator_viewport_split_policy = 'R'

" Go to the previous buffer open
nmap <leader>[[ :BuffergatorMruCyclePrev<CR>

" Go to the next buffer open
nmap <leader>]] :BuffergatorMruCycleNext<CR>
"-----------------------------------------------------------------------------"
"                                  LaTeX Setup                                "
"-----------------------------------------------------------------------------"
" Vimtex options
" Set zathura as default viewer
let g:vimtex_view_method = 'zathura'
" When in a .tex file use custom folding method, based on latex expressions
autocmd BufEnter *.tex set foldmethod=expr
autocmd BufEnter *.tex set foldexpr=vimtex#fold#level(v:lnum) 
autocmd BufEnter *.tex set foldtext=vimtex#fold#text() 

"-----------------------------------------------------------------------------"
"                                 Snippets Setup                              "
"-----------------------------------------------------------------------------"
"Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"-----------------------------------------------------------------------------"
"                                 Easy-Alignment                              "
"-----------------------------------------------------------------------------"
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)




