require("project_nvim").setup{
    manual_mode = true,
    patterns = { "=nvim", ">Projects", ">vaults"},
}


vim.keymap.set("n", "<leader>vpf", function() vim.cmd.Telescope("projects") end)
