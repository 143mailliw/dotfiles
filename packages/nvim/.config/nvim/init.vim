"
" Plugins
"
" Ensure vim-plug is installed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(stdpath('data') . '/plugged')

" Syntax/Languages
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sleuth'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'

" Functionality
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'gioele/vim-autoswap'

" Look and Feel
Plug 'NLKNguyen/papercolor-theme' 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
Plug 'spinks/vim-leader-guide'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-sensible'

call plug#end()

"
" Look and Feel
"

" vim
set background=dark
set number
set laststatus=2
set hidden

" airline
let g:airline_theme='simple'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" barbar
let bufferline = get(g:, 'bufferline', {})
let bufferline.maximum_padding = 1

"
" Functionality
"

" Setup for coc
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c
set signcolumn=number

" Tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set copyindent

"
" Keybinds
"

" vim
let mapleader = ' '
nnoremap <CR> :noh<CR><CR> 
nmap <leader>fs :up<CR>
nmap <leader>qvo :e $MYVIMRC<CR>
nmap <leader>qvs :source %<CR>
nmap <leader>wc :q<CR>

" coc
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>qf <Plug>(coc-fix-current)

" ctrlp
nmap <leader>fo :CtrlP<CR>
nmap <leader>bs :CtrlPBuffer<CR>

" vim-plug
nmap <leader>qvi :PlugInstall<CR>

" barbar
nnoremap <silent> <C-[> :BufferPrevious<CR>
nnoremap <silent> <C-]> :BufferNext<CR>
nnoremap <silent> <leader>bc :BufferClose<CR>

" nerdtree
nmap <leader>ft :NERDTreeToggle<CR>

" fugitive
nmap <leader>gp :Gpush<CR>
nmap <leader>go :Gpull<CR>
nmap <leader>gs :Gw<CR>
nmap <leader>ga :Git add *<CR>
nmap <leader>gc :Gcommit<CR>

"
" Leader Guide
"
let g:lmap = {}

" quick actions (q)
let g:lmap.q = {'name': 'quick actions'}
let g:lmap.q.f = 'fix current'
let g:lmap.q.v = {'name': 'vim config'}
let g:lmap.q.v.o = 'open vim config'
let g:lmap.q.v.s = 'source current'
let g:lmap.q.v.i = 'install plugins'

" files (f)
let g:lmap.f = {'name': 'files'}
let g:lmap.f.s = 'save file'
let g:lmap.f.o = 'open file'
let g:lmap.f.t = 'toggle tree'

" buffers (b)
let g:lmap.b = {'name': 'buffers'}
let g:lmap.b.s = 'switch buffer'
let g:lmap.b.c = 'close buffer'

" windows (w)
let g:lmap.w = {'name': 'windows'}
let g:lmap.w.c = 'close window'

" git (g)
let g:lmap.g = {'name': 'git'}
let g:lmap.g.p = 'push'
let g:lmap.g.o = 'pull'
let g:lmap.g.s = 'stage current'
let g:lmap.g.a = 'stage all'
let g:lmap.g.c = 'commit'

" setup guide
call leaderGuide#register_prefix_descriptions("<Space>", "g:lmap")
nnoremap <silent> <leader> :<c-u>LeaderGuide '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>LeaderGuideVisual '<Space>'<CR>
