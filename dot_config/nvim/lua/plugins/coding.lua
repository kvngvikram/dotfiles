return {

	{
		'numToStr/Comment.nvim',
		keys = 'g',
		opts = {},
	},

	{
		'nvim-treesitter/nvim-treesitter',
		branch = 'main',
		build = ':TSUpdate',
		main = 'nvim-treesitter.config',
		opts = {
			-- A list of parser names, or 'all' (the five listed parsers should always be installed)
			-- Comment ensure_installed if no internet
			ensure_installed = { 'fortran', 'python', 'julia', 'bash', 'matlab', 'c',
				'lua', 'luadoc', 'vim', 'vimdoc', 'query', 'diff', 'typst',
				'markdown', 'markdown_inline' },
			auto_install = true,
			highlight = true,
			incremental_selection = {
				enable = true,
				-- keymaps = {
				-- 	init_selection = 'gnn', -- set to `false` to disable one of the mappings
				-- 	node_incremental = 'grn',
				-- 	scope_incremental = 'grc',
				-- 	node_decremental = 'grm',
				-- },
			},
		},
	},

	{
		'jbyuki/nabla.nvim',
		dependencies = { 'nvim-treesitter/nvim-treesitter', },
		keys = { { '<leader>l', ':lua require("nabla").popup()<CR>' }, }
	},

	{
		'jpalardy/vim-slime',
		config = function()
			vim.g.slime_no_mappings = 1
			vim.g.slime_target = 'tmux'
			vim.opt.shell = '/bin/sh'
			-- vim.g.slime_paste_file = '~/.temp_vim-slime_paste.delete_please'
			vim.cmd('let g:slime_default_config = {"socket_name": "default", "target_pane": ":.1"}') -- check github page for this
			vim.g.slime_dont_ask_default = 1
		end,
		ft = { 'python', 'sh', 'julia' }, -- add more files when required
	},

	{
		'lewis6991/gitsigns.nvim',
		-- event = 'VimEnter',
		-- event = 'UIEnter',
		event = 'CursorHold', -- basically after you open and wait for few seconds of 'updatetime'
		keys = {
			{ '[g', '<cmd>Gitsigns prev_hunk<CR>:Gitsigns preview_hunk_inline<CR>' },
			{ ']g', '<cmd>Gitsigns next_hunk<CR>:Gitsigns preview_hunk_inline<CR>' },
		},
		cmd = 'Gitsigns',
		opts = {},
		-- config = function()
		-- 	require('gitsigns').setup()
		-- 	vim.keymap.set({'n', 'v'}, '[g', ':Gitsigns prev_hunk<CR><Esc>:Gitsigns preview_hunk<CR>')
		-- 	vim.keymap.set({'n', 'v'}, ']g', ':Gitsigns next_hunk<CR><Esc>:Gitsigns preview_hunk<CR>')
		-- 	vim.keymap.set('n', '<Leader>g', ':Gitsigns preview_hunk<CR>')
		-- end
	},

	{
		"lervag/vimtex",
		-- lazy = false,     -- we don't want to lazy load VimTeX
		-- tag = "v2.15", -- uncomment to pin to a specific release
		init = function()
			-- VimTeX configuration goes here, e.g.
			vim.g.vimtex_view_method = "zathura"
		end,
		ft = { 'tex' }, -- add more files when required
	},

	{
		"jalvesaq/zotcite",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-telescope/telescope.nvim",
		},
		ft = { 'tex', 'typst', 'markdown' }, -- add more files when required
		opts = {
			hook = {
				-- When author names have initials, make K.V.N.G. as K. V. N. G.
				bib_ref = function(e) -- e is one bib entry containing info of authors, title ...
					if not e or not e.author then -- no point if there is no author info
						return e
					end

					local authors_tbl = {}      -- containts table for multiple (co)authors
					for _, author_value in ipairs(e.author) do -- for each author
						local new_author_names = {} -- table expecting two entries for last and first name
						for _, name in ipairs(author_value) do
							table.insert(new_author_names,
								(name:gsub("(%.)([A-Z])", "%1 %2")))
						end
						table.insert(authors_tbl, new_author_names)
					end

					e.author = authors_tbl -- overwrite the author information
					return e -- and return everything else as it is
				end,
			},
		},
	},


	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function() vim.fn["mkdp#util#install"]() end,
	},

	{
		'chomosuke/typst-preview.nvim',
		-- lazy = false, -- or ft = 'typst'
		ft = 'typst',
		version = '1.*',
		opts = {}, -- lazy.nvim will implicitly calls `setup {}`
	},
}
