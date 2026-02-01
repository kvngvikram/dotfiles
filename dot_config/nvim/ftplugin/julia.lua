vim.cmd('let g:slime_cell_delimiter = "# --"')

-- vim.cmd('let g:slime_python_ipython = 1')

vim.keymap.set('n', '<Leader>^', ':!tmux split-window -d -h -p 45 <CR><CR>:SlimeSend1 julia<CR>')

-- Instead of execute SlimeSend0 can also be used as:- :SlimeSend0 'cd '.getcwd()<CR>
-- But I don't know how to send an <Enter>

-- TODO can we use <C-O> instead of marking with z?
-- But that will mess up the jump lists
vim.keymap.set('v', '<CR>', '"+y:SlimeSend1 print(clipboard())<CR>:SlimeSend1 eval(Meta.parseall(clipboard()))<CR>')
vim.keymap.set('n', '<leader><CR>',
	'mzVgg"+y:SlimeSend1 print(clipboard())<CR>:SlimeSend1 eval(Meta.parseall(clipboard()))<CR>`zzz')
vim.keymap.set('n', '<leader>r',
	'mzggVG"+y:SlimeSend1 print(clipboard())<CR>:SlimeSend1 eval(Meta.parseall(clipboard()))<CR>`zzz')

vim.keymap.set('n', '<A-CR>', 'mzviw<Plug>SlimeRegionSend`z')
vim.keymap.set('n', '<CR>', 'V<Plug>SlimeRegionSendj')
