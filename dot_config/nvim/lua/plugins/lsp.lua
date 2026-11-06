return { -- language support
	{

		'mason-org/mason-lspconfig.nvim', -- takes care of vim.lsp.enable('servername') for all servers
		opts = {},
		dependencies = {
			{ 'mason-org/mason.nvim', opts = {} }, -- The Mason interface window provider and installer
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
				ensure_installed = { 'lua_ls', 'pylsp', 'fortls', 'harper_ls', 'tinymist' }
				-- julials configured seperately later
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


			-- have julia command in your path
			-- Install "LanguageServer" in ~/.julia/environments/nvim-lspconfig
			-- Also You need Project.toml for julia lsp to work
			vim.lsp.config("julials", {
				cmd = {
					"julia",
					"--project=" .. "~/.julia/environments/nvim-lspconfig",
					"--startup-file=no",
					"--history-file=no",
					"-e",
					[[
						using Pkg
						Pkg.instantiate()
						using LanguageServer
						depot_path = get(ENV, "JULIA_DEPOT_PATH", "")
						project_path = let
						dirname(something(
							## 1. Finds an explicitly set project (JULIA_PROJECT)
							Base.load_path_expand((
							p = get(ENV, "JULIA_PROJECT", nothing);
								p === nothing ? nothing : isempty(p) ? nothing : p
							)),
							## 2. Look for a Project.toml file in the current working directory,
							##    or parent directories, with $HOME as an upper boundary
							Base.current_project(),
							## 3. First entry in the load path
							get(Base.load_path(), 1, nothing),
							## 4. Fallback to default global environment,
							##    this is more or less unreachable
							Base.load_path_expand("@v#.#"),
						))
						end
						@info "Running language server" VERSION pwd() project_path depot_path
						server = LanguageServer.LanguageServerInstance(stdin, stdout, project_path, depot_path)
						server.runlinter = true
						run(server)
					]],
				},
				filetypes = { "julia" },
				root_markers = { "Project.toml", "JuliaProject.toml" },
				settings = {},
			})
			vim.lsp.enable('julials')


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
						[vim.diagnostic.severity.ERROR] = 'E',
						[vim.diagnostic.severity.WARN] = 'W',
						[vim.diagnostic.severity.INFO] = 'I',
						[vim.diagnostic.severity.HINT] = 'H',
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
