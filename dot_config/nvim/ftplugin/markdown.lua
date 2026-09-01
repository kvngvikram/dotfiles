vim.opt.linebreak = true
vim.opt.wrap = true
-- vim.opt.spell = true  -- ltex language server already present

-- hop.nvim mappings
vim.keymap.set('n', 'f', ':HopWord<CR>', { silent = true })

-- nabla.nvim
-- require('nabla').enable_virt({autogen = true})
-- vim.keymap.set('n', '<Leader>l', ':lua require("nabla").popup()<CR>')
