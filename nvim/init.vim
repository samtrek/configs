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
Plug 'tpope/vim-surround'
Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }
Plug 'dccsillag/magma-nvim', { 'do': ':UpdateRemotePlugins' }
Plug '907th/vim-auto-save'
Plug 'lervag/vimtex'
Plug 'tpope/vim-fugitive'
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

noremap  <C-w>v <esc>:vnew<cr>
nmap <space>e <Cmd>CocCommand explorer<CR>

nmap <Leader>f [fzf-p]
xmap <Leader>f [fzf-p]

"fzf key may have to delete it later on if I cannot find use for it
nnoremap <silent> [fzf-p]p     :<C-u>CocCommand fzf-preview.FromResources project_mru git<CR>
nnoremap <silent> [fzf-p]gs    :<C-u>CocCommand fzf-preview.GitStatus<CR>
nnoremap <silent> [fzf-p]ga    :<C-u>CocCommand fzf-preview.GitActions<CR>
nnoremap <silent> [fzf-p]b     :<C-u>CocCommand fzf-preview.Buffers<CR>
nnoremap <silent> [fzf-p]B     :<C-u>CocCommand fzf-preview.AllBuffers<CR>
nnoremap <silent> [fzf-p]o     :<C-u>CocCommand fzf-preview.FromResources buffer project_mru<CR>
nnoremap <silent> [fzf-p]<C-o> :<C-u>CocCommand fzf-preview.Jumps<CR>
nnoremap <silent> [fzf-p]g;    :<C-u>CocCommand fzf-preview.Changes<CR>
nnoremap <silent> [fzf-p]/     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>
nnoremap <silent> [fzf-p]*     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
nnoremap          [fzf-p]gr    :<C-u>CocCommand fzf-preview.ProjectGrep<Space>
xnoremap          [fzf-p]gr    "sy:CocCommand   fzf-preview.ProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"
nnoremap <silent> [fzf-p]t     :<C-u>CocCommand fzf-preview.BufferTags<CR>
nnoremap <silent> [fzf-p]q     :<C-u>CocCommand fzf-preview.QuickFix<CR>
nnoremap <silent> [fzf-p]l     :<C-u>CocCommand fzf-preview.LocationList<CR>

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
nmap <esc><esc> :noh<return>

" use tab for snipptes completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
