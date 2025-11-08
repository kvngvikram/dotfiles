return { -- language support
	{

		'mason-org/mason-lspconfig.nvim', -- takes care of vim.lsp.enable('servername') for all servers
		opts = {},
		dependencies = {
			{ 'mason-org/mason.nvim', opts = {} }, -- The Maxon interface window provider and installer
			'neovim/nvim-lspconfig',      -- Actual native LSP configuration provider
			'SmiteshP/nvim-navic',
		},

		config = function()
			-- Config START

			-- ################################################################
			-- Configure each language server and language specific features
			-- ################################################################

			require('mason-lspconfig').setup {
				-- ensure_installed = {'pylsp', 'luals'}
				ensure_installed = { 'lua_ls', 'pylsp', 'ltex', 'clangd', 'fortls' }
				-- ensure_installed = { 'lua_ls', 'pylsp', 'ltex', 'clangd', 'fortls', 'julials' }
			} -- alternative to lsp.config.enable('servername') but before the config and not after


			-- Refer this to check client capabilities
			-- https://www.reddit.com/r/neovim/comments/13r7yzw/list_server_capabilities/

			-- lua
			vim.lsp.config['lua_ls'] = {
				-- Command and arguments to start the server.
				cmd = { 'lua-language-server' },
				-- Filetypes to automatically attach to.
				filetypes = { 'lua' },
				-- Sets the "workspace" to the directory where any of these files is found.
				-- Files that share a root directory will reuse the LSP server connection.
				-- Nested lists indicate equal priority, see |vim.lsp.Config|.
				root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
				-- Specific settings to send to the server. The schema is server-defined.
				-- Example: https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
				settings = {
					Lua = {
						runtime = { version = 'LuaJIT' },
						diagnostics = { globals = { 'vim' } }
					}
				}
			}
			-- vim.lsp.enable('luals')

			-- -- python
			-- vim.lsp.config['pylsp'] = {
			-- 	-- Command and arguments to start the server.
			-- 	-- cmd = { 'pyright' },
			-- 	-- Filetypes to automatically attach to.
			-- 	filetypes = { 'python' },
			-- }
			-- -- vim.lsp.enable('pylsp')

			-- -- julia
			-- vim.lsp.config['julials'] = {
			-- 	cmd = { '/home/happy/.local/share/nvim/mason/bin/julia-lsp' },
			-- 	-- Filetypes to automatically attach to.
			-- 	filetypes = { 'julia' },
			-- }
			-- vim.lsp.enable('julials')

			-- -- local julia_ls_script = vim.fs.joinpath(vim.fn.stdpath('config'), "helpers", "julia_languageserver.jl")
			-- local julia_ls_script = '/home/happy/temp/julia_languageserver.jl'
			-- -- require 'lspconfig'.julials.setup({
			-- vim.lsp.config['newjulials'] = {
			-- 	-- cmd = { "julia", "--startup-file=no", "--history-file=no", julia_ls_script },
			-- 	-- cmd = { "julia", "--startup-file=no", "--history-file=no", julia_ls_script },
			-- 	cmd = { "julia", "-e", '"using LanguageServer; runserver()"'},
			-- 	filetypes = { 'julia' },
			-- 	-- single_file_support = true,
			-- 	-- on_attach = function(_, bufnr)
			-- 	-- 	-- Disable automatic formatexpr since the LS.jl formatter isn't so nice.
			-- 	-- 	vim.bo[bufnr].formatexpr = ''
			-- 	-- end,
			-- 	-- capabilities = capabilities,
			-- 	-- })
			-- }
			-- vim.lsp.enable('newjulials')

			-- vim.lsp.config['julials'] = {
			-- 	cmd = { '' },
			-- 	filetypes = { 'julia' },
			-- 	root_markers = { 'Project.toml', 'Manifest.toml' },
			-- 	settings = {
			-- 		require 'lspconfig'.julials.setup {
			-- 			on_new_config = function(new_config, _)
			-- 				local julia = vim.fn.expand("~/.julia/environments/lsp/")
			-- 				if require 'lspconfig'.util.path.is_file(julia) then
			-- 					new_config.cmd[1] = julia
			-- 				end
			-- 			end
			-- 		}
			-- 	}
			-- }
			-- vim.lsp.enable('julials')

			-- -- Run Julia LSP
			-- -- https://forem.julialang.org/navi/set-up-neovim-tmux-for-a-data-science-workflow-with-julia-3ijk
			-- require 'lspconfig'.julials.setup {
			-- 	on_new_config = function(new_config, _)
			-- 		local julia = vim.fn.expand(
			-- 			"/home/happy/installs_and_builds/juliaup-1.18.9-x86_64-unknown-linux-musl-portable/julia")
			-- 		if require 'lspconfig'.util.path.is_file(julia) then
			-- 			-- vim.notify("Hello!")
			-- 			new_config.cmd[1] = julia
			-- 		end
			-- 	end
			-- }

			-- -- julia
			-- vim.lsp.config['blajulials'] = {
			-- 	-- cmd = { "julia", "--startup-file=no", "--history-file=no", "/home/happy/temp/bare_minimum.jl" },
			-- 	cmd = {
			-- 		-- "/home/happy/installs_and_builds/juliaup-1.18.9-x86_64-unknown-linux-musl-portable/julia",
			-- 		"julia",
			-- 		-- "--startup-file=no", "--history-file=no", "/home/happy/temp/bare_minimum.jl",
			-- 		-- "--startup-file=no", "--history-file=no", "/home/happy/temp/julia_languageserver.jl",
			-- 		"--startup-file=no", "--history-file=no", "-e",
			-- 		'using LanguageServer; server = LanguageServer.LanguageServerInstance(stdin, stdout, "", ""); server.runlinter = true; run(server)'
			-- 	},
			-- 	-- Filetypes to automatically attach to.
			-- 	filetypes = { 'julia' },
			-- 	settings = {},
			-- }
			-- vim.lsp.enable('blajulials')

			-- vim.lsp.config('julials', {
			-- 	cmd = {
			-- 		"julia",
			-- 		"--project=" .. "~/.julia/environments/lsp/",
			-- 		"--startup-file=no",
			-- 		"--history-file=no",
			-- 		"-e", [[
			-- 			using Pkg
			-- 			Pkg.instantiate()
			-- 			using LanguageServer
			-- 			depot_path = get(ENV, "JULIA_DEPOT_PATH", "")
			-- 			project_path = let
			-- 				dirname(something(
			-- 					## 1. Finds an explicitly set project (JULIA_PROJECT)
			-- 					Base.load_path_expand((
			-- 						p = get(ENV, "JULIA_PROJECT", nothing);
			-- 							p === nothing ? nothing : isempty(p) ? nothing : p
			-- 						)),
			-- 							## 2. Look for a Project.toml file in the current working directory,
			-- 							##    or parent directories, with $HOME as an upper boundary
			-- 							Base.current_project(),
			-- 							## 3. First entry in the load path
			-- 							get(Base.load_path(), 1, nothing),
			-- 							## 4. Fallback to default global environment,
			-- 							##    this is more or less unreachable
			-- 						Base.load_path_expand("@v#.#"),
			-- 					))
			-- 				end
			-- 			@info "Running language server" VERSION pwd() project_path depot_path
			-- 			server = LanguageServer.LanguageServerInstance(stdin, stdout, project_path, depot_path)
			-- 			server.runlinter = true
			-- 			run(server)
			-- 		]]
			-- 	},
			-- 	filetypes = { 'julia' },
			-- 	root_markers = { "Project.toml", "JuliaProject.toml" },
			-- 	settings = {}
			-- })
			-- vim.lsp.enable('julials')


			-- ################################################################
			-- Configure look and common features
			-- ################################################################

			vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
			vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
			vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')

			-- Hover map, with settings (did not find permanent setting)
			vim.keymap.set('n', 'K', function()
				vim.lsp.buf.hover({
					border = 'double', -- Can be "single", "double", "rounded", etc.
				})
			end, { desc = 'Hover documentation' })

			vim.diagnostic.config({
				virtual_text = false,
				update_in_insert = true,
				severity_sort = true,
				float = { border = 'rounded' }
			})


			--set up diagnostic symbols on the left of numbers
			vim.diagnostic.config({
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = ' ',
						[vim.diagnostic.severity.WARN] = ' ',
						[vim.diagnostic.severity.INFO] = ' ',
						[vim.diagnostic.severity.HINT] = ' ',
					},
					linehl = {
						[vim.diagnostic.severity.ERROR] = 'Error',
						[vim.diagnostic.severity.WARN] = 'Warn',
						[vim.diagnostic.severity.INFO] = 'Info',
						[vim.diagnostic.severity.HINT] = 'Hint',
					},
				},
			})

			-- ################################################################
			-- The "attach" part that runs when a lsp server becomes active
			-- Inside the callback option, the 'client' will be available
			-- ################################################################
			vim.api.nvim_create_autocmd('LspAttach', {
				group = vim.api.nvim_create_augroup('my.lsp', {}),
				callback = function(args)
					local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

					-- if client:supports_method('textDocument/implementation') then
					-- 	-- Create a keymap for vim.lsp.buf.implementation ...
					-- end

					-- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
					-- if client:supports_method('textDocument/completion') then
					-- 	-- Optional: trigger autocompletion on EVERY keypress. May be slow!
					-- 	-- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
					-- 	-- client.server_capabilities.completionProvider.triggerCharacters = chars
					-- 	vim.lsp.completion.enable(true, client.id, args.buf, {autotrigger = true})
					-- end

					-- highlight references
					-- Along with CursorMoved and CursorMovedI, CursorHold and CursorHoldI are also present
					if client.server_capabilities.documentHighlightProvider then -- check if the server has this feature
						vim.api.nvim_create_augroup('lsp_document_highlight', {})
						vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
							group = 'lsp_document_highlight',
							buffer = 0,
							callback = vim.lsp.buf.document_highlight,
						})
						vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
							group = 'lsp_document_highlight',
							buffer = 0,
							callback = vim.lsp.buf.clear_references,
						})
					end

					-- Auto-format ("lint") on save.
					-- Usually not needed if server supports "textDocument/willSaveWaitUntil".
					if not client:supports_method('textDocument/willSaveWaitUntil') and client:supports_method('textDocument/formatting') then
						vim.api.nvim_create_autocmd('BufWritePre', {
							group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
							buffer = args.buf,
							callback = function()
								vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
							end,
						})
					end

					-- sets up navic with lsp
					if client.server_capabilities.documentSymbolProvider then
						local bufnr = vim.fn.bufnr()
						local navic = require('nvim-navic')
						navic.setup { highlight = true }
						navic.attach(client, bufnr)
					end
				end,
			})


			-- Config END
		end,
	},
}
