

call plug#begin('~/.vim/plugged')
Plug 'fntlnz/atags.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'tpope/vim-dispatch'
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'bling/vim-airline'
Plug 'vim-scripts/a.vim'
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }

" Theme
" ------------------------------------------------------------------------------
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline-themes'

" Search
" ------------------------------------------------------------------------------
Plug 'junegunn/fzf.vim'
"Plug 'junegunn/vim-slash'
Plug 'mhinz/vim-grepper'
Plug 'mileszs/ack.vim'
Plug 'numkil/ag.nvim'

" Syntax and highlighting for every language
" ------------------------------------------------------------------------------
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'sheerun/vim-polyglot'

" HTML/CSS
" ------------------------------------------------------------------------------
Plug 'ap/vim-css-color', {'for': ['css', 'scss', 'vue']} " Highlight css colors with their color
Plug 'mattn/emmet-vim' " Easy HTML and CSS generation
Plug 'alvan/vim-closetag' " Automatically add a closing HTML tag
Plug 'tpope/vim-haml' " Better Scss highlighting than polyglot
"Plug 'mxw/vim-jsx'

" JavaScript
" ------------------------------------------------------------------------------
Plug 'pangloss/vim-javascript', {'for': ['javascript', 'javascript.jsx']}
Plug 'moll/vim-node', {'for': ['javascript', 'javascript.jsx', 'json']}

" File managment
" ------------------------------------------------------------------------------
Plug 'scrooloose/nerdtree'

" Editing
" ------------------------------------------------------------------------------
Plug 'matze/vim-move' " Move blocks of code with ALT+j/k
Plug 'ntpeters/vim-better-whitespace' " Whitespace removal
Plug 'jlanzarotta/bufexplorer' " Manage buffers in a list
"Plug 'dense-analysis/ale'

call plug#end()

" Shortcut for checking if a plugin is loaded
function! s:has_plugin(plugin)
    let lookup = 'g:plugs["' . a:plugin . '"]'
    return exists(lookup)
endfunction


" Stop vim trying to syntax highlight long lines, typically found in minified
" files. This greatly reduces lag yet is still wide enough for large displays
set synmaxcol=500

set nocompatible
"runtime macros/matchit.vim
set shell=/bin/bash
"allow backspacing over everything in insert mode
set backspace=indent,eol,start

"store lots of :cmdline history
set history=1000

set showcmd     "show incomplete cmds down the bottom
set showmode    "show current mode down the bottom
set number      "show line numbers

"display tabs and trailing spaces
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅

set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default

set wrap        "dont wrap lines
set linebreak   "wrap lines at convenient points

set directory=~/.vim/swapfiles/

"default indent settings
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set formatoptions-=o "dont continue comments when pushing o/O

"vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

set completeopt-=preview
set lazyredraw "buffer screen updates
set cul "highlight current line
" Don't wrap lines
set nowrap
" Keep the cursor in the same place when switching buffers
set nostartofline

" Spell check
set spelllang=en
" Where it should get the dictionary files
let g:spellfile_URL = 'http://ftp.vim.org/vim/runtime/spell'

" Eliminate delay when switching modes
set ttimeoutlen=0

set background=dark
set hidden "hide buffers when not displayed
set ignorecase
set smartcase
set noshowmode
" Enable mouse with tmux
set mouse=a

" Start scrolling before cursor gets to the edge
set scrolloff=3
set sidescrolloff=15
set sidescroll=1

" key repeat delay
set timeoutlen=1000 ttimeoutlen=0
set clipboard=unnamed
set clipboard+=unnamedplus
set path=.,,..,../..,./*,./*/*,../*

"undo settings
set undodir=~/.vim/undofiles
set undofile
set colorcolumn=+1 "mark the ideal max text width


if $TERM == "xterm-256color"
    set t_Co=256
endif


"load ftplugins and indent files
filetype plugin on
filetype indent on

colorscheme gruvbox
syntax on "turn on syntax highlighting



" Key mappings
" ------------------------------------------------------------------------------

"change the mapleader from \ to ,
let mapleader = ","

" Remap annoying mistakes to something useful
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Qa q
cnoreabbrev Qall qall


" save file
nnoremap  <leader>s w
noremap <leader>s :update<CR>
noremap <leader>S :wa<CR>
" Delete line but preserve the space
nnoremap dD S<Esc>

" Automatically jump to end of pasted text
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" Split
noremap <silent><leader>x :split<cr>
noremap <silent><leader>v :vsplit<cr>

vnoremap <C-c> "*y

" Copy to clipboard
vnoremap  <leader>y  "*y
nnoremap  <leader>Y  "*yg_
nnoremap  <leader>y  "*y
nnoremap  <leader>yy  "*yy

" Paste from clipboard
nnoremap <leader>p "*p
nnoremap <leader>P "*P
vnoremap <leader>p "*p
vnoremap <leader>P "*P

" make wrapped lines more intuitive
noremap <silent> k gk
noremap <silent> j gj
noremap <silent> 0 g0
noremap <silent> $ g$

" Spellcheck
nnoremap <F6> :setlocal spell!<cr>

" Allow sourcing of vimrc
nnoremap <leader>y :source $MYVIMRC<cr>

"explorer mappings
nnoremap <f1> :BufExplorer<cr>
nnoremap <f2> :NERDTreeToggle<cr>
nnoremap <f3> :TagbarToggle<cr>
nnoremap <f4> :NERDTreeFind<cr>
"nnoremap <f5> :e %:h<cr>
"nnoremap <c-p> :CtrlP<cr>
"nnoremap <c-f> :CtrlPBuffer<cr>
nnoremap <c-f> :Buffers<cr>
nnoremap <c-p> :Files<cr>

"make <leader>l clear the highlight as well as redraw
nnoremap <leader>l :nohls<CR><C-L>

"make Y consistent with C and D
nnoremap Y y$


"tmux-vim-navigator setup
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <m-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <m-j> :TmuxNavigateDown<cr>
nnoremap <silent> <m-k> :TmuxNavigateUp<cr>
nnoremap <silent> <m-l> :TmuxNavigateRight<cr>
nnoremap <silent> <m-w> :TmuxNavigatePrevious<cr>


" Switch buffer
map <leader>n :bn<cr>
map <leader>p :bp<cr>
"map <C-K> :bnext<CR>
"map <C-J> :bprev<CR>
"map <C-L> :tabn<CR>
"map <C-H> :tabp<CR>
" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

"move between windows
map <C-j> <c-w>j
map <C-k> <c-w>k
map <C-l> <c-w>l
map <C-h> <c-w>h

"search selected text in visual mode
vnoremap // y/<C-R>"<CR>

"silent make command
nnoremap <Leader>m :wa <Bar> :Make -j4<CR>

"ycm maps
nnoremap <Leader>i :YcmCompleter GoToInclude<CR> nnoremap <Leader>d :YcmCompleter GoToDefinition<CR>

"remove trailing whitespaces
nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" close buffer without window
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

" resize current buffer by +/- 5
nnoremap <leader><left> :vertical resize -5<cr>
nnoremap <leader><down> :resize +5<cr>
nnoremap <leader><up> :resize -5<cr>
nnoremap <leader><right> :vertical resize +5<cr>

" replace selected text in visual mode
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

"paste in new line
nnoremap <leader>p :pu<CR>


map <Leader>t :call atags#generate()<cr>





" Plugin config
" ------------------------------------------------------------------------------
if s:has_plugin('bufexplorer')
    let g:bufExplorerDisableDefaultKeyMapping = 1
    let g:bufExplorerShowNoName = 1
    nnoremap <leader>b :BufExplorer<cr>
endif

if s:has_plugin('vim-javascript')
    let g:javascript_plugin_flow=1
    let g:javascript_plugin_jsdoc=1
endif

if s:has_plugin('vim-grepper')
    nnoremap <leader>g :Grepper -tool ag<cr>
    nnoremap <leader>G :Grepper -tool ag -buffers<cr>
    nmap gs <plug>(GrepperOperator)
    xmap gs <plug>(GrepperOperator)
    let g:grepper = {}
    let g:grepper.stop = 2500
    let g:grepper.highlight = 1
end

if s:has_plugin('vim-better-whitespace')
    highlight ExtraWhitespace ctermbg=red guibg = #e06c75
endif

if s:has_plugin('vim-polyglot')
    let g:polyglot_disabled = ['markdown', 'scss']
    let g:vue_disable_pre_processors = 1
    let g:jsx_ext_required = 0
endif

if s:has_plugin('ale')
    let g:ale_sign_error = 'x'
    let g:ale_sign_warning = '~'
    let airline#extensions#ale#error_symbol = ''
    let airline#extensions#ale#warning_symbol = ''
    let g:ale_echo_msg_format = '%linter% | %s (%code%)'
    "let g:ale_lint_on_text_changed = 'always'
    let g:ale_linters = {'html': [], 'cucumber': [], 'typescript': ['tslint']}
    " Fix JavaScript code with ESlint
    "let g:ale_fixers = {}
    "let g:ale_fixers.javascript = ['eslint']
    "let g:ale_fix_on_save = 1
    nmap ]e <Plug>(ale_next)
    nmap [e <Plug>(ale_previous)
endif

if s:has_plugin('vim-closetag')
    let g:closetag_filenames = "*.html,*.js,*.jsx"
    let g:closetag_close_shortcut = ''
endif

if s:has_plugin('mileszs/ack.vim')
    if executable('ag')
        let g:ackprg = 'ag --vimgrep'
        let g:ack_qhandler = "botright copen 40"
    endif
endif



    let g:airline_theme='base16'
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#fnamemod = ':t'
    let g:airline_powerline_fonts = 1

    "statusline setup
    set statusline =%#identifier#
    set statusline+=[%f]    "tail of the filename
    set statusline+=%*
    set statusline+=%y      "filetype
    "read only flag
    set statusline+=%#identifier#
    set statusline+=%r
    set statusline+=%*
    "modified flag
    set statusline+=%#warningmsg#
    set statusline+=%m
    set statusline+=%*
    "set statusline+=%{fugitive#statusline()}
    "display a warning if &et is wrong, or we have mixed-indenting
    set statusline+=%#error#
    set statusline+=%*
    set statusline+=%{StatuslineLongLineWarning()}
    set statusline+=%#warningmsg#
    "set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    "display a warning if &paste is set
    set statusline+=%#error#
    set statusline+=%{&paste?'[paste]':''}
    set statusline+=%*

    set statusline+=%=      "left/right separator
    set statusline+=%c,     "cursor column
    set statusline+=%l/%L   "cursor line/total lines
    set statusline+=\%P    "percent through file
    "set laststatus=2

if s:has_plugin('fzf.vim')
    let g:fzf_colors =
                \ { 'fg':      ['fg', 'Normal'],
                \ 'bg':      ['bg', 'Normal'],
                \ 'hl':      ['fg', 'Boolean'],
                \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
                \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
                \ 'hl+':     ['fg', 'Statement'],
                \ 'info':    ['fg', 'PreProc'],
                \ 'border':  ['fg', 'Ignore'],
                \ 'prompt':  ['fg', 'Conditional'],
                \ 'pointer': ['fg', 'Exception'],
                \ 'marker':  ['fg', 'Keyword'],
                \ 'spinner': ['fg', 'Label'],
                \ 'header':  ['fg', 'Comment'] }
endif

if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor
    " Use ag with ack.vim - https://github.com/ggreer/the_silver_searcher#vim
    let g:ackprg = 'ag --smart-case --nogroup --nocolor --column'
endif

if s:has_plugin('scrooloose/nerdtree')
    let g:NERDTreeMouseMode = 2
    let g:NERDTreeWinSize = 40
    let g:NERDTreeMinimalUI=1
endif


"if s:has_plugin('Valloric/YouCompleteMe')
    "Disable ycm confirmation
    let g:ycm_confirm_extra_conf = 0
    let g:ycm_enable_diagnostic_signs = 0
    let g:ycm_enable_diagnostic_highlighting = 0
    let g:ycm_always_populate_location_list = 1 "default 0
    let g:ycm_open_loclist_on_ycm_diags = 1 "default 1
    let g:ycm_complete_in_strings = 1 "default 1
    let g:ycm_collect_identifiers_from_tags_files = 0 "default 0
    let g:ycm_server_use_vim_stdout = 0 "default 0 (logging to console)
    let g:ycm_server_log_level = 'info' "default info
    let g:ycm_autoclose_preview_window_after_completion = 1
    let g:ycm_autoclose_preview_window_after_insertion = 1
    let g:ycm_show_diagnostics_ui = 0

    let g:cpp_class_scope_highlight = 1
    let g:cpp_member_variable_highlight = 1
    let g:cpp_class_decl_highlight = 1

"endif
