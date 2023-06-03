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
set notermguicolors
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
Plug 'arcticicestudio/nord-vim'
Plug 'jalvesaq/Nvim-R'
Plug 'ncm2/ncm2'
Plug 'gaalcaras/ncm-R'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'godlygeek/tabular'
Plug 'jalvesaq/zotcite'
Plug 'preservim/vim-markdown'
Plug 'roxma/nvim-yarp'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dccsillag/magma-nvim', { 'do': ':UpdateRemotePlugins' }
Plug '907th/vim-auto-save'
Plug 'jiangmiao/auto-pairs'
Plug 'lervag/vimtex'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'

" List ends here. Plugins become visible to Vim after this call.
"
call plug#end()

"let g:gruvbotransparent_bg=1
let g:NERDTreeWinSize=20
"let g:gruvbox_contrast_dark = "soft"
"let g:gruvbox_italic=1
"let g:gruvbox_termcolors=16
"let g:airline_theme='nord'
let g:airline_powerline_fonts=1
let g:rout_follow_colorscheme = 1
let g:Rout_more_colors = 1
let R_objbr_place = 'console,right'
let R_rmdchunk = '``'
let R_assign_map = '->'
let R_csv_app = 'terminal:vd'
let R_rconsole_width = 67
let R_min_editor_width = 15
let R_objbr_place = 'RIGHT'
"set background=dark
"colorscheme  default
let R_auto_start = 2
let g:magma_automatically_open_output = v:false
let g:auto_save_silent = 1 "do not display auto-save notification
let g:auto_save=1 "TextChanged" 
let g:auto_save_events = ["TextChangedI"]
let R_app = "radian"
let R_cmd = "R"
let R_hl_term = 0
let R_args = []  " if you had set any
let R_show_args = 1
let R_bracketed_paste = 1
let g:float_preview#docked = 1
let zotcite_filetypes = ['markdown','pandoc', 'rmd', 'text']
"hi! Normal ctermbg=NONE guibg=NONE
"hi! NonText ctermbg=NONE guibg=NONE
"
noremap  <C-w>v <esc>:vnew<cr>


"python's plugin keymaps
nnoremap <silent><expr> <LocalLeader>q  :MagmaEvaluateOperator<CR>
nnoremap <silent>       <LocalLeader>qq :MagmaEvaluateLine<CR>
xnoremap <silent>       <LocalLeader>q  :<C-u>MagmaEvaluateVisual<CR>
nnoremap <silent>       <LocalLeader>qc :MagmaReevaluateCell<CR>
nnoremap <silent>       <LocalLeader>qd :MagmaDelete<CR>
nnoremap <silent>       <LocalLeader>qo :MagmaShowOutput<CR>

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


autocmd FileType r inoremap <buffer> > <Esc>:normal! a %>%<CR>a 
autocmd FileType rnoweb inoremap <buffer> > <Esc>:normal! a %>%<CR>a 
autocmd FileType rmd inoremap <buffer> > <Esc>:normal! a %>%<CR>a 
autocmd TermOpen * setlocal nonumber
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif 
autocmd FileType text source /home/samtrek/.config/nvim/plugged/zotcite/after/syntax/markdown.vim

"Ultisnips config
let g:UltiSnipsExpandTrigger="<tab>"  " use <Tab> to trigger autocompletion
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

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
