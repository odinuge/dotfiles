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
Plug 'previm/previm'
Plug 'kaicataldo/material.vim'

Plug 'itchyny/lightline.vim'
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
Plug 'mxw/vim-jsx'

" Fuzzy searching
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Speeddating for <C-a> & <C-x>
Plug 'tpope/vim-speeddating'

" Tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'jebaum/vim-tmuxify'

" Remember last place
Plug 'dietsche/vim-lastplace'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" UI
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mhinz/vim-startify'

" Colorschemes
Plug 'NLKNguyen/papercolor-theme'
Plug 'rakr/vim-one'
Plug 'jacoborus/tender.vim'
Plug 'joshdick/onedark.vim'
Plug 'sonph/onehalf', {'rtp': 'vim/'}

" Other tools
"Plug 'ervandew/supertab'
Plug 'svermeulen/vim-easyclip'
Plug 'tpope/vim-repeat'
Plug 'haya14busa/incsearch.vim'
Plug 'easymotion/vim-easymotion'
Plug 'jparise/vim-graphql'
Plug 'rust-lang/rust.vim'
Plug 'gregsexton/gitv', {'on': ['Gitv']}
Plug 'matze/vim-move'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'

" Autocomplete & lining
Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
Plug 'meain/vim-package-info', { 'do': 'npm install' }

" Set proper root dir
Plug 'airblade/vim-rooter'


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
"call one#highlight('Normal', '', '', 'none')




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
nnoremap <leader>e            :NERDTreeTabsToggle<CR>
nnoremap <Leader>a            :Rg<CR>
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
            \   'typescript': ['prettier'],
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
" " Write this in your vimrc file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
" You can disable this option too
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0
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

" add yaml stuffs
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649

" Better display for messages
set cmdheight=2

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nnoremap <tab>   :tabnext<CR>
nnoremap <S-tab>   :tabprev<CR>
