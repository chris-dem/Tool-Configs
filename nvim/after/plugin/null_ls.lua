local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.black,
        null_ls.builtins.completion.spell,
        null_ls.builtins.formatting.codespell,
        null_ls.builtins.diagnostics.pylint,
        null_ls.builtins.diagnostics.codespell,
        null_ls.builtins.diagnostics.write_good,
    },
})
