return {

	{
		'christoomey/vim-tmux-navigator',
		-- event = 'VimEnter',
		keys = {'<M-h>', '<M-j>', '<M-k>', '<M-l>'},
		config = function ()
			vim.g.tmux_navigator_no_mappings = 1  -- don't open at start
			vim.keymap.set('n', '<M-h>', ':TmuxNavigateLeft<cr>')
			vim.keymap.set('n', '<M-j>', ':TmuxNavigateDown<cr>')
			vim.keymap.set('n', '<M-k>', ':TmuxNavigateUp<cr>')
			vim.keymap.set('n', '<M-l>', ':TmuxNavigateRight<cr>')
			vim.keymap.set('i', '<M-h>', '<Esc>:TmuxNavigateLeft<cr>')
			vim.keymap.set('i', '<M-j>', '<Esc>:TmuxNavigateDown<cr>')
			vim.keymap.set('i', '<M-k>', '<Esc>:TmuxNavigateUp<cr>')
			vim.keymap.set('i', '<M-l>', '<Esc>:TmuxNavigateRight<cr>')
		end
	},

	{
		'nvim-telescope/telescope.nvim',
		-- event = 'VimEnter',
		keys = {
			{'<leader><leader>/', '<cmd>Telescope current_buffer_fuzzy_find<CR>'},
			{'<leader>k', '<cmd>Telescope find_files<CR>'},
		},
		cmd = 'Telescope',
		dependencies = {
			'nvim-lua/plenary.nvim',
			-- 'nvim-treesitter/nvim-treesitter',  -- TODO: this plugin should have its own section
			'nvim-tree/nvim-web-devicons',
		    'nvim-telescope/telescope-ui-select.nvim',
			{ -- If encountering errors, see telescope-fzf-native README for installation instructions
				'nvim-telescope/telescope-fzf-native.nvim',
				-- `build` is used to run some command when the plugin is installed/updated.
				-- This is only run then, not every time Neovim starts up.
				build = 'make',
				-- `cond` is a condition used to determine whether this plugin should be
				-- installed and loaded.
				cond = function()
					return vim.fn.executable 'make' == 1
				end,
			},
		},
		config = function()
			-- TODO: I don't know if this fzy works or if it matters when i uncomment this
			-- require('telescope').load_extension('fzy_native')
			-- extensions = {
			-- 	fzy_native = {
			-- 		override_generic_sorter = false,
			-- 		override_file_sorter = true,
			-- 	}
			-- }
			-- Enable Telescope extensions if they are installed
			require('telescope').load_extension('fzf')
			require('telescope').load_extension('ui-select')
		end
	},

	{
		'smoka7/hop.nvim',
		-- opts = { keys = 'etovxqpdygfblzhckisuranjmwx' },  -- these keys can come up as hints, i set all 26 alphabets
		-- event = 'VimEnter',
		event = 'CursorMoved',
		keys = {},
		opts = {},
		config = function()
			require('hop').setup()
			vim.keymap.set('n', '<leader>f', ':HopWord<CR>')
		end
	},

	{
		"declancm/cinnamon.nvim",
		-- event = 'VimEnter',
		event = 'CursorMoved',
		opts = {
			-- Enable all provided keymaps
			keymaps = {
				basic = true,
				extra = true,
			},
			-- Only scroll the window
			options = { delay = 2 },
		},
	},

	{
        'jakewvincent/mkdnflow.nvim',
        config = function()
			require('mkdnflow').setup({
				perspective = {
					priority = 'root',
					root_tell = 'index.md',
					fallback = 'first',
				},
				modules = { cmp = true },  -- the default  is fase :(
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
        end,  -- end of the config = function()
		ft = { 'markdown' },
    },

	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function() vim.fn["mkdp#util#install"]() end,
	}

}
