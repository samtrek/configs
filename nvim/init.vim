set nocompatible
set number
set ignorecase
set mouse=a
set hidden
set hlsearch
set incsearch
set autoindent
set splitright
set splitbelow
set nobackup
set nowritebackup
set pumheight=10 
set spell
set showcmd
set showmode
set updatetime=300
set spelllang=en,tr
set spellsuggest=best,9
set wildmode=longest,list
set termguicolors
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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dccsillag/magma-nvim', { 'do': ':UpdateRemotePlugins' }
Plug '907th/vim-auto-save'
Plug 'lervag/vimtex'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'

" List ends here. Plugins become visible to Vim after this call.
"
call plug#end()

let g:gruvbotransparent_bg=1
let g:NERDTreeWinSize=20
let g:gruvbox_contrast_dark = "soft"
let g:gruvbox_italic=1
let g:gruvbox_termcolors=16
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts=1
let g:rout_follow_colorscheme = 1
let g:Rout_more_colors = 1
let R_objbr_place = 'console,right'
let R_rmdchunk = '``'
let R_assign_map = '<M-->'
let R_csv_app = 'terminal:vd'
let R_rconsole_width = 67
let R_min_editor_width = 15
let R_objbr_place = 'RIGHT'
set background=dark
colorscheme gruvbox
let R_auto_start = 2
let g:magma_automatically_open_output = v:false
let g:auto_save_silent = 1 "do not display auto-save notification
let g:auto_save=1 "TextChanged" 
let g:auto_save_events = ["TextChangedI"]
let R_app = "radian"
let R_cmd = "R"
let R_hl_term = 0
let R_args = []  " if you had set any
let R_bracketed_paste = 1

noremap  <C-w>v <esc>:vnew<cr>
nmap <space>e <Cmd>CocCommand explorer<CR>


"python's plugin keymaps
nnoremap <silent><expr> <LocalLeader>q  :MagmaEvaluateOperator<CR>
nnoremap <silent>       <LocalLeader>qq :MagmaEvaluateLine<CR>
xnoremap <silent>       <LocalLeader>q  :<C-u>MagmaEvaluateVisual<CR>
nnoremap <silent>       <LocalLeader>qc :MagmaReevaluateCell<CR>
nnoremap <silent>       <LocalLeader>qd :MagmaDelete<CR>
nnoremap <silent>       <LocalLeader>qo :MagmaShowOutput<CR>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

autocmd FileType r inoremap <buffer> > <Esc>:normal! a %>%<CR>a 
autocmd FileType rnoweb inoremap <buffer> > <Esc>:normal! a %>%<CR>a 
autocmd FileType rmd inoremap <buffer> > <Esc>:normal! a %>%<CR>a 
autocmd TermOpen * setlocal nonumber

au TermClose * call feedkeys("i")
 
nmap <esc><esc> :noh<return>

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
