vim.keymap.set("n", "<leader>ct", vim.cmd.CodeiumToggle)


-- Change '<C-g>' here to any keycode you like.
vim.keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
vim.keymap.set('i', '<leader>cn', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
vim.keymap.set('i', '<leader>cp', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
vim.keymap.set({ 'i', 'v', 'n' }, '<leader>cc', function() return vim.fn['codeium#Chat']() end)
