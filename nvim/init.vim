call plug#begin("$XDG_CONFIG_HOME/nvim/plugged")

    Plug 'chrisbra/csv.vim'
    Plug 'moll/vim-bbye'
    Plug 'simeji/winresizer'
    Plug 'junegunn/fzf.vim'
    Plug 'simnalamburt/vim-mundo'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'mattn/emmet-vim'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-speeddating'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-rails'
    Plug 'tpope/vim-endwise'
    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-scriptease'
    Plug 'tpope/vim-vinegar'
    Plug 'tpope/vim-dispatch'
    Plug 'scrooloose/nerdtree'
    Plug 'neomake/neomake'

call plug#end()

set noswapfile
set undofile
set undodir=$HOME/.config/nvim/undo
set undolevels=10000
set undoreload=10000
set clipboard+=unnamedplus
set number
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set hidden
set showtabline=0


noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
nnoremap <space> <nop>
let mapleader="\<space>"
inoremap jk <esc>

nnoremap <leader>bn :bn<cr> ;buffer next
nnoremap <leader>tn gt ;new tab

nnoremap <c-w>h <c-w>v

augroup filetype_csv
    autocmd!

    autocmd BufRead,BufWritePost *.csv :%ArrangeColumn!
    autocmd BufWritePre *.csv :%UnArrangeColumn
augroup END

" let g:winresizer_start_key="<leader>w"

" Create box and figlet - ESSENTIAL :D
vmap <F2> !boxes -d stone<cr>
vmap <f3> !figlet<cr>
" un-highlight when esc is pressed
map <silent> <esc> <Cmd>noh<cr>

"copied from scrooloose .vimrc
"syntastic settings
let syntastic_stl_format = '[Syntax: %E{line:%fe }%W{#W:%w}%B{ }%E{#E:%e}]'
let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "passive_filetypes": ["python"] }

"nerdtree settings
let g:NERDTreeMouseMode = 2
let g:NERDTreeWinSize = 40
let g:NERDTreeMinimalUI=1
let g:NERDTreeIgnore=['\~$', '__pycache__']


"tmux-vim-navigator setup
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <m-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <m-j> :TmuxNavigateDown<cr>
nnoremap <silent> <m-k> :TmuxNavigateUp<cr>
nnoremap <silent> <m-l> :TmuxNavigateRight<cr>
nnoremap <silent> <m-w> :TmuxNavigatePrevious<cr>


"activate rainbow parens for clojure
autocmd syntax clojure call s:ActivateRainbowParens()
function! s:ActivateRainbowParens() abort
    RainbowParenthesesToggle
    RainbowParenthesesLoadRound
    RainbowParenthesesLoadSquare
    RainbowParenthesesLoadBraces
endfunction





nnoremap <F12> :NotesToggle<cr>
command! -nargs=0 NotesToggle call <sid>toggleNotes()
function! s:toggleNotes() abort
    botright silent 90vs ~/notes
    setl wfw

    "hack to make nerdtree et al not split the window
    silent! setl previewwindow

    "for some reason this doesnt get run automatically and the cursor
    "position doesn't get set
    doautocmd bufreadpost %
endfunction




