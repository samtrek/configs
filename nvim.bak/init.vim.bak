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
call plug#begin('/home/samtrek/.config/nvim/plugged')

" Declare the list of plugins.
Plug 'morhetz/gruvbox'
Plug 'jalvesaq/Nvim-R'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'arcticicestudio/nord-vim'
Plug 'ncm2/ncm2'
Plug 'gaalcaras/ncm-R'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'godlygeek/tabular'
Plug 'jalvesaq/zotcite'
Plug 'epwalsh/obsidian.nvim'
Plug 'roxma/nvim-yarp'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug '907th/vim-auto-save'
Plug 'lervag/vimtex'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-startify'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'onsails/lspkind.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'jalvesaq/cmp-nvim-r'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
" List ends here. Plugins become visible to Vim after this call.

call plug#end()

let g:NERDTreeWinSize=20
"let g:gruvbox_termcolors=16
let g:airline_theme='transparent'
let g:airline_powerline_fonts=1
let g:rout_follow_colorscheme = 1
"let g:Rout_more_colors = 1
let R_objbr_place = 'console,right'
"let R_rmdchunk = '``'
"let R_assign_map = '->'
let R_csv_app = 'terminal:vd'
let R_rconsole_width = 67
let R_min_editor_width = 15
let r_objbr_place = 'right'
"set background=dark
let g:nord_underline = 1
let g:nord_cursor_line_number_background = 1
colorscheme tokyonight
let g:auto_save_silent = 1 "do not display auto-save notification
let g:auto_save=1 "TextChanged" 
let g:auto_save_events = ["TextChangedI"]
let g:float_preview#docked = 1
"let R_app = "radian"
"let R_external_term = 'term.sh -a R -T R --login-shell --log-level warning'
let R_auto_start = 2
let R_cmd = "R"
"let R_hl_term = 0
let R_args = []  " if you had set any
let R_bracketed_paste = 1
let zotcite_filetypes = ['markdown','pandoc', 'rmd', 'text']

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
lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require'cmp'
  local lspkind = require('lspkind')

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    formatting = {
        fields = {'abbr', 'kind', 'menu'},
        format = lspkind.cmp_format({
            mode = 'symbol', -- show only symbol annotations
            maxwidth = 50, -- prevent the popup from showing more than provided characters
            ellipsis_char = '...', -- the truncated part when popup menu exceed maxwidth
            before = function(entry, item)
                local menu_icon = {
                    nvim_lsp = '',
                    vsnip = '',
                    path = '',
                    cmp_zotcite = 'z',
                    cmp_nvim_r = 'R'
                }
                item.menu = menu_icon[entry.source.name]
                return item
            end,
        })
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
    --  { name = 'cmp_nvim_r', option = {filetypes = {'r', 'rmd', 'quarto'}}}
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.

 -- tree-sitter configs
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "r" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF
