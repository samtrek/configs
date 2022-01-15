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
set spelllang=en,tr
set spellsuggest=best,9
set wildmode=longest,list
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
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }
Plug 'dccsillag/magma-nvim', { 'do': ':UpdateRemotePlugins' }
Plug '907th/vim-auto-save'
Plug 'lervag/vimtex'
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'

" List ends here. Plugins become visible to Vim after this call.
"
call plug#end()

set completeopt=noinsert,menuone,noselect "Ncm2
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
let R_rconsole_width = 52
let R_min_editor_width = 15
let R_objbr_place = 'RIGHT'
set background=dark
colorscheme gruvbox
let R_auto_start = 2
let g:magma_automatically_open_output = v:false
let g:auto_save_silent = 1 "do not display auto-save notification
let g:auto_save=1 "auto save for vim
let g:auto_save_events = ["InsertLeave", "TextChanged"]
set guifont=DroidSansMono\ Nerd\ Font\ 11

" Some scripts to help me use of vim
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
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
nnoremap <silent><expr> <LocalLeader>r  :MagmaEvaluateOperator<CR>
nnoremap <silent>       <LocalLeader>rr :MagmaEvaluateLine<CR>
xnoremap <silent>       <LocalLeader>r  :<C-u>MagmaEvaluateVisual<CR>
nnoremap <silent>       <LocalLeader>rc :MagmaReevaluateCell<CR>
nnoremap <silent>       <LocalLeader>rd :MagmaDelete<CR>
nnoremap <silent>       <LocalLeader>ro :MagmaShowOutput<CR>

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

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" enable ncm2 for all buffers


vmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)
nmap <esc><esc> :noh<return>


