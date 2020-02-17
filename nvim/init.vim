" https://github.com/huyvohcmc/dotfiles

" Faster loading
let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python'
let g:ruby_host_prog = 'rvm system do neovim-ruby-host'

" Plugins will be downloaded under the specified directory
call plug#begin('~/.config/nvim/plugged')
Plug 'justinmk/vim-sneak'
Plug 'itchyny/lightline.vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'mhinz/vim-signify'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'
Plug 'rstacruz/vim-closer'
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tagprefix'
Plug 'ncm2/ncm2-path'
Plug 'roxma/nvim-yarp'
Plug 'morhetz/gruvbox'
Plug 'dylanaraps/wal.vim'
Plug 'dense-analysis/ale'
Plug 'rust-lang/rust.vim'
Plug 'majutsushi/tagbar'
Plug 'ryanoasis/vim-devicons'
Plug 'lervag/vimtex'
Plug 'Yggdroot/indentLine'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'arcticicestudio/nord-vim'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
call plug#end()

" General settings (see :h vim-differences)
filetype plugin indent on
if !exists("termguicolors")
  set termguicolors
endif
set autoindent
set autoread
set clipboard=unnamedplus
set completeopt=noinsert,menuone,noselect
set copyindent
set expandtab
set tabstop=2
set shiftwidth=0 " Always have the same value with `tabstop`
set hidden
set history=500
set incsearch hlsearch ignorecase smartcase
set laststatus=2
set ignorecase smartcase
set lazyredraw
set linebreak
set list listchars=tab:.\ ,trail:.
set mouse=""
set nobackup
set noshowmatch
set noshowmode
set noswapfile
set number relativenumber
set ruler rulerformat=%l\:%c
set rtp+=~/.fzf
set scrolloff=5
set shortmess+=c
set showcmd
set showtabline=1
set smarttab
set tags=./tags;,tags
set title
set wildmenu
set wildmode=list:longest,full
set wrap
set ttimeoutlen=0
set matchpairs+=<:>
set splitright

" Safeguard
if !exists("g:syntax_on")
  syntax enable
endif

" Spell check settings for latex
augroup LatexSpell
  autocmd!
  autocmd FileType latex,tex,md,markdown setlocal spell
  set spelllang=fr,en_gb
  inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
augroup END

" Colorscheme
set bg=dark
colorscheme dracula
" Vim sneak autocmd
let g:sneak#label = 1
let g:sneak#use_ic_scs = 1
let g:sneak#absolute_dir = 1
map f <Plug>Sneak_s
map F <Plug>Sneak_S
map t <Plug>Sneak_t
map T <Plug>Sneak_T

" Leader general mapping
let mapleader = ","
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q!<cr>
nnoremap <leader>r :source ~/.config/nvim/init.vim<cr>
nnoremap <silent><leader><cr> :let @/ = ""<cr>
nnoremap <silent><right> :vertical resize +10<cr>
nnoremap <silent><left> :vertical resize -10<cr>
nnoremap <silent><up> :resize +10<cr>
nnoremap <silent><down> :resize -10<cr>
" Easy navigation
nnoremap <leader>s <c-w>w
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Navigate properly when lines are wrapped
nnoremap j gj
nnoremap k gk

" Use tab to jump between blocks, because it's easier
nnoremap <tab> %
vnoremap <tab> %

" NERDTree mapping and config
noremap <leader>n :NERDTreeToggle<CR>
noremap <leader>c :NERDTreeFind<CR>
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeHighlightCursorline = 0
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeIgnore = ['^\~$[[dir]]', '^\.o$[[file]]', '^\.pyc$[[file]]', '^\.DS_Store$[[file]]']

" FZF mapping
nnoremap <leader>h :History<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>t :Files<CR>

" The silver searcher
noremap <leader>ag <esc>:Ag<space>
noremap <leader>aw <esc>:Ag <c-r><c-w>
noremap <leader>ah <esc>:Ag<up><cr>

" Vim-fugitive and vim-rhubarb
noremap <silent> gb :Gblame<CR>
noremap <silent> ghub :Gbrowse<CR>

" Signify config
let g:signify_vcs_list = [ 'git' ]
let g:signify_realtime = 1
let g:signify_sign_show_count = 0
let g:signify_sign_change = '-'

" Enable ncm2 for all buffers
" autocmd BufEnter * call ncm2#enable_for_buffer()

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" LightLine config
let g:lightline = {}
let g:lightline.colorscheme = 'dracula'
let g:lightline.component_function = {
      \ 'gitbranch': 'fugitive#head',
      \ }
let g:lightline.active = {
      \ 'left': [ [ 'mode', 'paste' ], [ 'gitbranch', 'readonly', 'relativepath', 'modified' ] ],
      \ }

" ALE config
nmap <leader>e <Plug>(ale_fix)
let g:ale_enabled = 0
let g:ale_sign_error = '×'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_set_loclist = 1 
let g:ale_set_quickfix = 1
let g:ale_set_highlights = 1 
let g:ale_completion_enabled = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters = { 'ruby': ['rubocop'], 'javascript': ['eslint', 'prettier'], 'rust': ['rls']}
let g:ale_rust_rls_executable = '/home/fixer/.cargo/bin/rls'
let g:ale_fixers = { 'ruby': ['rubocop'], 'javascript': ['prettier'] }

" Vimtex config
let g:tex_flavor='latex'

let g:tex_flavor = "latex"
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_quickfix_mode = 2
if has('nvim')
    let g:vimtex_compiler_progname = 'nvr'
endif
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
