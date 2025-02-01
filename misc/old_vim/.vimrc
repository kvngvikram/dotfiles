" Things to note: 
"
" If you are using NeoVim instead of Vim then do as following to just use this
" .vimrc script for NeoVim as well.
" Links: 
" https://vi.stackexchange.com/a/15548
" https://neovim.io/doc/user/nvim.html#nvim-from-vim
"
" Reserved Registers:
" z - temporary register
" r - is used for General_Vimux_mapping
"
" Reserved marks:
" z - temporary mark
"
" This configuration assumes that vim is running inside a tmux session (while
" writing this, byobu is used instead of tmux).
" 
" There are mappings to directly open this file in new tab.
" 'kj' is mapped to escape and save the file.
"
" <Enter> or <CR> key is used in mappings assuming that it is not of much use
" in normal and visual mode. For the rest of the mappings a Leader key is used
" which can be changed. 


"""""""""""""""""""""""""""""   vim-plug   """""""""""""""""""""""""""""
"" refer: https://github.com/junegunn/vim-plug
"" vim-plug auto install if not installed 
"if empty(glob('~/.vim/autoload/plug.vim'))
	
"	" !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	
"	" for vim
"	!wget -P ~/.vim/autoload/ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 
"	" for neovim
"	"!wget -P ~/.local/share/nvim/site/autoload/ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 

"	call plug#begin()    " This line not found in the github (presently when writing this)
"	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"endif



"""""""""""""""""""""""""""""    plugins   """""""""""""""""""""""""""""
" For new plugins add them to the list
call plug#begin('~/.vim/plugged')

"Plug 'https://github.com/ycm-core/YouCompleteMe'
" Plug 'https://github.com/ajh17/VimCompletesMe'

"Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Plug 'benmills/vimux'
"Plug 'jupyter-vim/jupyter-vim' 		" refer : https://github.com/jupyter-vim/jupyter-vim
"Plug 'julienr/vim-cellmode'
"Plug 'ivanov/vim-ipython'

Plug 'jpalardy/vim-slime'

Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

Plug 'christoomey/vim-tmux-navigator'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Install this: https://github.com/powerline/fonts

Plug 'vim-scripts/SyntaxRange'

" Plug 'prabirshrestha/async.vim'
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'
" Plug 'prabirshrestha/vim-lsp'
" Plug 'mattn/vim-lsp-settings'
" " for python install : pip install python-language-server
" " for NeoVim install : pip install pynvim

Plug 'neovim/nvim-lspconfig'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For browser only for Neovim above 0.4
" Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

" For indent guides/lines
Plug 'Yggdroot/indentLine'

" A game :
Plug 'vim/killersheep'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

Plug 'lervag/vimtex'

Plug 'rhysd/vim-grammarous'

" Plug 'wellle/context.vim'

" VS Code like color scheme
Plug 'tomasiser/vim-code-dark'

Plug 'ryanoasis/vim-devicons'
" requires fonts https://github.com/ryanoasis/nerd-fonts

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Plug 'vimwiki/vimwiki'

" Plug 'tpope/vim-fugitive'
" Plug 'airblade/vim-gitgutter'
Plug 'lewis6991/gitsigns.nvim'

Plug 'phaazon/hop.nvim'

Plug 'declancm/cinnamon.nvim'  " For smooth scrolling

" my plugins
Plug 'kvngvikram/rightclick-macros'
" Plug 'kvngvikram/uss-mouse.vim'

Plug 'JuliaEditorSupport/julia-vim'

call plug#end()
" To install new plugins enter this command once vim in opened 
" :PlugInstal


"""""""""""""""""""""""""""""   general    """""""""""""""""""""""""""""
"let mapleader = ","
let mapleader = "\<Space>"

" This is to have a bash like autocomplete
"set completeopt=menu,longest
" set completeopt+=menu,longest

""""""""""""""""""""""""""""" YCM
"let g:ycm_autoclose_preview_window_after_insertion = 1

"""""""""""""""""""""""""""""" vim-lsp, asynccomplete
""" For colors check the colors-section
"let g:lsp_semantic_enabled = 1
"let g:lsp_preview_float = 1  " details of aurguments in a floating popup
"let g:lsp_diagnostics_enabled = 1   " Checking the code for errors
"let g:lsp_diagnostics_echo_cursor = 1  " Display error below at :command line
"let g:lsp_signs_enabled = 1   " Signs on the left of line numbers
"let g:lsp_textprop_enabled = 0  " highlighting of parts of code with problems
"let g:lsp_highlights_enabled = 0   " only for neovim 0.3+
"let g:lsp_virtual_text_enabled = 0 " only for neovim 0.3+ additional text next to problems
"let g:asyncomplete_auto_popup = 1
"let g:lsp_highlight_references_enabled = 1
"" let g:lsp_preview_float = 1
"function! s:check_back_space() abort
"	    let col = col('.') - 1
"		return !col || getline('.')[col - 1]  =~ '\s'
"endfunction
"inoremap <silent><expr> <TAB>
"  \ pumvisible() ? "\<C-n>" :
"  \ <SID>check_back_space() ? "\<TAB>" :
"  \ asyncomplete#force_refresh()
""inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
""autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
""autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"" Check for the mappings section where <Esc> action in insert mode is mapped


"""""""""""""""""""""""""""""" nvim-lsp and nvim-cmp
set completeopt=menu,menuone,noselect
lua << EOF
local on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true }
	
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)

	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>n', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>p', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)

	vim.diagnostic.config({virtual_text = false, update_in_insert = true, severity_sort=true})
	-- vim.diagnostic.config({virtual_text = false, update_in_insert = true , underline= false})
	-- vim.diagnostic.config({virtual_text = false})

	--set up diagnostic symbols
	local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end

	--show diagnostic message while hovering
	-- You will likely want to reduce updatetime which affects CursorHold
	-- note: this setting is global and should be set only once
	vim.o.updatetime = 250
	vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]


	if client.resolved_capabilities.document_highlight then
		vim.cmd [[
			hi! LspReferenceRead cterm=bold ctermbg=237 ctermfg=230
			hi! LspReferenceText cterm=bold ctermbg=237 ctermfg=230
			hi! LspReferenceWrite cterm=bold ctermbg=237 ctermfg=230
		]]
		vim.api.nvim_create_augroup('lsp_document_highlight', {})
		-- vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
		-- vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
		vim.api.nvim_create_autocmd({ 'CursorMoved'}, {
			group = 'lsp_document_highlight',
			buffer = 0,
			callback = vim.lsp.buf.document_highlight,
		})
		vim.api.nvim_create_autocmd('CursorMoved', {
			group = 'lsp_document_highlight',
			buffer = 0,
			callback = vim.lsp.buf.clear_references,
		})
	end

end

local kind_icons = { Text = "", Method = "", Function = "",
  Constructor = "", Field = "", Variable = "", Class = "ﴯ", Interface = "",
  Module = "", Property = "ﰠ", Unit = "", Value = "", Enum = "",
  Keyword = "", Snippet = "", Color = "", File = "", Reference = "",
  Folder = "", EnumMember = "", Constant = "", Struct = "", Event = "",
  Operator = "", TypeParameter = ""
}


-- Set up nvim-cmp
local cmp = require'cmp'

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line -1, line, true)[1]:sub(col, col):match('%s') == nil
end

cmp.setup({
    mapping = cmp.mapping.preset.insert({
	
		['<Tab>'] = function(fallback)
			if not cmp.select_next_item() then
				if vim.bo.buftype ~= 'prompt' and has_words_before() then
					cmp.complete()
				else
					fallback()
				end
			end
		end,

		['<S-Tab>'] = function(fallback)
			if not cmp.select_prev_item() then
				if vim.bo.buftype ~= 'prompt' and has_words_before() then
					cmp.complete()
				else
					fallback()
				end
			end
		end,

		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		-- { name = 'vsnip' }, -- For vsnip users.
		-- { name = 'luasnip' }, -- For luasnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
    }, {
		{ name = 'buffer' },
    }, {
		{ name = 'path' },
    }),

	formatting = {
		format = function(entry, vim_item)
			-- Kind icons
			vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
			-- Source
			vim_item.menu = ({
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				luasnip = "[LuaSnip]",
				nvim_lua = "[Lua]",
				latex_symbols = "[LaTeX]",
			})[entry.source.name]
			return vim_item
		end
	},

})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = 'buffer' },
	})
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
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
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')['jedi_language_server'].setup {
require('lspconfig')['pylsp'].setup {
	on_attach = on_attach,
	capabilities = capabilities
}

-- local servers = { 'pylsp', }
-- for _, lsp in ipairs(servers) do
-- 	require('lspconfig')[lsp].setup {
-- 		on_attach = on_attach,
-- 	}
-- end

EOF


""""""""""""""""""""""""""""" vim-lsp, gitsigns.nvim or lsp
set signcolumn=yes

""""""""""""""""""""""""""""" gitsigns.nvim
" lua require('gitsigns').setup()

""""""""""""""""""""""""""""" hop.nvim  more hop mapping in tex and text file functions 
lua require('hop').setup()
nnoremap <Leader>f :HopWord<CR>

""""""""""""""""""""""""""""" cinnamon for smooth scrolling
lua require('cinnamon').setup { extra_keymaps = true , extended_keymaps = true , default_delay = 2}

""""""""""""""""""""""""""""" Telescope
nnoremap <Leader>tk :Telescope keymaps<CR>
nnoremap <Leader>tl :Telescope live_grep<CR>
nnoremap <Leader>t/ :Telescope current_buffer_fuzzy_find<CR>


""""""""""""""""""""""""""""" cellmode
let g:cellmode_default_mappings='0'

""""""""""""""""""""""""""""" vim-devicons
set encoding=UTF-8

""""""""""""""""""""""""""""" slime
let g:slime_no_mappings = 1
let g:slime_target = "tmux"
let g:slime_paste_file = "/tmp/tmp_vim-slime_paste"
let g:slime_default_config = {"socket_name": "default", "target_pane": ":.1"} " check github page for this
let g:slime_dont_ask_default = 1

""""""""""""""""""""""""""""" jupyter-vim
let g:jupyter_mapkeys='0'

""""""""""""""""""""""""""""" NERDTree-tabs
nnoremap <Leader>t :NERDTreeTabsToggle<CR>

""""""""""""""""""""""""""""" vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1
nnoremap <M-h> :TmuxNavigateLeft<cr>
nnoremap <M-j> :TmuxNavigateDown<cr>
nnoremap <M-k> :TmuxNavigateUp<cr>
nnoremap <M-l> :TmuxNavigateRight<cr>


""""""""""""""""""""""""""""" vimwiki
" let g:vimwiki_list = [{'path': '~/vimwiki/',
" 			\ 'syntax': 'markdown',
" 			\ 'ext': '.md',
" 			\ 'custom_wiki2html': 'vimwiki_markdown',
" 			\ 'path_html': '~/vimwiki/site_html/'}]
" nmap <Leader>wj <Plug>VimwikiSplitLink<C-w>J
" nmap <Leader>wl <Plug>VimwikiVSplitLink<C-w>L
" nmap <Leader><CR> <Plug>VimwikiTabnewLink


""""""""""""""""""""""""""""" SyntaxRange
" For python in .sh scripts
autocmd BufReadPost,BufNewFile *.sh, :call SyntaxRange#Include('#python_begin','#python_end','python','NonText')
" For awk in .sh scripts
autocmd BufReadPost,BufNewFile *.sh, :call SyntaxRange#Include('#awk_begin','#awk_end','awk','NonText')

""""""""""""""""""""""""""""" vim-airline
"" For colors check the colors-section
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

""""""""""""""""""""""""""""" indentLine
"let g:indentLine_setColors = 0
"let g:indentLine_color_term = 239
let g:indentLine_char = '│'
let g:indentLine_enabled = 1
"let g:indentLine_concealcursor = 'inc'
"let g:indentLine_conceallevel = 1

""""""""""""""""""""""""""""" vimtex
let g:vimtex_quickfix_enabled = 1  " for error message default mapping is \le
" let g:vimtex_quickfix_mode = 2  " for error message default mapping is \le
" let g:vimtex_quickfix_autoclose_after_keystrokes = 1
let g:vimtex_view_method = 'zathura'
let g:tex_flavor="latex"

"" dictionary path
"set dictionary+=/usr/share/dict/british-english

set nu rnu
set cursorline
set ruler

" always show statusline
set laststatus=1
"set statusline=\ %F\ »\ %h%m%r\ %y%=\ %n\ »\ %-10.(%l,%c%V%)\ →\ %P

"set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
"set expandtab


" ignorecase and smartcase while searching
set ignorecase
set smartcase

let fortran_free_source=1
let fortran_do_enddo=1
filetype plugin on 
"filetype plugin indent on 
"set autoindent
"set smartindent

" Echo commands as they are being entered
set showcmd

syntax on
set background=dark
"color slate

" Disable beeping
set noerrorbells
" flash the screen for bell
"set visualbell 

" while searching jump to match
set incsearch
set hlsearch

" change the current working directory whenever you open a file, switch,delete buffer or open/close a window
set autochdir

" " completion in command mode for vim (defalut enabled in neovim)
" set wildmenu

" foldmethod as defualt
set foldmethod=manual

" Remember foldings, cursor positions etc
autocmd BufLeave,BufWinLeave * silent! mkview
autocmd BufReadPost * silent! loadview


" Give first line of fold as fold name
set foldtext=getline(v:foldstart)
" set foldtext=foldtext()

" use default system clipboard for copy-pasting
" this will enable copy paste to and from vim using d, y and p
" set clipboard=unnamedplus

" set mouse support on
" features: visual select, cursor position, scrolling
set mouse=a
" go to insert mode at location of mouse click
" nnoremap <LeftMouse> <LeftMouse>i
" copy with ctrl+c in visual mode. Mouse can be used to visual select.
vnoremap <C-c> y
" cut same as copy
vnoremap <C-x> d
" Backspace will also work as cut
vnoremap <BS> d
" paste at curser line (not box). Mouse click can take cursor to that location
inoremap <C-v> <C-o>P
" Also <C-v> is used to type literal characters, so now use <C-l> instead
inoremap <C-l> <C-v>
" save file
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>


" color column
set colorcolumn=80

"""""""""""""""""""""""""""""colors-section"""""""""""""""""""""""""""""
colorscheme codedark
let g:airline_theme='codedark'  " This is airline support from plugin vim-code-dark
highlight ColorColumn ctermbg=236
highlight CursorLine ctermbg=236
highlight Search ctermbg=3 ctermfg=Black
highlight LineNr ctermfg=Yellow
highlight MatchParen ctermbg=Blue ctermfg=LightYellow
highlight Pmenu ctermbg=239 ctermfg=white
" highlight PmenuSel ctermfg=white
" highlight Folded ctermbg=17 ctermfg=159
highlight Folded ctermbg=None ctermfg=159
" ctermbg=DarkBlue
" highlight LineNr ctermfg=LightYellow ctermbg=DarkBlue
" highlight LspWarningHighlight ctermbg=brown
"highlight link LspErrorHighlight Error
"highlight link LspWarningHighlight hl-Ignore
"highlight lspReference ctermfg=lightyellow ctermbg=darkgrey
highlight lspReference ctermfg=LightYellow ctermbg=239

highlight DiagnosticUnderlineError cterm=undercurl
highlight DiagnosticUnderlineWarn cterm=undercurl

"
""""""""""""""""""""""""""""" spell-section"""""""""""""""""""""""""""""
" highlight SpellBad ctermbg=red
highlight SpellBad cterm=undercurl ctermfg=None
" highlight SpellCap ctermbg=DarkBlue
" highlight SpellCap cterm=undercurl ctermfg=LightBlue
highlight SpellCap cterm=undercurl ctermfg=None
highlight SpellLocal cterm=undercurl ctermbg=None
highlight SpellRare cterm=undercurl ctermbg=None
" highlight SpellLocal ctermbg=DarkBlue
" highlight SpellRare ctermbg=DarkBlue

" highlight AcronymNoSpell cterm=italic ctermfg=white
" highlight UrlNoSpell cterm=underline ctermfg=blue
" match AcronymNoSpell '\<\u\+\>'
" match UrlNoSpell '\w\+:\/\/[^[:space:]]\+'
" syn match UrlNoSpell '\w\+:\/\/[^[:space:]]\+' contains=@NoSpell
" syn match AcronymNoSpell '\<\(\u\|\d\)\{2,}s\?\>' contains=@NoSpell
" syn match AcronymNoSpell '\u\+' contains=@NoSpell
"""""""""""""""""""""""""""""   mappings   """""""""""""""""""""""""""""
" mapping Esc key in insert mode and also save the file and just Esc in
" Also mark the location with 'i'
inoremap kj <Esc>:w<CR>

" With closing the preview split
" inoremap kj <Esc>:w<CR>:pclose<CR>
" Without closing the preview split
inoremap KJ <Esc>:w<CR>


vnoremap <Leader><Leader> <Esc><Esc>
nnoremap <Leader><Leader> <Esc>:w<CR><Esc>
" mapping , to showing .vimrc file in normal mode 
nnoremap <Leader>, :tabnew ~/.vimrc<ENTER>

" Map j,k so that it will move DOWN,UP line by line for long wrapped lines.
" Also Mapping for navigation using relative numbers when lines are wrapped
" Refer: https://vi.stackexchange.com/a/16944
nnoremap <expr> j v:count == 0 ? 'gj' : "\<Esc>".v:count.'j'
nnoremap <expr> k v:count == 0 ? 'gk' : "\<Esc>".v:count.'k'

" General_Vimux_mapping
" nnoremap <Leader>r :call VimuxRunCommand(@r)<CR>
nnoremap <Leader>r :!<C-r>r<CR><CR>

" for warpping lines
nnoremap <Leader>w :set wrap!<CR>

" Visual search
vnoremap // "zy/\V<C-R>=escape(@z,'/\')<CR><CR>
" for '\V' refer :help /\V

" removing search highlights
nnoremap <Leader>/ :noh<CR>

" Toggle spell check 
nnoremap <Leader>sp :set spell!<CR>
" Toggle syntax coloring
nnoremap <Leader>sn :if exists("g:syntax_on") <Bar>
		\	syntax off <Bar>
		\else <Bar>
		\	syntax on <Bar>
		\endif <CR><CR>

" backspace in insert mode doesn't work sometimes if this is not done.
set backspace=indent,eol,start         " from: https://vi.stackexchange.com/a/2163

" change split sizes
nnoremap <C-h> <C-w><
nnoremap <C-j> <C-w>+
nnoremap <C-k> <C-w>-
nnoremap <C-l> <C-w>>



"""""""""""""""""""""""""""""   tex_file   """""""""""""""""""""""""""""

let g:tex_conceal=""
function! Tex_file_commands()
	" inoremap <Leader>q <Esc>:w<CR><Esc>:!pdflatex %<CR><CR>
	" nnoremap <Leader>q <Esc>:w<CR><Esc>:!pdflatex %<CR><CR>:!pdflatex %<CR><CR>
	" nnoremap <Leader>r <Esc>:w<CR><Esc>:call VimuxRunCommand("pdflatex ".@%." && bibtex ".@%[0:-5].".aux && pdflatex ".@%." && pdflatex ".@%." && exit")<CR><CR>
	
	" To show the exact text in math mode instead of shoing greek letters
	" let g:tex_conceal=""
	
	" No colorcolumn for .tex files
	set colorcolumn=0

	" Avoind breaking of words at the end of line wrapping 
	set wrap
	set linebreak

	nnoremap <Leader><CR> z=1<ENTER><ENTER> 

	" Jump to next and previous misspelled words
	nnoremap <Leader>n ]s
	nnoremap <Leader>p [s

	" hop.nvim mappings
	lua vim.api.nvim_set_keymap('', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
	lua vim.api.nvim_set_keymap('', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
	lua vim.api.nvim_set_keymap('', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>", {})
	lua vim.api.nvim_set_keymap('', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>", {})

	" Grammer check
	nmap <Leader>g :GrammarousCheck<CR>
	nnoremap <Leader>G :GrammarousReset<CR>
endfunction
autocmd BufReadPost,BufNewFile *.tex, call Tex_file_commands()

"""""""""""""""""""""""""""""  text_file   """""""""""""""""""""""""""""
function! Text_file_commands()
	set linebreak
	set spell
	" replace a word with the first suggestion from dictionary
	nnoremap <Leader><CR> z=1<ENTER><ENTER> 

	" Jump to next and previous misspelled words
	nnoremap <Leader>n ]s
	nnoremap <Leader>p [s

	" hop.nvim mappings
	lua vim.api.nvim_set_keymap('', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
	lua vim.api.nvim_set_keymap('', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
	lua vim.api.nvim_set_keymap('', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>", {})
	lua vim.api.nvim_set_keymap('', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>", {})

	" Grammer check
	nmap <Leader>g :GrammarousCheck<CR>
	nnoremap <Leader>G :GrammarousReset<CR>
endfunction
" execute the following for some particular files
autocmd BufReadPost,BufNewFile *.txt, call Text_file_commands()

"""""""""""""""""""""""""""""   py_file    """""""""""""""""""""""""""""
function! Python_file_commands()
	" The following is for ease of writing py2nb compactable codes.
	nmap <Leader>o o#<Space>\|<Space>
	nmap <Leader>O O#<Space>\|<Space>

	" Change everything after first =
	nmap <Leader>s 0f=C=<Space>

	" Foldmethod as indent for python files
	set foldmethod=indent
	set foldcolumn=2  " # columns before line numbers for folding indicators
	set foldlevel=0  " folds higher than this level will be closed by default
endfunction
" execute the following for some particular files
autocmd BufReadPost,BufNewFile *.py, call Python_file_commands()


"""""""""""""""""""""""""""""    Vimux     """""""""""""""""""""""""""""
" Function that can be called for Vimux
function! Vimux_commands()
	let g:VimuxOrientation = "h" 	" Open a new tmux pane to the right
	let g:VimuxHeight = "40"	" This is percentage

	nnoremap <Leader>^ :call VimuxOpenRunner()<CR>:call VimuxRunCommand("cd ".getcwd())<CR>
	nnoremap <CR> mz0v$h"zy:call VimuxRunCommand(@z)<CR><Esc>`z
	vnoremap <CR> "zy:call VimuxRunCommand(@z)<CR>
	nmap <Leader>i <Esc>:VimuxInterruptRunner<CR>
endfunction


"""""""""""""""""""""""""""""   SlimeTmux  """""""""""""""""""""""""""""
function! Slime_Tmux_commands()
	" check github page for this
	let g:slime_default_config = {"socket_name": "default", "target_pane": ":.1"}

	nnoremap <Leader>^ :!tmux split-window -d -h -p 40<CR><CR>
				\:execute 'SlimeSend1 cd ' getcwd()<CR>
				\:SlimeSend1 clear<CR>
	" Instead of execute SlimeSend0 can also be used as:- :SlimeSend0 'cd '.getcwd()<CR> 
	" But I don't know how to send an <Enter>

	nmap <CR> V<Plug>SlimeRegionSend
	xmap <CR> <Plug>SlimeRegionSend
	nmap <A-CR> viw"zy:execute 'SlimeSend1 echo $' @z<CR>
	nnoremap <Leader>& :SlimeSend1 clear<CR>
endfunction

"autocmd BufReadPost,BufNewFile *.sh, call Vimux_commands()
autocmd BufReadPost,BufNewFile *.sh, call Slime_Tmux_commands()


""""""""""""""""""""""""""""SlimeTmuxFortran""""""""""""""""""""""""""""
function! Slime_Tmux_Fortran_commands()
	" check github page for this
	let g:slime_default_config = {"socket_name": "default", "target_pane": ":.1"}
	nnoremap <Leader>^ :!tmux split-window -d -h -p 40<CR><CR>
				\:execute 'SlimeSend1 cd ' getcwd()<CR>
				\:SlimeSend1 clear<CR>
	" Instead of execute SlimeSend0 can also be used as:- :SlimeSend0 'cd '.getcwd()<CR> 
	" But I don't know how to send an <Enter>

	nnoremap <Leader>r :execute 'SlimeSend1 ' @r<CR>
endfunction
autocmd BufReadPost,BufNewFile *.f*, call Slime_Tmux_Fortran_commands()


""""""""""""""""""""""""""""" Jupyter-vim  """""""""""""""""""""""""""""
function! Jupyter_vim_qtconsole_commands()
	" open jupiter qtconsole and connect to it. Note: no spaces before \
	" qtconsole can be opened with configurations, refer ~/.jupyter/jupyter_qtconsole_config.py
	nnoremap <Leader>^ :!jupyter qtconsole --JupyterWidget.syntax_style="paraiso-dark" --JupyterWidget.font_size=12&<ENTER>
				\:sleep 500m <ENTER>
				\:JupyterConnect<ENTER>
	nmap <CR> V<Plug>JupyterRunVisual
	vmap <CR> <Plug>JupyterRunVisual
	nmap <Leader>& oclear<Esc>V<Plug>JupyterRunVisualddk:w<CR>
	nmap <Leader>qt o%matplotlib<Space>qt<Esc>V<Plug>JupyterRunVisualddk:w<CR>
	nmap <Leader>q :JupyterRunFile<CR>
endfunction


""""""""""""""""""""""""""""" JPy_console  """""""""""""""""""""""""""""
"" Note : this needs both jupyter-vim/jupyter-vim, julienr/vim-cellmode and benmills/vimux
function! Jupyter_vim_console_commands()
	let g:VimuxOrientation = "h" 	" Open a new tmux pane to the right
	let g:VimuxHeight = "40"	" This is percentage

	" open jupiter console and connect to it. Note: no spaces before \
	nnoremap <Leader>^ :call VimuxRunCommand("cd ".getcwd())<CR>
				\:call VimuxRunCommand("jupyter console")<CR>
				\:call VimuxRunCommand("%matplotlib qt")<CR>
				\:sleep 500m<CR>
				\:JupyterConnect<CR>

	"nmap <CR> mzV:JupyterSendRange<CR>:sleep 20m<CR>:call VimuxSendKeys("Enter")<CR>`z
	nnoremap <CR> mz0v$h"zy:call VimuxSendText(@z)<CR>:call VimuxSendKeys("M-Enter")<CR><Esc>`z
	"nmap <CR> V<Plug>JupyterRunVisual:call VimuxSendKeys("Enter")<CR>
	"vmap <Leader><CR> <Plug>JupyterRunVisual:sleep 20m<CR>:call VimuxSendKeys("Enter")<CR>
	vmap <Leader><CR> <Plug>JupyterRunVisual
	vnoremap <CR> "zy:call VimuxSendText(@z)<CR>:call VimuxSendKeys("M-Enter")<CR>
	"vnoremap <CR> "zy:call VimuxSendText(@z)<CR>:call VimuxSendKeys("Enter")<CR>
	"vnoremap <CR> "zy:call VimuxRunCommand(@z)<CR>

	"" Here the Vimux command is not used along with jupyter-vim, because if the time taken to run the cell is high then additional Vimux <Enter> with raise a warning. And if that happens then in ipython each time to enter a line (manually), <Enter> should be pressed 3 times (or Alt+Enter or Ctrl+o should be used).
	"nmap <Leader><CR> mzVgg:JupyterSendRange<CR>`z
	""nmap <Leader>q :JupyterRunFile<CR>
	"nmap <Leader>r :call VimuxRunCommand("%run -i ".getcwd()."/".@%)<CR>:call VimuxSendKeys("C-o")<CR>
	
	" cellmode
	let g:cellmode_default_mappings='0' 	" disable the default mappings
	let g:cellmode_tmux_panenumber='1'

	nnoremap <Leader>r mzggVG:call RunTmuxPythonChunk()<CR>:call VimuxSendKeys("M-Enter")<CR>`z
	nnoremap <Leader><CR> mzVgg:call RunTmuxPythonChunk()<CR>:call VimuxSendKeys("M-Enter")<CR>`zzz
	
	"nmap <Leader>qt o%matplotlib<Space>qt<Esc>V<Plug>JupyterRunVisualddk:w<CR>:call VimuxSendKeys("Enter")<CR>
	nmap <Leader>qt :call VimuxRunCommand("%matplotlib qt")
	nnoremap <Leader>& :call VimuxSendText("clear")<CR>:call VimuxSendKeys("M-Enter")<CR>

endfunction


""""""""""""""""""""""""""""" vim-cellmode """""""""""""""""""""""""""""
let g:cellmode_default_mappings='0' 	" disable the default mappings
let g:cellmode_tmux_panenumber='1'
function! Cellmode_commands()
	vmap <CR> :call RunTmuxPythonChunk()<CR>
	nmap <CR> 0v$h:call RunTmuxPythonChunk()<CR>
endfunction


""""""""""""""""""""""""""""" SlimeVimuxPy """""""""""""""""""""""""""""
function! Slime_Vimux_Py_commands()
	let g:VimuxOrientation = "h" 	" Open a new tmux pane to the right
	let g:VimuxHeight = "40"	" This is percentage
	
	" check github page for this
	let g:slime_default_config = {"socket_name": "default", "target_pane": ":.1"}

	nnoremap <Leader>^ :call VimuxRunCommand("cd ".getcwd())<CR>
				\:call VimuxRunCommand("ipython")<CR>
				\:call VimuxRunCommand("%matplotlib qt")<CR>
	nmap <CR> V<Plug>SlimeRegionSend
	xmap <CR> <Plug>SlimeRegionSend
	nmap <Leader><CR> mzVgg<Plug>SlimeRegionSend`zzz
	nmap <Leader>r mzggVG<Plug>SlimeRegionSend`zzz
	nnoremap <Leader>& :SlimeSend1 clear<CR>
endfunction


""""""""""""""""""""""""""""" SlimeTmuxPy  """""""""""""""""""""""""""""
function! Slime_Tmux_Py_commands()
	
	" check github page for this
	let g:slime_default_config = {"socket_name": "default", "target_pane": ":.1"}
	let g:slime_python_ipython = 1

	nnoremap <Leader>^ :!tmux split-window -d -h -p 45 <CR><CR>
				\:execute 'SlimeSend1 ipython --matplotlib=qt'<CR>
				\:execute 'SlimeSend1 cd ' getcwd()<CR>
				\:SlimeSend1 clear<CR>
	" Instead of execute SlimeSend0 can also be used as:- :SlimeSend0 'cd '.getcwd()<CR> 
	" But I don't know how to send an <Enter>

	nmap <CR> V<Plug>SlimeRegionSendj
	xmap <CR> <Plug>SlimeRegionSend
	nmap <Leader><CR> mzVgg<Plug>SlimeRegionSend`zzz
	nmap <Leader>r mzggVG<Plug>SlimeRegionSend`zzz
	nnoremap <Leader>& :SlimeSend1 clear<CR>
	nmap <A-CR> mzviw<Plug>SlimeRegionSend`z
endfunction

autocmd BufReadPost,BufNewFile *.py, call Slime_Tmux_Py_commands()
"autocmd BufReadPost,BufNewFile *.py, call Slime_Vimux_Py_commands()
"autocmd BufReadPost,BufNewFile *.py, call Cellmode_commands()
"autocmd BufReadPost,BufNewFile *.py, call Vimux_commands()
"autocmd BufReadPost,BufNewFile *.py, call Jupyter_vim_qtconsole_commands()
"autocmd BufReadPost,BufNewFile *.py, call Jupyter_vim_console_commands()


""""""""""""""""""""""""""""" SlimeTmuxPy  """""""""""""""""""""""""""""
function! Ipython_edit()
	
	inoremap kj <Esc><Esc>
	nunmap <Leader><Leader>

endfunction

autocmd BufReadPost,BufNewFile ipython_edit_*.py, call Ipython_edit()


"""""""""""""" Notes for python
" qtconsole was discarded because there was an auto scrolling problem then, so
" it had to be cleared regularly. Also it is not inside the terminal.
"
" only vimux was discarded because it has problem with indents. Eg. an if
" condition with few lines in it cannot be sent (with visual) because there
" will be errors due to indents.
"
" Vimux actually suggests to use vim-cellmode to solve the above problems with
" vimux. But cellmode will always have a line in the beginning of every text
" packet like %load from a /tmpfile. Cellmode saves what ever is supposed to
" be sent to a tmp file and use vimux to send a command saying just load that
" tmpfile. Fine for larger texts but annoying if the text sent is small like
" one line or just a variable name. 
"
" So to solve this vimux and cellmode can be used together. For one liners and
" variable names use vimux and for whole file or large part of file use
" cellmode. But there is a small annoyence with small chunks of codes with
" indents Eg. small if conditions etc. Yet this is a really good setup. 
"
" But the wishes never ends....
"
" Another setup is to use jupyter-vim inside console. This has another
" problem, it doesn't display the changes in the ipython console unless
" someone presses enter in ipython pane. So,, use vimux to send an enter key
" after text is sent by jupyter-vim. Now there is no problem with indents and
" no annoying %load /tempfile lines. And vimux works just fine for one linesrs
" and variable names so use vimux for that. 
" Another issue. If the text sent by jupyter-vim takes longer time to execute
" and vimux sends an enter key before the code execution is finished then
" ipython turns to 'not received is_complete_request mode'. Now ipython will
" always be expecting indents for the following lines. Even for just a
" variable name it expects three enter strokes for three lines expecting if
" condition like indented lines.
" A delay can be added before vimux sends enter but delay that is required
" varies. 
" So, use cellmode again. Use cellmode, vimux setup but for small chunks with
" indents use jupyter-vim. Now all problems seems to be solved. Just this 
" is a bit complicated.
"
" And there comes vim-slime. I found it in reddit. I will work exactly same as
" just vimux for one liners and variable names. And when There is an indent
" block or multiple lines it will take care of that by using %cpaste. So looks
" similar to cellmode but smaller and adds the extra % or magic lines only
" when necessary. Overall slime takes lesser space in ipython.
" But there is a problem. Yeah this never ends :).
" Slime cannot open a new pane/split like vimux. So to open that split I am
" using vimux in the beginning.
" Hey, do you know tmux can be controlled by tmux commands? tmux split-window
" exists. So now I am using :!tmux split-window to open new split instead of 
" Vimux. So, I think we have reached to a good state, where things can be done
" just by one plugin!
"
" One thing to note is I have to use jupyter console or jupyter qtconsole only
" when jupyter-vim is involved. jupyter-vim basically connects to a jupyter
" kernel/server (donno). Just ipython doesn't involve such kernel/server.
" Also jupyter console/qtconsole doesn't have %cpaste so slime may not work
" with jupyter (qt)console.
"""""""""""""" END Notes for python

nnoremap <Leader>ss :source ~/.vimrc<CR>
