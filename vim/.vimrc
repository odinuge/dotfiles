""""""""""""""""""""""
" dotvim
" Odin Ugedal <odin@ugedal.com>
"
" Simple vimconfig
""""""""""""""""""""""

"
" Plug <3
"
call plug#begin('~/.vim/plugged')

" Boooring functions
function! DoRemote(arg)
    UpdateRemotePlugins
endfunction
Plug 'racer-rust/vim-racer'
Plug 'previm/previm'
Plug 'kaicataldo/material.vim'

" Better undo support
Plug 'mbbill/undotree'

" GPG enc support
Plug 'jamessan/vim-gnupg'

" Language spesific stuff
Plug 'fatih/vim-go'
Plug 'tpope/vim-markdown'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'hail2u/vim-css3-syntax'
Plug 'pangloss/vim-javascript'
Plug 'vim-latex/vim-latex'

" Fuzzy searching
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-speeddating'

" Tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux'
Plug 'tmux-plugins/vim-tmux-focus-events'

" Remember last place
Plug 'dietsche/vim-lastplace'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" UI
Plug 'scrooloose/nerdtree'
Plug 'mhinz/vim-startify'

" Colorschemes
Plug 'NLKNguyen/papercolor-theme'
Plug 'rakr/vim-one'
Plug 'jacoborus/tender.vim'
Plug 'joshdick/onedark.vim'
Plug 'sonph/onehalf', {'rtp': 'vim/'}

" Other tools
Plug 'ervandew/supertab'
Plug 'svermeulen/vim-easyclip'
Plug 'haya14busa/incsearch.vim'
Plug 'easymotion/vim-easymotion'
Plug 'jparise/vim-graphql'
Plug 'rust-lang/rust.vim'

" Autocomplete
"Plug 'maralla/completor.vim'
"Plug 'flowtype/vim-flow'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'wokalski/autocomplete-flow'
Plug 'matze/vim-move'

" ALE - Linting
Plug 'w0rp/ale'

Plug 'jebaum/vim-tmuxify'
Plug 'airblade/vim-rooter'
Plug 'mxw/vim-jsx'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-repeat'


Plug 'Valloric/YouCompleteMe'

"Plug 'Shougo/deoplete.nvim'
"Plug 'roxma/nvim-yarp'
"Plug 'roxma/vim-hug-neovim-rpc'
"Plug 'sebastianmarkow/deoplete-rust'

"Plug 'vim-scripts/Conque-GDB'

"Plug 'reasonml-editor/vim-reason-plus'
"Plug 'roxma/vim-hug-neovim-rpc'


call plug#end()

"
" UI 
"

" Enable syntax
syntax on

" Enable wrapscan
set wrapscan

" Enable better searching
set ignorecase
set smartcase
set incsearch
set hlsearch
if has('nvim')
    set inccommand=nosplit
endif

set magic

set showmatch

" Enable line numbers
"set relativenumber 
set number

" Make indenting awesome
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

set encoding=utf-8

filetype plugin indent on

set undofile
set undodir=~/.VIM_UNDO_FILES
set backupdir=~/.VIM_BACKUP_FILES
set directory=~/.VIM_DIRECTORY_FILES
set dir=~/.VIM_DIRECTORY_FILES

" Fix wrapping
set whichwrap+=<,>,h,l,[,]

set backspace=indent,eol,start
set scrolloff=7

" Enable folding
set foldmethod=indent
set foldnestmax=1
set foldlevelstart=99
"
" UI
"
"set t_Co=256
set background=dark

let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default.dark': {
  \       'transparent_background': 1
  \     }
  \   }
  \ }

hi EndOfBuffer ctermfg=12 guifg=blue
hi SpecialKey ctermfg=red cterm=bold guifg=red
let g:one_allow_italics = 1
silent! colorscheme one
"if (empty($TMUX))
  if (has("termguicolors"))
    set termguicolors
  endif
"endif
hi Normal guibg=NONE ctermbg=NONE
call one#highlight('Normal', '', '', 'none')




" HIghlight Bad spaces
set listchars=nbsp:¬,tab:\ \ 
",trail:-
set list

set mouse=a

"
" Mapping
"
let g:mapleader = ','
nnoremap <leader><space>      :noh<CR>
nnoremap <space>              :noh<CR>
nnoremap <leader>p            :FZF<CR>
nnoremap <leader>f            :FZF<CR>
nnoremap <leader>u            :UndotreeToggle<CR>
nnoremap <leader>m            :LivedownPreview<CR>
nnoremap <leader>e            :NERDTreeToggle<CR>
nnoremap <Leader>a            :Ag<CR>
nnoremap <Leader>c            :call Toggle_background()<CR>
nnoremap <Leader>t            :TagbarToggle<CR>
nnoremap <Leader>b            :Buffers<CR>
nnoremap <Leader>g            :GitFiles<CR>
map      <Leader>             <Plug>(easymotion-prefix)


nnoremap Q @q

" w!! will allow you to save using sudo
cnoremap w!! w !sudo tee > /dev/null %

" Map arrowkeys
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>
nnoremap <Up> <NOP>
nnoremap <Down> <NOP>

" Real shifting in visual mode
vnoremap < <gv
vnoremap > >gv

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
"
" Plugin settings
"

" Gitgutter
set signcolumn=yes

" Set laststatus to two, to enable lightline
set laststatus=2

" Dont autostart markdown composer
let g:markdown_composer_autostart=0

" Fix bug in neovim, not allowing <C-h>
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>

au FileType markdown set nonu
au Filetype markdown set wrap linebreak nolist textwidth=0 wrapmargin=0

au FileType markdown noremap <silent> j gj
au FileType markdown noremap <silent> k gk


" Share yank across all sessions!!
let g:EasyClipShareYanks = 1
let g:EasyClipEnableBlackHoleRedirect = 0
"
" Ale config
hi ALEErrorSign ctermfg=1
hi ALEwarningSign ctermfg=3


let g:startify_bookmarks = [
    \ {'n': '~/src/ntnu-hugo/'},
    \ {'v': '~/.vimrc'},
    \ {'z': '~/.zshrc'},
    \ {'x': '~/.Xresources'},
    \ {'t': '~/.tmux.conf'}
\]


"let g:rooter_silent_chdir = 1
let g:rooter_patterns = ['Makefile', '.git/']

let g:gitgutter_sign_added = '|'
let g:gitgutter_sign_modified = '|'
let g:gitgutter_sign_removed = '|'
let g:gitgutter_sign_removed_first_line = '__'
let g:gitgutter_sign_modified_removed = '__'

" Cursor shape in Nvim
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

" Cursorshape (for gnome-terminal)
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' | 
    \   silent execute '!echo -ne "\e[6 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[4 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

set timeoutlen=1000 ttimeoutlen=0

let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'

let g:ale_javascript_prettier_use_local_config=1
let g:ale_fix_on_save = 1
let g:ale_cpp_clang_options = '-std=c++14'
let g:ale_asm_gcc_executable = 'arm-none-eabi-gcc'
let g:ale_fixers = {
            \   'javascript': ['prettier'],
            \   'graphql': ['prettier'],
            \   'css': ['prettier'],
            \   'c': ['clang-format'],
            \   'python': ['isort', 'black'],
            \   'java': ['google_java_format'],
            \   'rust': ['rustfmt'],
            \   'markdown': ['prettier'],
            \   'c++': ['clang-format'],
            \   'yaml': ['prettier'],
            \   'haskell': ['hfmt'],
            \   'sh': ['shfmt']
            \}

let g:ale_linters = {
            \ 'go': ['go build', 'go vet','go imports','gometalinter', 'gofmt'],
            \ 'cpp': [ 'clang', 'clangtidy', 'cppcheck', 'cpplint', 'gcc' ],
            \ 'javascript': ['prettier','eslint', 'flow'],
            \ 'css': ['stylelint', 'prettier'],
            \ 'python': ['flake8'],
            \ 'yaml': ['prettier'],
            \ 'graphql': ['prettier'],
            \}
" \ 'rust': ['rustfmt', 'rustc'],
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>


let g:completor_clang_binary = '/usr/bin/clang'
let g:completor_racer_binary = '/home/odin/.cargo/bin/racer'
let g:deoplete#enable_at_startup = 1
set pyxversion=3
let $NVIM_PYTHON_LOG_FILE="/tmp/nvim_log"
let $NVIM_PYTHON_LOG_LEVEL="DEBUG"
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END
let g:previm_open_cmd = 'chromium'
