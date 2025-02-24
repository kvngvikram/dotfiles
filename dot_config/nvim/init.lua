-- Install packer.nvim  It will grab packer from the Internet and install it for you if it doesn't exist
--local install_path = '~/.config/nvim/site/pack/packer/start/packer.nvim'
local install_path = '~/.local/share/nvim/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.execute('!git clone --depth 1 https://github.com/wbthomason/packer.nvim ' .. install_path)
end


local use = require('packer').use
require('packer').startup(function()
	use 'wbthomason/packer.nvim' -- Package manager itself.

	use 'tpope/vim-commentary' -- Use "gc" to comment lines in visual mode. Similarly to cmd+/ in other editors.


	use {
		-- 'williamboman/nvim-lsp-installer',
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'neovim/nvim-lspconfig',
	}


	use {
	    'L3MON4D3/LuaSnip',  -- keep it before nvim-cmp for nvim-cmp to show luasnip entries
	    'saadparwaiz1/cmp_luasnip',

		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
		'hrsh7th/cmp-emoji',
		'hrsh7th/nvim-cmp'
	}

	use 'jpalardy/vim-slime'
	use 'christoomey/vim-tmux-navigator'

	use 'vim-scripts/SyntaxRange'

	use 'nvim-tree/nvim-tree.lua'

	-- use 'vim-airline/vim-airline'  -- Install this: https://github.com/powerline/fonts
	-- use 'vim-airline/vim-airline-themes'
	use 'nvim-lualine/lualine.nvim'

	-- color schemes
	use 'tomasiser/vim-code-dark'
	use 'Mofiqul/vscode.nvim'
	use 'Shatur/neovim-ayu'
	use 'marko-cerovac/material.nvim'

	use 'nvim-tree/nvim-web-devicons'
	use 'SmiteshP/nvim-navic'

	use 'norcalli/nvim-colorizer.lua'

	use 'lewis6991/gitsigns.nvim'

	use 'lervag/vimtex'

	use 'rhysd/vim-grammarous'

	use 'phaazon/hop.nvim'

	use 'declancm/cinnamon.nvim'

	use {
		'nvim-treesitter/nvim-treesitter',
		-- run = ':TSUpdate'
	}


	use {
		'nvim-telescope/telescope.nvim',
		-- 'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }


	-- for zettelekasten
	-- use {
	-- 	'renerocksai/telekasten.nvim',
	-- 	requires = {'nvim-telescope/telescope.nvim'}
	-- }
	use 'https://github.com/mattn/calendar-vim'
	use 'https://github.com/nvim-telescope/telescope-media-files.nvim'
	use { "nvim-telescope/telescope-bibtex.nvim",
		requires = {
			{'nvim-telescope/telescope.nvim'},
		},
		config = function ()
			require"telescope".load_extension("bibtex")
		end,
	}

	-- install without yarn or npm
	use({
		"iamcco/markdown-preview.nvim",
		run = function() vim.fn["mkdp#util#install"]() end,
	})

	-- use 'https://github.com/mzlogin/vim-markdown-toc'

	use({
		"ziontee113/icon-picker.nvim",
		config = function()
		require("icon-picker").setup({
			disable_legacy_commands = true
		})
		end,
	})

	use 'jakewvincent/mkdnflow.nvim'

	use 'jbyuki/nabla.nvim'  -- for ASCII preview of latex equations

	-- use 'edluffy/hologram.nvim'  -- this is the original
	use 'giusgad/hologram.nvim'  -- this is a fork
end)
-----------------------------------------------------------------------------------------------------------------------

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.swapfile = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.autochdir = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.cursorline = true
vim.opt.spellfile = '/home/happy/.config/nvim/spell/en.utf-8.add'  -- don't give ~/ for home

vim.opt.signcolumn = 'auto:2'

vim.opt.background = 'dark'

vim.g.mapleader = " "  -- mapping space as leader

local function vim_opt_toggle(opt, val_1, val_2, name)  -- toggle between the two values
	local message = name
	if vim.opt[opt]:get() == val_2 then
		vim.opt[opt] = val_1
		message = message .. " Enabled"
	else
		vim.opt[opt] = val_2
		message = message .. " Disabled"
	end
	vim.notify(message)
end

vim.keymap.set('i', 'kj', '<Esc>:w<CR>')
vim.keymap.set('n', '<leader><leader>', ':w<CR>')

vim.keymap.set('n', '<leader>o', 'mzo<Esc>`z')
vim.keymap.set('n', '<leader>O', 'mzO<Esc>`z')

vim.keymap.set('n', '<leader>sp', function() vim_opt_toggle("spell", true, false, "Spell checks") end)
vim.keymap.set('n', '<Leader>sn', ':tabnew ~/.config/nvim/snippets/<CR>')

vim.keymap.set('n', '<leader>w', function() vim_opt_toggle("wrap", true, false, "Line warping") end)
vim.keymap.set('n', '<leader>,', ':tabnew ~/.config/nvim/init.lua<CR>')
vim.keymap.set('n', '<leader>/', ':noh<CR>')

-- change split sizes
vim.keymap.set('n', '<C-h>', '<C-w><')
vim.keymap.set('n', '<C-j>', '<C-w>+')
vim.keymap.set('n', '<C-k>', '<C-w>-')
vim.keymap.set('n', '<C-l>', '<C-w>>')

-- Map j,k so that it will move DOWN,UP line by line for long wrapped lines.
-- Also Mapping for navigation using relative numbers when lines are wrapped
-- Refer: https://vi.stackexchange.com/a/16944
vim.cmd('nnoremap <expr> j v:count == 0 ? "gj" : "<Esc>".v:count."j"')
vim.cmd('nnoremap <expr> k v:count == 0 ? "gk" : "<Esc>".v:count."k"')

-- Visual search
vim.cmd [[
vnoremap // "zy/\V<C-R>=escape(@z,'/\')<CR><CR>
]]
-- for '\V' refer :help /\V

vim.cmd('autocmd BufLeave,BufWinLeave * silent! mkview')
vim.cmd('autocmd BufReadPost * silent! loadview')

-- for neovide !!
if vim.g.neovide then
	vim.opt.guifont = "Hasklug Nerd Font"
	-- vim.opt.neovide_cursor_animate_command_line = false
end


--------------------------------------------------------------------------------- plugin based
-- vim-tmux-navigator
vim.g.tmux_navigator_no_mappings = 1  -- don't open at start
vim.keymap.set('n', '<M-h>', ':TmuxNavigateLeft<cr>')
vim.keymap.set('n', '<M-j>', ':TmuxNavigateDown<cr>')
vim.keymap.set('n', '<M-k>', ':TmuxNavigateUp<cr>')
vim.keymap.set('n', '<M-l>', ':TmuxNavigateRight<cr>')
vim.keymap.set('i', '<M-h>', '<Esc>:TmuxNavigateLeft<cr>')
vim.keymap.set('i', '<M-j>', '<Esc>:TmuxNavigateDown<cr>')
vim.keymap.set('i', '<M-k>', '<Esc>:TmuxNavigateUp<cr>')
vim.keymap.set('i', '<M-l>', '<Esc>:TmuxNavigateRight<cr>')

-- cinnamon.nvim
require("cinnamon").setup {
    -- Enable all provided keymaps
    keymaps = {
        basic = true,
        extra = true,
    },
    -- Only scroll the window
    options = { delay = 2},
}

-- gitsigns
require('gitsigns').setup({
	preview_config = {
		-- border = 'none'
	},
	on_attach = function(bufnr)
		vim.keymap.set({'n', 'v'}, '[g', ':Gitsigns prev_hunk<CR><Esc>:Gitsigns preview_hunk<CR>')
		vim.keymap.set({'n', 'v'}, ']g', ':Gitsigns next_hunk<CR><Esc>:Gitsigns preview_hunk<CR>')
		vim.keymap.set('n', '<Leader>g', ':Gitsigns preview_hunk<CR>')
vim.keymap.set('n', '<Leader>f', ':HopWord<CR>')
	end
})


-- nvim-treesitter
require'nvim-treesitter.configs'.setup {
	-- A list of parser names, or "all" (the five listed parsers should always be installed)
	-- Comment ensure_installed if no internet
	-- ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "bibtex", "latex",
                         -- "fortran", "python", "julia", "bash",},
	highlight = true,
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn", -- set to `false` to disable one of the mappings
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
}
vim.cmd('set foldmethod=expr')
vim.cmd('set foldexpr=nvim_treesitter#foldexpr()')
vim.cmd('set nofoldenable')


-- nabla.nvim
vim.keymap.set('n', '<Leader>l', ':lua require("nabla").popup()<CR>')

-- markdown-preview.nvim
vim.cmd('let g:mkdp_auto_close = 0')


-- -- hologram.nvim
-- require('hologram').setup{
--     auto_display = true -- WIP automatic markdown image display, may be prone to breaking
-- }

-- vim-slime
vim.g.slime_no_mappings = 1
vim.g.slime_target = "tmux"
vim.opt.shell = "/bin/sh"  -- set the default shell since fish is very slow
-- vim.g.slime_paste_file = "~/.temp_vim-slime_paste.delete_please"
vim.cmd('let g:slime_default_config = {"socket_name": "default", "target_pane": ":.1"}') -- check github page for this
vim.g.slime_dont_ask_default = 1

-- hop.nvim
require('hop').setup()
vim.keymap.set('n', '<Leader>f', ':HopWord<CR>')

-- nvim-tree
vim.g.loaded_netrw = 1  -- don't open at start
vim.g.loaded_netwPlugin = 1
require('nvim-tree').setup()
vim.keymap.set('n', '<Leader>t', ':NvimTreeToggle<cr>')

-- telescope
require('telescope').setup {
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		}
	}
}
require('telescope').load_extension('fzf')
vim.keymap.set('n', '<Leader><Leader>/', ':Telescope current_buffer_fuzzy_find<CR>')


-- LuaSnip
vim.cmd [[
imap <silent><expr> <C-j> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<C-j>'

inoremap <silent> <C-k> <cmd>lua require'luasnip'.jump(-1)<CR>

snoremap <silent> <C-j> <cmd>lua require('luasnip').jump(1)<CR>
snoremap <silent> <C-k> <cmd>lua require('luasnip').jump(-1)<CR>

imap <silent><expr> <C-l> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-l>'
smap <silent><expr> <C-l> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-l>'
]]

require('luasnip').config.set_config({
	store_selection_keys = '<C-l>',
})



-- Markdown flow
require('mkdnflow').setup({
	perspective = {
		priority = 'root',
		root_tell = 'index.md',
		fallback = 'first',
	},
	modules = { cmp = true },
	links = {
		conceal = true,
		transform_explicit = function(text)
			text = text:gsub(" ", "_")  -- no spaces, use underscores
			-- text = text:lower()
			-- text = os.date('%Y-%m-%d_')..text
			if text:match('%d%d[-]%d%d[-]%d%d%d%d') then  -- the - character is tricky
				return('dairy/'..text)
			elseif text:match('mpr') then  -- the - character is tricky
				return('dairy/mpr/'..text)
			elseif text:match('cite_%S+') then
				return('citation/'..text)
			elseif text:match('todo_%S+') then
				return('todo/'..text)
			elseif text:match('min_%S+') then
				return('mineral/'..text)
			elseif text:match('book_%S+') then
				return('book/'..text)
			else
				return(text)
			end
		end,
	},
	to_do = {
		symbols = { ' ', '-', 'X' },
	},
	mappings = {
		MkdnEnter = {{'n', 'v', 'i'}, '<CR>'},
		MkdnTab = false,
		MkdnSTab = false,
		MkdnNextLink = {'n', '<Tab>'},
		MkdnPrevLink = {'n', '<S-Tab>'},
		MkdnNextHeading = {'n', ']]'},
		MkdnPrevHeading = {'n', '[['},
		MkdnGoBack = {'n', '<BS>'},
		MkdnGoForward = {'n', '<Del>'},
		MkdnFollowLink = false, -- see MkdnEnter
		MkdnCreateLink = false, -- see MkdnEnter
		MkdnCreateLinkFromClipboard = {{'n', 'v'}, '<leader>p'}, -- see MkdnEnter
		MkdnDestroyLink = {'n', '<M-CR>'},
		MkdnMoveSource = {'n', '<F2>'},
		MkdnYankAnchorLink = {'n', 'ya'},
		MkdnYankFileAnchorLink = {'n', 'yfa'},
		MkdnIncreaseHeading = {'n', '+'},
		MkdnDecreaseHeading = {'n', '-'},
		MkdnToggleToDo = {{'n', 'v'}, '<C-Space>'},
		MkdnNewListItem = false,
		MkdnNewListItemBelowInsert = {'n', 'o'},
		MkdnNewListItemAboveInsert = {'n', 'O'},
		MkdnExtendList = false,
		MkdnUpdateNumbering = {'n', '<leader>nn'},
		MkdnTableNextCell = {'i', '<Tab>'},
		MkdnTablePrevCell = {'i', '<S-Tab>'},
		MkdnTableNextRow = false,
		MkdnTablePrevRow = {'i', '<M-CR>'},
		MkdnTableNewRowBelow = {'n', '<leader>ir'},
		MkdnTableNewRowAbove = {'n', '<leader>iR'},
		MkdnTableNewColAfter = {'n', '<leader>ic'},
		MkdnTableNewColBefore = {'n', '<leader>iC'},
		MkdnFoldSection = {'n', 'zc'},
		MkdnUnfoldSection = {'n', 'zo'}
	}
})
vim.api.nvim_create_autocmd("FileType", {pattern = "markdown", command = "set awa"})
-- Telescope find files in notebook
-- got idea from https://stackoverflow.com/a/73290052
vim.keymap.set('n', '<Leader>k', function()
	if vim.o.filetype == 'markdown' then
		local root_dir = require('mkdnflow').root_dir
		if root_dir then  -- if the dir is not nil
			return ':Telescope find_files search_dirs={"'..root_dir..'"}<CR>'
		end
	end
end, {expr = true, replace_keycodes = true})


--------------------------------------------------------------------------------- appearence and colors, select between codedark and vscode.nvim and change in lualine
--------------------------------------------------- codedark with manual
-- vim.cmd('colorscheme codedark')  -- vim-code-dark plugin provides this codedark

-- nvim-colorizer
vim.opt.termguicolors = true
require('colorizer').setup()


-- -- ayu colorshheme
-- local colors = require('ayu.colors')
-- colors.generate(...)  -- pass 'true' to enable mirage
-- require('ayu').setup({
-- 	mirage = false,
-- 	overrides = {  -- refer to neovim-ayu/lua/ayu/colors.lua
-- 		LspReferenceText = { fg = colors.white},
-- 		Folded = { fg = colors.regexp },
-- 		-- LineNr = { fg = colors.fg },
-- 		LineNr = { fg = colors.ui },
-- 		-- LineNr = { fg = colors.tag },
-- 		-- LineNr = { fg = colors.constant },
-- 		-- LineNr = { fg = colors.special },
-- 		-- CursorLine = { bg = colors.selection_inactive },
-- 		CursorLine = { bg = colors.guide_normal },
-- 		-- CursorLine = { bg = colors.line },
-- 		Visual = { bg = colors.selection_bg },
-- 		-- Comment = { fg = colors.comment },
-- 		Comment = { fg = colors.fg_idle },
-- 		-- Comment = { fg = colors.ui },
-- 	}
-- })
-- require('ayu').colorscheme()


-- nvim-navic
local navic = require("nvim-navic")
navic.setup{highlight=true}



-- vscode.nvim
local colors = require('vscode.colors').get_colors()
require('vscode').setup({
	transparent = false,
})
vim.cmd "colorscheme vscode"

-- lualine
-- local colors = require("material.colors")
-- require('ayu').colorscheme()
require('lualine').setup {
	-- My main concern was to make sure that vertical splits can be differentiated
	options = {
		-- theme = "auto"  -- suggested in material.nvim
		-- theme = 'codedark',
		-- theme = 'material',
		-- theme = 'ayu_dark',
		theme = 'vscode',
		-- theme = 'powerline_dark'

		-- theme = 'ayu', -- given by neovim-ayu plugin, but it has to be initialised
	},
	sections = {
		lualine_b = {  -- TODO: this should work by default but diagnostic symbols/fonts have some issue and not showing
			'branch',
			{'diagnostics', symbols = {error = ' ', warn = ' ', info = ' ', hint = ''} },
			'diff'
		},
		lualine_c = {
			{'filename'},
			{
				function()
					return navic.get_location()
				end,
				cond = function()
					return navic.is_available()
				end
			}

		},
	},
	tabline = {
		lualine_a = {
			{  -- doing all the default stuff manually to have tab numbers
			'tabs',
			max_length = vim.o.columns,
			mode = 2,
			fmt = function(name, context)
				-- Show + if buffer is modified in tab
				local buflist = vim.fn.tabpagebuflist(context.tabnr)
				local winnr = vim.fn.tabpagewinnr(context.tabnr)
				local bufnr = buflist[winnr]
				local mod = vim.fn.getbufvar(bufnr, '&mod')

				return name .. (mod == 1 and ' ●' or '')
			end
			},
		},
		lualine_z = {'tabs'},
	},
	inactive_sections = {  -- this is set to have distinsion with splits
		lualine_a = {},
		lualine_b = {'branch', 'diff',  -- TODO: should not be required to explicitly give these symbols, which should be default
		             {'diagnostics', symbols = {error = ' ', warn = ' ', info = ' ', hint = ''} } },
		lualine_c = { 'filename', },
		-- lualine_x = {'encoding', 'fileformat', 'filetype'},
		lualine_x = {{
			'filetype',
			-- fmt = function(text) return string.rep("═", 500)..'  '..text end,
		}},
		-- lualine_y = {'progress'},
		-- lualine_z = {'location'}
		lualine_y = {{'progress', color = {gui = 'bold'}}},
		lualine_z = {{'location', color = {gui = 'bold'}}},
		-- lualine_y = {{'progress', color = {fg = colors.bg, bg = colors.entity, gui = 'bold'}}},
		-- lualine_z = {{'location', color = {fg = colors.bg, bg = colors.entity, gui = 'bold'}}}
	},
}


-- -- material.nvim colorscheme
-- require('material').setup({
-- 	plugins = {
-- 		"hop",
-- 		"gitsigns",
-- 		"neorg",
-- 		"nvim-cmp",
-- 		"nvim-navic",
-- 		"nvim-tree",
-- 		"nvim-webpu-devicons",
-- 		"telescope",
-- 	},
-- 	-- lualine_style = "stealth",
-- 	high_visibility = { darker=true },
-- 	custom_highlights = { Folded = { fg = colors.main.cyan, bold = true} },
-- })
-- -- vim.g.material_style = "material-darker"
-- vim.cmd "colorscheme material-darker"


-- for lsp hover, diagnostics is at the keymap later
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
	vim.lsp.handlers.hover, {
		-- Use a sharp border with `FloatBorder` highlights
		border = "double"
	}
)

vim.diagnostic.config({  -- other stuff configered later with same function
	float={border = "rounded"}
})

---------------------------------------------------------------------------------LSP and cmp
-- use :Mason to check the available servers
-- and use LspInstall, LspUnsinstall etc to install them. And add then to the servers list below
require("mason").setup()
require("mason-lspconfig").setup()


local on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true }

	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)

	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>n', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)

	vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)


	vim.diagnostic.config({  -- borders config seperately
		virtual_text = false,
		update_in_insert = true,
		severity_sort=true,
	})

	--set up diagnostic symbols on the left of numbers
	local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end

	--show diagnostic message while hovering
	-- You will likely want to reduce updatetime which affects CursorHold
	-- note: this setting is global and should be set only once
	vim.opt.updatetime = 2000
	vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]


	-----  highlight references
	-- Along with CursorMoved and CursorMovedI, CursorHold and CursorHoldI are also present
	if client.server_capabilities.documentHighlightProvider then  -- check if the server has this feature
		vim.api.nvim_create_augroup('lsp_document_highlight', {})
		vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI'}, {
			group = 'lsp_document_highlight',
			buffer = 0,
			callback = vim.lsp.buf.document_highlight,
		})
		vim.api.nvim_create_autocmd({'CursorMoved', 'CursorMovedI'}, {
			group = 'lsp_document_highlight',
			buffer = 0,
			callback = vim.lsp.buf.clear_references,
		})
	end

	-- sets up navic with lsp
	if client.server_capabilities.documentSymbolProvider then
		navic.attach(client, bufnr)
	end
end


-- pylsp , jedi_language_server , lua_ls and ltex configuration is seperately written again below
-- local servers = {'pylsp', 'jedi_language_server', 'ltex', 'lua_ls', 'arduino_language_server', 'bashls', 'clangd', 'fortls', 'julials', 'golangci_lint_ls', 'html', 'rust_analyzer'}
local servers = {'pylsp', 'jedi_language_server', 'ltex', 'lua_ls', 'arduino_language_server', 'bashls', 'clangd', 'fortls', 'julials', 'html'}
require('mason-lspconfig').setup({ ensure_installed = servers, automatic_installation = true })
for _, lsp in ipairs(servers) do
	require('lspconfig')[lsp].setup {
		on_attach = on_attach,
	}
end

-- just for lua because init.lua has undefined 'vim' warning which is annoying
require'lspconfig'.lua_ls.setup { on_attach = on_attach, settings = { Lua = { diagnostics = { globals = { 'vim' } } } } }


-- for ltex LSP dictionary is added to update spellings at startup
-- check reddit.com/r/neovim/comments/s24zvh/how_can_i_load_a_user_dictionary_inot_ltexls/
local dictionary_path = vim.fn.stdpath("config") .. "/spell/en.utf-8.add"
local words = {}
for word in io.open(dictionary_path, "r"):lines() do
	table.insert(words, word)
end

require'lspconfig'.ltex.setup {
	on_attach = on_attach,
	-- settings = { ltex = { dictionary = { ['en-US'] = words } } },
	settings = { ltex = {
		dictionary = { ['en-US'] = words },
		language = "en-US",
	} },
	filetypes = { "markdown", "text", "tex", "rtf", "mail" },   -- added email file type for thunderbird
}

-- only for python LSP
-- so using jedi just for documentHighlightProvider and pylsp for the rest because pylsp is better by slow with documentHighlightProvider
-- diagnostics had to be disabled in a different way
-- check https://www.reddit.com/r/neovim/comments/yv4t5o/why_doesnt_any_python_lsp_work_for_me/
require('lspconfig').jedi_language_server.setup {
	on_attach = function(client, bufnr)
					client.server_capabilities.codeActionProvider = false
					client.server_capabilities.completionProvider = false
					client.server_capabilities.resolveProvider = false
					client.server_capabilities.definitionProvider = false

					client.server_capabilities.documentHighlightProvider = true
					client.server_capabilities.renameProvider = false

					client.server_capabilities.documentSymbolProvider = false
					client.server_capabilities.executeCommandProvider = false
					client.server_capabilities.hoverProvider = false
					client.server_capabilities.referencesProvider = false
					client.server_capabilities.signatureHelpProvider = false
					-- client.server_capabilities.textDocumentSync = false
					client.server_capabilities.typeDefinitionProvider = false
					client.server_capabilities.workspace = false
					client.server_capabilities.workspaceProvider = false
					client.server_capabilities.workspaceSymbolProvider = false

					on_attach(client, bufnr)

				end,
	handlers = {
		["textDocument/publishDiagnostics"] =  function(...)
			return nil
		end
	}
}


-- pylsp but disable the documentHighlightProvider
require('lspconfig').pylsp.setup {
	on_attach = function(client, bufnr)
					client.server_capabilities.documentHighlightProvider = false
					-- client.server_capabilities.renameProvider = false
					on_attach(client, bufnr)
				end
}


-- setting up nvim-cmp
-- symbols to use in completion menu
local kind_icons = { Text = "", Method = "", Function = "",
	Constructor = "", Field = "", Variable = "", Class = "ﴯ", Interface = "",
	Module = "", Property = "ﰠ", Unit = "", Value = "", Enum = "",
	Keyword = "", Snippet = "", Color = "", File = "", Reference = "",
	Folder = "", EnumMember = "", Constant = "", Struct = "", Event = "",
	Operator = "", TypeParameter = ""
}


local cmp = require("cmp")
local luasnip = require("luasnip")

 -- function to be used for tab completion to check if tab should trigger completion or insert tab
local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line -1, line, true)[1]:sub(col, col):match('%s') == nil
end

cmp.setup({  -- generic setup

    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },

	-- mappings for insert mode completion
	mapping = cmp.mapping.preset.insert({

		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),

		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),


	-- different sources from which completion menu is populated
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'buffer' },
		{ name = 'path' },
		{ name = 'emoji' },
		{ name = 'mkdnflow' },
	}),


	-- How the entries in the completion menu are formatted
	formatting = {
		format = function(entry, vim_item)
			-- Kind icons
			vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
			-- Show some identifier from which source an entry came from
			vim_item.menu = ({
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				luasnip = "[LuaSnip]",
				nvim_lua = "[Lua]",
				latex_symbols = "[LaTeX]",
				mkdnflow = "[MkdnFlow]",
			})[entry.source.name]
			return vim_item
		end
	},

	window = { documentation = cmp.config.window.bordered() },
})

-- Setting up cmp with settings different than the generic default ones for particular cases

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {  -- for filetype called gitcommit
	sources = cmp.config.sources({
		{ name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
		{ name = 'buffer' },
	})
})

cmp.setup.cmdline('/', {  -- for searchs only use contents in buffer
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

cmp.setup.cmdline(':', {  -- for cmdline both file/folders and cmdline stuff
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' },
		{ name = 'cmdline'},
	})
})



----------------------------------------------------------------File type functions

-- Python function
Slime_Tmux_Py_commands = function()

	vim.opt.foldmethod = 'indent'
	vim.opt.foldlevel = 1
	vim.opt.foldcolumn='2'

	vim.cmd('let g:slime_cell_delimiter = "# --"')

	vim.cmd('let g:slime_default_config = {"socket_name": "default", "target_pane": ":.1"}')
	vim.cmd('let g:slime_python_ipython = 1')

	vim.cmd [[
	nnoremap <Leader>^ :!tmux split-window -d -h -p 45 <CR><CR>
				\:execute 'SlimeSend1 ipython --matplotlib=qt'<CR>
				\:execute 'SlimeSend1 cd ' getcwd()<CR>
	]]
				-- \:SlimeSend1 clear<CR>
	-- Instead of execute SlimeSend0 can also be used as:- :SlimeSend0 'cd '.getcwd()<CR>
	-- But I don't know how to send an <Enter>

	-- TODO can we use <C-O> instead of marking with z?
	-- But that will mess up the jump lists
	vim.keymap.set('n', '<CR>', 'V<Plug>SlimeRegionSendj')
	vim.keymap.set('v', '<CR>', '<Plug>SlimeRegionSendj')
	vim.keymap.set('n', '<leader><CR>', 'mzVgg<Plug>SlimeRegionSend`zzz')
	vim.keymap.set('n', '<Leader>r', 'mzggVG<Plug>SlimeRegionSend`zzz')
	vim.keymap.set('n', '<A-CR>', 'mzviw<Plug>SlimeRegionSend`z')
	vim.keymap.set('n', '<Leader>p', '<Plug>SlimeSendCell')

	vim.opt.colorcolumn = '80'
end

vim.cmd('autocmd BufReadPost,BufNewFile *.py, lua Slime_Tmux_Py_commands()')

-- Shell function
Slime_Tmux_Shell_commands = function()


	vim.cmd('let g:slime_default_config = {"socket_name": "default", "target_pane": ":.1"}')

	vim.cmd [[
	nnoremap <Leader>^ :!tmux split-window -d -h -p 45 <CR><CR>
				\:execute 'SlimeSend1 cd ' getcwd()<CR>
				\:SlimeSend1 clear<CR>
	]]
	-- Instead of execute SlimeSend0 can also be used as:- :SlimeSend0 'cd '.getcwd()<CR>
	-- But I don't know how to send an <Enter>

	-- TODO can we use <C-O> instead of marking with z?
	vim.keymap.set('n', '<CR>', 'V<Plug>SlimeRegionSendj')
	vim.keymap.set('v', '<CR>', '<Plug>SlimeRegionSendj')
	vim.keymap.set('n', '<leader><CR>', 'mzVgg<Plug>SlimeRegionSend`zzz')
	vim.keymap.set('n', '<Leader>r', 'mzggVG<Plug>SlimeRegionSend`zzz')
	vim.keymap.set('n', '<A-CR>', 'mzviw"zy:SlimeSend1 echo $<C-r>"<CR>')

end

vim.cmd('autocmd BufReadPost,BufNewFile *.sh, lua Slime_Tmux_Shell_commands()')


Text_type_commands = function()
	vim.opt.linebreak = true
	vim.opt.wrap = true
	-- vim.opt.spell = true

	-- hop.nvim mappings
	vim.keymap.set('n', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
	vim.keymap.set('n', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
	vim.keymap.set('n', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>", {})
	vim.keymap.set('n', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>", {})

	-- nabla.nvim
	require('nabla').enable_virt({autogen = true})
end

vim.cmd('autocmd BufReadPost,BufNewFile *.txt, lua Text_type_commands()')
vim.cmd('autocmd BufReadPost,BufNewFile *.tex, lua Text_type_commands()')
vim.cmd('autocmd BufReadPost,BufNewFile *.md, lua Text_type_commands()')
vim.cmd('autocmd BufReadPost,BufNewFile *.eml, lua Text_type_commands()')
vim.cmd('autocmd BufReadPost,BufNewFile *.rtf, lua Text_type_commands()')


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SNIPPETS
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- functions required by snippets
date = function() return {os.date('%d-%m-%Y')} end


local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep


ls.add_snippets(nil, {
	---------------- all files
	all = {
		-- s({
		-- 	trig="date",
		-- 	name="date",
		-- 	dscr="add date in dd-mm-yyyy format"
		-- },
		-- fmt([[
		-- date: {}
		-- ]],
		-- {f(date, {})}
		-- ))
	},

})

-- files here will have the names s, i as defined here
require('luasnip.loaders.from_lua').load({paths = "~/.config/nvim/snippets"})
