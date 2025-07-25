local quarto = require('quarto')
quarto.setup()
vim.keymap.set('n', '<leader>eq', quarto.quartoPreview, { silent = true, noremap = true })
local runner = require("quarto.runner")
vim.keymap.set("n", "<leader>rc", runner.run_cell,  { desc = "run cell", silent = true })
vim.keymap.set("n", "<leader>ra", runner.run_above, { desc = "run cell and above", silent = true })
vim.keymap.set("n", "<leader>rA", runner.run_all,   { desc = "run all cells", silent = true })
vim.keymap.set("n", "<leader>rl", runner.run_line,  { desc = "run line", silent = true })
vim.keymap.set("v", "<leader>r",  runner.run_range, { desc = "run visual range", silent = true })
vim.keymap.set("n", "<leader>RA", function()
  runner.run_all(true)
end, { desc = "run all cells of all languages", silent = true })



