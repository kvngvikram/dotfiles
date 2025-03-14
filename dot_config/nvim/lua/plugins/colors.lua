return {

	{
		'norcalli/nvim-colorizer.lua',
		config = function ()
			vim.opt.termguicolors = true
			require('colorizer').setup()
		end
	},

	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		opts = {
			-- My main concern was to make sure that vertical splits can be differentiated
			-- options = {
			-- 	-- theme = "auto"  -- suggested in material.nvim
			-- 	-- theme = 'codedark',
			-- 	-- theme = 'material',
			-- 	-- theme = 'ayu_dark',
			-- 	-- theme = 'vscode',
			-- 	-- theme = 'powerline_dark'
			-- 	-- theme = 'ayu', -- given by neovim-ayu plugin, but it has to be initialised
			-- },
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
							return require('nvim-navic').get_location()
						end,
						cond = function()
							return require('nvim-navic').is_available()
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
	},

	{
		'Mofiqul/vscode.nvim',
		-- 'folke/tokyonight.nvim'
	},

}
