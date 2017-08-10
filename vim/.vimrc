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

" GPG enc support
Plug 'jamessan/vim-gnupg'

" Better undo support
Plug 'mbbill/undotree'

" Language spesific stuff
Plug 'fatih/vim-go'
Plug 'tpope/vim-markdown'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'hail2u/vim-css3-syntax'
Plug 'jstemmer/gotags'
Plug 'pangloss/vim-javascript'
Plug 'vim-latex/vim-latex'
Plug 'xuhdev/vim-latex-live-preview'
Plug 'shime/vim-livedown'


" Fuzzy searching
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Notes
Plug 'jceb/vim-orgmode'
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
Plug 'peterhurford/send.vim'

" UI
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'mhinz/vim-startify'
Plug 'chriskempson/base16-vim'

" Colorschemes
Plug 'NLKNguyen/papercolor-theme'
Plug 'rakr/vim-one'
Plug 'morhetz/gruvbox'
Plug 'romainl/Apprentice'
Plug 'jdkanani/vim-material-theme'
Plug 'kabbamine/yowish.vim'


" Other tools
Plug 'ervandew/supertab'
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-repeat'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'svermeulen/vim-easyclip'
Plug 'terryma/vim-smooth-scroll'
Plug 'haya14busa/incsearch.vim'
Plug 'easymotion/vim-easymotion'
Plug 'godlygeek/tabular'

" Autocomplete
"Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
"Plug 'Shougo/neoinclude.vim'
"Plug 'zchee/deoplete-go', { 'do': 'make'}
"Plug 'zchee/deoplete-clang'
"Plug 'carlitux/deoplete-ternjs'
"Plug 'artur-shaik/vim-javacomplete2'
"Plug 'kiddos/deoplete-cpp'
"Plug 'zchee/deoplete-jedi'

" ALE - Linting
Plug 'w0rp/ale'
"Plug 'neomake/neomake'
Plug 'benjie/neomake-local-eslint.vim'

" Testing
"Plug 'dansomething/vim-eclim'

Plug 'freitass/todo.txt-vim'
"Plug 'flowtype/vim-flow'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'wakatime/vim-wakatime'
Plug 'Chiel92/vim-autoformat'
Plug 'jebaum/vim-tmuxify'
Plug 'sbdchd/neoformat'
Plug 'airblade/vim-rooter'
Plug 'critiqjo/lldb.nvim'
"Plug 'othree/javascript-libraries-syntax.vim'
"Plug 'mxw/vim-jsx'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'PotatoesMaster/i3-vim-syntax'


Plug 'joshdick/onedark.vim'
Plug 'mhartington/oceanic-next'

call plug#end()
autocmd! BufWritePost * silent! Neomake

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

set encoding=utf8

filetype plugin indent on

set undofile
set undodir=~/.VIM_UNDO_FILES

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
set t_Co=256
set background=dark

let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default.dark': {
  \       'transparent_background': 1
  \     }
  \   }
  \ }
silent! colorscheme PaperColor
"hi Normal ctermbg=NONE ctermfg=254
"hi Search ctermbg=LightBlue guibg=blue
" "hi CursorLineNr ctermfg=4
hi EndOfBuffer ctermfg=12 guifg=blue
hi SpecialKey ctermfg=red cterm=bold guifg=red

" HIghlight Bad spaces
set listchars=nbsp:¬,tab:\ \ 
",trail:-
set list
set cursorline

"
" Mapping
"
let g:mapleader = ','
nnoremap <leader><space>      :noh<CR>
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
map      <Leader><Leader>     <Plug>(easymotion-prefix)

" Move current line / visual line selection up or down.
nnoremap <leader>j :m+<CR>==
nnoremap <leader>k :m-2<CR>==
vnoremap <leader>j :m'>+<CR>gv=gv
vnoremap <leader>k :m-2<CR>gv=gv

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

" Mapping for folding
nnoremap <space> za
vnoremap <space> zf

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" smooooooth scroll!
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

"
" Plugin settings
"

" Gitgutter
set signcolumn=yes

" Set laststatus to two, to enable lightline
set laststatus=2

" Dont autostart markdown composer
let g:markdown_composer_autostart=0

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#libclang_path='/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header='/usr/lib/clang/'

let g:markdown_enable_spell_checking = 0

let g:SignatureMarkerTextHLDynamic = 1
let g:SignatureMarkerTextHL = 1

" Fix bug in neovim, not allowing <C-h>
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>

" Tagbar
let g:tagbar_type_go = {
            \ 'ctagstype' : 'go',
            \ 'kinds'     : [
            \ 'p:package',
            \ 'i:imports:1',
            \ 'c:constants',
            \ 'v:variables',
            \ 't:types',
            \ 'n:interfaces',
            \ 'w:fields',
            \ 'e:embedded',
            \ 'm:methods',
            \ 'r:constructor',
            \ 'f:functions'
            \ ],
            \ 'sro' : '.',
            \ 'kind2scope' : {
            \ 't' : 'ctype',
            \ 'n' : 'ntype'
            \ },
            \ 'scope2kind' : {
            \ 'ctype' : 't',
            \ 'ntype' : 'n'
            \ },
            \ 'ctagsbin'  : 'gotags',
            \ 'ctagsargs' : '-sort -silent'
            \ }

au FileType javascript.jsx setlocal sw=2 sts=2 et
au FileType css setlocal sw=2 sts=2 et

au FileType markdown set nonu
au Filetype markdown set wrap linebreak nolist textwidth=0 wrapmargin=0

au FileType markdown noremap <silent> j gj
au FileType markdown noremap <silent> k gk


fun! s:scroll()
    let l:save = &scrolloff

    set scrolloff=0 noscrollbind nowrap nofoldenable
    botright vsplit

    normal L
    normal j
    normal zt

    setlocal scrollbind
    exe "normal \<c-w>p"
    setlocal scrollbind

    let &scrolloff = l:save
endfun
command! Scroll call s:scroll()

" Share yank across all sessions!!
let g:EasyClipShareYanks = 1

" Ale config
let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'
let g:ale_statusline_format = ['%d error(s)', '(%d)', 'OK']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
hi ALEErrorSign ctermfg=1 ctermbg=0
hi ALEwarningSign ctermfg=3 ctermbg=0
hi NeomakeErrorSign ctermfg=1
hi NeomakeWarningSign ctermfg=3
hi NeomakeError ctermfg=1 cterm=underline 

" Cursor shape in Nvim
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

" Startify theme
"highlight StartifyBracket ctermfg=4
"highlight StartifyFooter  ctermfg=8
"highlight StartifyHeader  ctermfg=8
"highlight StartifyNumber  ctermfg=5
"highlight StartifySection ctermfg=148
"highlight StartifyPath    ctermfg=7
"highlight StartifyFile    ctermfg=37 cterm=bold
"highlight StartifySlash   ctermfg=208
"highlight StartifySpecial ctermfg=12

let g:startify_bookmarks = [
    \ {'n': '~/src/ntnu-hugo/'},
    \ {'v': '~/.vimrc'},
    \ {'z': '~/.zshrc'},
    \ {'x': '~/.Xresources'},
    \ {'t': '~/.tmux.conf'}
\]

let g:startify_custom_header = [
            \ '                                                                        ',
            \ '                                                                        ',
            \ '        __  __     ______     ______     _____     ______     __        ',
            \ '       /\ \/\ \   /\  ___\   /\  ___\   /\  __-.  /\  __ \   /\ \       ',
            \ '       \ \ \_\ \  \ \ \__ \  \ \  __\   \ \ \/\ \ \ \  __ \  \ \ \____  ',
            \ '        \ \_____\  \ \_____\  \ \_____\  \ \____-  \ \_\ \_\  \ \_____\ ',
            \ '         \/_____/   \/_____/   \/_____/   \/____/   \/_/\/_/   \/_____/ ',
            \ '                                  __                                    ',
            \ '                          __  __ /\_\    ___ ___                        ',
            \ '                         /\ \/\ \\/\ \ /'' __` __`\                     ',
            \ '                   (NEO) \ \ \_/ |\ \ \/\ \/\ \/\ \                     ',
            \ '                          \ \___/  \ \_\ \_\ \_\ \_\                    ',
            \ '                           \/__/    \/_/\/_/\/_/\/_/                    ',
            \ ]                          

"let g:lightline = {
"            \ 'colorscheme': 'wombat',
"            \ 'active': {
"            \   'left': [ [ 'mode'],['filename', 'modified'], ['ALE', 'paste' ]]
"            \ },
"            \ 'component': {
"            \   'ALE': '%{ALEGetStatusLine()}',
"            \ }
"            \ }

let g:rooter_silent_chdir = 1
let g:rooter_patterns = ['Makefile', '.git/']

let g:neomake_java_javac_classpath=$CLASSPATH
let g:neomake_cpp_enabled_makers = ['clang']
let g:neomake_cpp_clang_maker = {
   \ 'exe': 'clang++',
   \ 'args': ['-std=gnu++14'],
   \ }


let g:neoformat_javascript_eslint = {
            \ 'exe': 'node_modules/eslint/bin/eslint.js',
            \ 'args': ['--fix', "-c", "$PWD/.eslintrc", "%"],
            \ }

let g:neoformat_enabled_javascript = ['eslint']
let g:neomake_arduino_avrgcc_maker = {
            \ 'exe': '/usr/share/arduino/hardware/tools/avr/bin/avr-g++',
            \ 'args': [
            \ '-mmcu=atmega328p',
            \ '-DF_CPU=16000000L',
            \ '-DARDUINO=165',
            \ '-DARDUINO_ARCH_AVR',
            \ '-ffunction-sections',
            \ '-fdata-sections',
            \ '-g',
            \ '-Os',
            \ '-I/usr/share/arduino/hardware/arduino/cores/arduino',
            \ '-I/usr/share/arduino/hardware/tools/avr/avr/include',
            \ '-I/usr/share/arduino/hardware/arduino/avr/variants/standard',
            \ '-I/home/odin/arduino/libaries/*',
            \ '-include/usr/share/arduino/hardware/arduino/avr/cores/arduino/Arduino.h',
            \ '-fsyntax-only',
            \ '-Wextra',
            \ '-Wall',
            \ '-xc++',
            \ ],
            \ 'errorformat':
            \ '%-G%f:%s:,' .
            \ '%f:%l:%c: %trror: %m,' .
            \ '%f:%l:%c: %tarning: %m,' .
            \ '%f:%l:%c: %m,'.
            \ '%f:%l: %trror: %m,'.
            \ '%f:%l: %tarning: %m,'.
            \ '%f:%l: %m',
            \ }

let g:neomake_arduino_enabled_makers = ['avrgcc']
let g:gitgutter_sign_added = '|'
let g:gitgutter_sign_modified = '|'
let g:gitgutter_sign_removed = '|'
let g:gitgutter_sign_removed_first_line = '__'
let g:gitgutter_sign_modified_removed = '__'

"hi GitGutterAdd guifg=#0fd700 ctermfg=32
"hi GitGutterChange guifg=yellow ctermfg=33
"hi GitGutterDelete guifg=red ctermfg=31

" Python {{{
let g:neomake_python_flake8_maker = {
    \ 'args': ['--ignore=D100,D101,D102,D201,D202,D200']
    \ }
let g:neomake_python_enabled_makers = ['flake8']

function! Multiple_cursors_before()
    let b:deoplete_disable_auto_complete = 1
endfunction

function! Multiple_cursors_after()
    let b:deoplete_disable_auto_complete = 0
endfunction

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
