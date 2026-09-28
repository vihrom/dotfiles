vim.pack.add({ "https://github.com/junegunn/vim-easy-align" })

vim.keymap.set('x', 'ga', '<Plug>(EasyAlign)', { desc = "EasyAlign (Visual)" })
vim.keymap.set('n', 'ga', '<Plug>(EasyAlign)', { desc = "EasyAlign (Normal)" })
