" Description {{{
" ===========
" Fisa-nvim-config
" http://nvim.fisadev.com
" version: 10.0
" ============================================================================
" }}}

" Vim-plug initialization {{{
" Avoid modify this section, unless you are very sure of what you are doing

let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.config/nvim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.config/nvim/autoload
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

" ============================================================================
" }}}

" Active plugins {{{

" this needs to be here, so vim-plug knows we are declaring the plugins we
" want to use
call plug#begin('~/.config/nvim/plugged')

" Now the actual plugins:

" Base16 colorscheme
Plug 'chriskempson/base16-vim'
"Plug 'Soares/base16.nvim'

" Tmux Vim-like navigation
Plug 'christoomey/vim-tmux-navigator'

" Python syntax colors
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

" Override configs by directory
Plug 'arielrossanigo/dir-configs-override.vim'

" Code commenter
Plug 'scrooloose/nerdcommenter'

" Better file browser
Plug 'scrooloose/nerdtree'

" Class/module browser
" Plug 'majutsushi/tagbar'
" TODO known problems:
" * current block not refreshing

" Search results counter
Plug 'vim-scripts/IndexedSearch'

" Terminal Vim with 256 colors colorscheme
Plug 'fisadev/fisa-vim-colorscheme'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Code and files fuzzy finder
" Plug 'ctrlpvim/ctrlp.vim'
" Extension to ctrlp, for fuzzy command finder
" Plug 'fisadev/vim-ctrlp-cmdpalette'
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'

" Pending tasks list
" Plug 'fisadev/FixedTaskList.vim'

" Async autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Completion from other opened files
Plug 'Shougo/context_filetype.vim'
" Python autocompletion
Plug 'zchee/deoplete-jedi', { 'do': ':UpdateRemotePlugins' }
" Just to add the python go-to-definition and similar features, autocompletion
" from this plugin is disabled
Plug 'davidhalter/jedi-vim'

" Automatically close parenthesis, etc
"Plug 'Townk/vim-autoclose'

" Better than autoclose probably
Plug 'jiangmiao/auto-pairs'

" Surround
Plug 'tpope/vim-surround'

" Indent text object
Plug 'michaeljsmith/vim-indent-object'

" Indentation based movements
Plug 'jeetsukumaran/vim-indentwise'

" Better language packs
Plug 'sheerun/vim-polyglot'

" Python folding
Plug 'tmhedberg/SimpylFold'

" Ack code search (requires ack installed in the system)
" Plug 'mileszs/ack.vim'
" TODO is there a way to prevent the progress which hides the editor?

" Paint css colors with the real color
Plug 'lilydjwg/colorizer'

" Window chooser
Plug 't9md/vim-choosewin'

" Automatically sort python imports
Plug 'fisadev/vim-isort'

" Highlight matching html tags
Plug 'valloric/MatchTagAlways'

" Generate html in a simple way
Plug 'mattn/emmet-vim'

" Git integration
Plug 'tpope/vim-fugitive'

" Git/mercurial/others diff icons on the side of the file lines
Plug 'mhinz/vim-signify'

" Yank history navigation
Plug 'vim-scripts/YankRing.vim'

" Linters
Plug 'neomake/neomake'
"

" Relative numbering of lines (0 is the current line)
" (disabled by default because is very intrusive and can't be easily toggled
" on/off. When the plugin is present, will always activate the relative
" numbering every time you go to normal mode. Author refuses to add a setting
" to avoid that)
Plug 'myusuf3/numbers.vim'



" Tell vim-plug we finished declaring plugins, so it can load them
call plug#end()

" ============================================================================
" }}}

" Install Plugin Initialization {{{

if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif

" ============================================================================
" }}}

" Plugins settings and mappings {{{

" Tagbar -----------------------------

" toggle tagbar display
map <F4> :TagbarToggle<CR>
" autofocus on tagbar open
let g:tagbar_autofocus = 1

" NERDTree -----------------------------

" toggle nerdtree display
map <F3> :NERDTreeToggle<CR>
" open nerdtree with the current file selected
nmap ,t :NERDTreeFind<CR>
" don;t show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

" Tasklist ------------------------------

" show pending tasks list
map <F2> :TaskList<CR>

" Neomake ------------------------------

" Run linter on write
autocmd! BufWritePost * Neomake

" Check code as python3 by default
let g:neomake_python_python_maker = neomake#makers#ft#python#python()
let g:neomake_python_flake8_maker = neomake#makers#ft#python#flake8()
let g:neomake_python_python_maker.exe = 'python3 -m py_compile'
let g:neomake_python_flake8_maker.exe = 'python3 -m flake8'

nmap ,r :!python3 % <CR>
nmap ,e :exit <CR>

nmap <F5> :!python3 % <CR>

" Fzf ------------------------------

" file finder mapping
nmap ,E :Files<CR>
" tags (symbols) in current file finder mapping
nmap ,g :BTag<CR>
" tags (symbols) in all files finder mapping
nmap ,G :Tag<CR>
" general code finder in current file mapping
nmap ,f :BLines<CR>
" general code finder in all files mapping
nmap ,F :Lines<CR>
" commands finder mapping
" nmap ,c :Commands<CR>
" to be able to call CtrlP with default search text
"function! CtrlPWithSearchText(search_text, ctrlp_command_end)
    "execute ':CtrlP' . a:ctrlp_command_end
    "call feedkeys(a:search_text)
"endfunction
" same as previous mappings, but calling with current word as default text
"nmap ,wg :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
"nmap ,wG :call CtrlPWithSearchText(expand('<cword>'), 'BufTagAll')<CR>
"nmap ,wf :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
"nmap ,we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
"nmap ,pe :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>
"nmap ,wm :call CtrlPWithSearchText(expand('<cword>'), 'MRUFiles')<CR>
"nmap ,wc :call CtrlPWithSearchText(expand('<cword>'), 'CmdPalette')<CR>


" Deoplete -----------------------------

" Use deoplete.

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
" complete with words from any opened file
let g:context_filetype#same_filetypes = {}
let g:context_filetype#same_filetypes._ = '_'

" Jedi-vim ------------------------------

" Disable autocompletion (using deoplete instead)
let g:jedi#completions_enabled = 0

" All these mappings work only for python code:
" Go to definition
let g:jedi#goto_command = ',d'
" Find ocurrences
let g:jedi#usages_command = ',o'
" Find assignments
let g:jedi#goto_assignments_command = ',a'
" Go to definition in new tab
nmap ,D :tab split<CR>:call jedi#goto()<CR>

" Ack.vim ------------------------------

" mappings
nmap ,R :Ack 
nmap ,wr :Ack <cword><CR>

" Window Chooser ------------------------------

" mapping
nmap  -  <Plug>(choosewin)
" show big letters
let g:choosewin_overlay_enable = 1

let mapleader = ","

" Signify ------------------------------

" this first setting decides in which order try to guess your current vcs
" UPDATE it to reflect your preferences, it will speed up opening files
let g:signify_vcs_list = [ 'git', 'hg' ]
" mappings to jump to changed blocks
nmap ,sn <plug>(signify-next-hunk)
nmap ,sp <plug>(signify-prev-hunk)

" Autoclose ------------------------------

" Fix to let ESC work as espected with Autoclose plugin
" (without this, when showing an autocompletion window, ESC won't leave insert
"  mode)
let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}

" Yankring -------------------------------

" Fix for yankring and neovim problem when system has non-text things copied
" in clipboard
let g:yankring_clipboard_monitor = 0
let g:yankring_history_dir = '~/.config/nvim/'

" Airline ------------------------------

let g:airline_powerline_fonts = 1
let g:airline_theme = 'wombat'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1

" to use fancy symbols for airline, uncomment the following lines and use a
" patched font (more info on docs/fancy_symbols.rst)
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'
" }}}

" Vim settings and mappings {{{

" tabs and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" show line numbers
set nu

" remove ugly vertical lines on window division
set fillchars+=vert:\ 


"let g:solarized_termcolors=256
" use 256 colors when possible
"if (&term =~? 'mlterm\|xterm\|xterm-256\|screen-256') || has('nvim')
    "let &t_Co = 256
    "colorscheme default
    "set background=light
"else
    "colorscheme default
    "set background=light
"endif
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-default-dark

" needed so deoplete can auto select the first suggestion
set completeopt+=noinsert
" comment this line to enable autocompletion preview window
" (displays documentation related to the selected completion option)
"set completeopt-=preview

" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest

" save as sudo
ca w!! w !sudo tee "%"

" tab navigation mappings
"map tt :tabnew 
"map <M-Right> :tabn<CR>
"imap <M-Right> <ESC>:tabn<CR>
"map <M-Left> :tabp<CR>
"imap <M-Left> <ESC>:tabp<CR>
"
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3

" clear search results
nnoremap <silent> // :noh<CR>

" clear empty spaces at the end of lines on save of python files
autocmd BufWritePre *.py :%s/\s\+$//e

map <Leader>p "+p
map <Leader>y "+y
" fix problems with uncommon shells (fish, xonsh) and plugins running commands
" (neomake, ...)
set shell=/bin/bash 

" Move naturally between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Set foldmethod
set foldmethod=marker

" Fold with spacebar in normal mode
nnoremap <space> za

" better backup, swap and undos storage
set directory=~/.vim/dirs/tmp     " directory to place swap files in
set backup                        " make backup files
set backupdir=~/.vim/dirs/backups " where to put backup files
set undofile                      " persistent undos - undo after you re-open the file
set undodir=~/.vim/dirs/undos
set viminfo+=n~/.vim/dirs/viminfo
" store yankring history file there too
let g:yankring_history_dir = '~/.vim/dirs/'

" create needed directories if they don't exist
if !isdirectory(&backupdir)
    call mkdir(&backupdir, "p")
endif
if !isdirectory(&directory)
    call mkdir(&directory, "p")
endif
if !isdirectory(&undodir)
    call mkdir(&undodir, "p")
endif

set noswapfile
" ============================================================================
" }}}

" Highlights - colors customization {{{
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SpellBad        cterm=underline ctermbg=none ctermfg=167
highlight SpellCap        cterm=underline ctermbg=none ctermfg=167
highlight Error             cterm=bold ctermbg=none ctermfg=167
highlight CursorColumn      ctermbg=none
highlight SignifySignAdd    cterm=bold ctermbg=none  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=none  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=none  ctermfg=227
highlight ErrorMsg          cterm=bold ctermbg=none ctermfg=167
highlight MatchParen        cterm=bold ctermbg=none ctermfg=202
highlight SpellLocal        cterm=none ctermbg=none ctermfg=227
highlight Search            cterm=bold ctermbg=none ctermfg=119
highlight Visual            cterm=reverse ctermbg=none
highlight SignColumn        ctermbg=none
highlight Folded            ctermbg=none ctermfg=blue
"highlight pythonStatement ctermfg=blue
"highlight pythonFunction ctermfg=75
"highlight pythonNumber ctermfg=2
"}}}

