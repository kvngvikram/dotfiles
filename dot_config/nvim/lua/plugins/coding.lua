return {

	{
		'numToStr/Comment.nvim',
		keys = 'g',
		opts = {},
	},

	{
		'nvim-treesitter/nvim-treesitter',
		opts = {
			-- A list of parser names, or 'all' (the five listed parsers should always be installed)
			-- Comment ensure_installed if no internet
			ensure_installed = { 'fortran', 'python', 'julia', 'bash', 'matlab', 'c',
								 'lua', 'luadoc', 'vim', 'vimdoc', 'query', 'diff', 'latex',
								 'markdown', 'markdown_inline'},
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
		keys = { {'<leader>l', ':lua require("nabla").popup()<CR>'}, }
	},

	{
		'jpalardy/vim-slime',
		config = function()
			vim.g.slime_no_mappings = 1
			vim.g.slime_target = 'tmux'
			vim.opt.shell = '/bin/sh'  -- set the default shell since fish is very slow
			-- vim.g.slime_paste_file = '~/.temp_vim-slime_paste.delete_please'
			vim.cmd('let g:slime_default_config = {"socket_name": "default", "target_pane": ":.1"}') -- check github page for this
			vim.g.slime_dont_ask_default = 1
		end,
		ft = { 'python', 'sh' },  -- add more files when required
	},

	{
		'lewis6991/gitsigns.nvim',
		-- event = 'VimEnter',
		-- event = 'UIEnter',
		event = 'CursorHold',  -- basically after you open and wait for few seconds of 'updatetime'
		keys = {
			{'[g', '<cmd>Gitsigns prev_hunk<CR><Esc>:Gitsigns preview_hunk<CR>'},
			{']g', '<cmd>Gitsigns next_hunk<CR><Esc>:Gitsigns preview_hunk<CR>'},
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
		lazy = false,     -- we don't want to lazy load VimTeX
		-- tag = "v2.15", -- uncomment to pin to a specific release
		init = function()
			-- VimTeX configuration goes here, e.g.
			vim.g.vimtex_view_method = "zathura"
		end
	}

}
