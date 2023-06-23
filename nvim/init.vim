set nocompatible
set number
set ignorecase
set mouse=a
set hidden
set hlsearch
set clipboard=unnamed,unnamedplus
set incsearch
set expandtab
set autoindent
set splitright
set splitbelow
set nobackup
set nowritebackup
set pumheight=10 
set pumblend=20
set spell
set showcmd
set showmode
set updatetime=300
set spelllang=en,tr
set spellsuggest=best,9
set wildmode=longest,list
set termguicolors
highlight Search ctermfg=0
let g:python3_host_prog="/sbin/python3"
filetype plugin indent on
filetype plugin on
set cursorline
set shortmess+=c "remove warnings
let mapleader=";"
let maplocalleader = ","
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.config/nvim/plugged')

" Declare the list of plugins.
Plug 'morhetz/gruvbox'
Plug 'jalvesaq/Nvim-R'
Plug 'arcticicestudio/nord-vim'
Plug 'ncm2/ncm2'
Plug 'gaalcaras/ncm-R'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'godlygeek/tabular'
Plug 'jalvesaq/zotcite'
Plug 'preservim/vim-markdown'
Plug 'roxma/nvim-yarp'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug '907th/vim-auto-save'
Plug 'lervag/vimtex'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-startify'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'ryanoasis/vim-devicons'
"Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
" List ends here. Plugins become visible to Vim after this call.

call plug#end()

let g:NERDTreeWinSize=20
"let g:gruvbox_termcolors=16
let g:airline_theme='transparent'
let g:airline_powerline_fonts=1
let g:rout_follow_colorscheme = 1
let g:Rout_more_colors = 1
let R_objbr_place = 'console,right'
let R_rmdchunk = '``'
"let R_assign_map = '->'
let R_csv_app = 'terminal:vd'
let R_rconsole_width = 67
let R_min_editor_width = 15
let r_objbr_place = 'right'
"set background=dark
let g:nord_underline = 1
let g:nord_cursor_line_number_background = 1
colorscheme tokyonight
let R_auto_start = 2
let g:auto_save_silent = 1 "do not display auto-save notification
let g:auto_save=1 "TextChanged" 
let g:auto_save_events = ["TextChangedI"]
let g:float_preview#docked = 1
"let R_app = "radian"
let R_cmd = "R"
let R_hl_term = 0
let R_args = []  " if you had set any
let R_bracketed_paste = 1
let zotcite_filetypes = ['markdown','pandoc', 'rmd', 'text']
"
nmap <leader>e :CocCommand explorer<CR>
noremap  <C-w>v <esc>:vnew<cr>

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

"python's plugin keymaps

autocmd FileType r inoremap <buffer> > <Esc>:normal! a %>%<CR>a 
autocmd FileType rnoweb inoremap <buffer> > <Esc>:normal! a %>%<CR>a 
autocmd FileType rmd inoremap <buffer> > <Esc>:normal! a %>%<CR>a 
autocmd TermOpen * setlocal nonumber
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif 
autocmd FileType text source /home/samtrek/.config/nvim/plugged/zotcite/after/syntax/markdown.vim
autocmd CursorHold * silent call CocActionAsync('highlight')

au TermClose * call feedkeys("i")
 
nmap <esc><esc> :noh<return>


" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
