-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "C:\\Users\\CHRIST~1.DEM\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.1703942320\\share\\lua\\5.1\\?.lua;C:\\Users\\CHRIST~1.DEM\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.1703942320\\share\\lua\\5.1\\?\\init.lua;C:\\Users\\CHRIST~1.DEM\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.1703942320\\lib\\luarocks\\rocks-5.1\\?.lua;C:\\Users\\CHRIST~1.DEM\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.1703942320\\lib\\luarocks\\rocks-5.1\\?\\init.lua"
local install_cpath_pattern = "C:\\Users\\CHRIST~1.DEM\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.1703942320\\lib\\lua\\5.1\\?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "C:\\Users\\christos.demetriou\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "C:\\Users\\christos.demetriou\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["autoclose.nvim"] = {
    loaded = true,
    path = "C:\\Users\\christos.demetriou\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\autoclose.nvim",
    url = "https://github.com/m4xshen/autoclose.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "C:\\Users\\christos.demetriou\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "C:\\Users\\christos.demetriou\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "C:\\Users\\christos.demetriou\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "C:\\Users\\christos.demetriou\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "C:\\Users\\christos.demetriou\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["codeium.vim"] = {
    loaded = true,
    path = "C:\\Users\\christos.demetriou\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\codeium.vim",
    url = "https://github.com/Exafunction/codeium.vim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "C:\\Users\\christos.demetriou\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["git-blame.nvim"] = {
    loaded = true,
    path = "C:\\Users\\christos.demetriou\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\git-blame.nvim",
    url = "https://github.com/f-person/git-blame.nvim"
  },
  harpoon = {
    loaded = true,
    path = "C:\\Users\\christos.demetriou\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\harpoon",
    url = "https://github.com/ThePrimeagen/harpoon"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "C:\\Users\\christos.demetriou\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lsp-zero.nvim"] = {
    loaded = true,
    path = "C:\\Users\\christos.demetriou\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lsp-zero.nvim",
    url = "https://github.com/vonheikemen/lsp-zero.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "C:\\Users\\christos.demetriou\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\christos.demetriou\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "C:\\Users\\christos.demetriou\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "C:\\Users\\christos.demetriou\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["minimap.vim"] = {
    loaded = true,
    path = "C:\\Users\\christos.demetriou\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\minimap.vim",
    url = "https://github.com/wfxr/minimap.vim"
  },
  ["noice.nvim"] = {
    loaded = true,
    path = "C:\\Users\\christos.demetriou\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\noice.nvim",
    url = "https://github.com/folke/noice.nvim"
  },
  ["none-ls.nvim"] = {
    loaded = true,
    path = "C:\\Users\\christos.demetriou\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\none-ls.nvim",
    url = "https://github.com/nvimtools/none-ls.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "C:\\Users\\christos.demetriou\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "C:\\Users\\christos.demetriou\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\nF\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0)\2\0\0B\0\2\1K\0\1\0\21attach_to_buffer\14colorizer\frequire]\1\2\6\0\6\0\f6\2\0\0'\4\1\0B\2\2\0029\2\2\2\18\4\1\0B\2\2\0016\2\3\0009\2\4\0023\4\5\0)\5\0\0B\2\3\1K\0\1\0\0\rdefer_fn\bvim\nsetup\14colorizer\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\christos.demetriou\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\nvim-colorizer.lua",
    url = "https://github.com/NvChad/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "C:\\Users\\christos.demetriou\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    loaded = true,
    path = "C:\\Users\\christos.demetriou\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "C:\\Users\\christos.demetriou\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "C:\\Users\\christos.demetriou\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ufo"] = {
    loaded = true,
    path = "C:\\Users\\christos.demetriou\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-ufo",
    url = "https://github.com/kevinhwang91/nvim-ufo"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "C:\\Users\\christos.demetriou\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  nvterm = {
    config = { "\27LJ\2\n8\0\2\5\0\3\0\a6\2\0\0'\4\1\0B\2\2\0029\2\2\2\18\4\1\0B\2\2\1K\0\1\0\nsetup\vnvterm\frequire\0" },
    loaded = true,
    path = "C:\\Users\\christos.demetriou\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvterm",
    url = "https://github.com/NvChad/nvterm"
  },
  ["obsidian.nvim"] = {
    loaded = true,
    path = "C:\\Users\\christos.demetriou\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\obsidian.nvim",
    url = "https://github.com/epwalsh/obsidian.nvim"
  },
  ["omnisharp-vim"] = {
    loaded = true,
    path = "C:\\Users\\christos.demetriou\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\omnisharp-vim",
    url = "https://github.com/OmniSharp/omnisharp-vim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "C:\\Users\\christos.demetriou\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "C:\\Users\\christos.demetriou\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "C:\\Users\\christos.demetriou\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["promise-async"] = {
    loaded = true,
    path = "C:\\Users\\christos.demetriou\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\promise-async",
    url = "https://github.com/kevinhwang91/promise-async"
  },
  ["rose-pine"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\26colorscheme rose-pine\bcmd\bvim\0" },
    loaded = true,
    path = "C:\\Users\\christos.demetriou\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\rose-pine",
    url = "https://github.com/rose-pine/neovim"
  },
  rustaceanvim = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "C:\\Users\\christos.demetriou\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\rustaceanvim",
    url = "https://github.com/mrcjkb/rustaceanvim"
  },
  tabular = {
    loaded = true,
    path = "C:\\Users\\christos.demetriou\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\tabular",
    url = "https://github.com/godlygeek/tabular"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "C:\\Users\\christos.demetriou\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["trouble.nvim"] = {
    loaded = true,
    path = "C:\\Users\\christos.demetriou\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  undotree = {
    loaded = true,
    path = "C:\\Users\\christos.demetriou\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "C:\\Users\\christos.demetriou\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-mkdir"] = {
    loaded = true,
    path = "C:\\Users\\christos.demetriou\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-mkdir",
    url = "https://github.com/pbrisbin/vim-mkdir"
  },
  ["vim-python-pep8-indent"] = {
    loaded = true,
    path = "C:\\Users\\christos.demetriou\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-python-pep8-indent",
    url = "https://github.com/vimjas/vim-python-pep8-indent"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "C:\\Users\\christos.demetriou\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-visual-multi",
    url = "https://github.com/mg979/vim-visual-multi"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: markdown-preview.nvim
time([[Setup for markdown-preview.nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\2\0\0\rmarkdown\19mkdp_filetypes\6g\bvim\0", "setup", "markdown-preview.nvim")
time([[Setup for markdown-preview.nvim]], false)
-- Config for: nvterm
time([[Config for nvterm]], true)
try_loadstring("\27LJ\2\n8\0\2\5\0\3\0\a6\2\0\0'\4\1\0B\2\2\0029\2\2\2\18\4\1\0B\2\2\1K\0\1\0\nsetup\vnvterm\frequire\0", "config", "nvterm")
time([[Config for nvterm]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: rose-pine
time([[Config for rose-pine]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\26colorscheme rose-pine\bcmd\bvim\0", "config", "rose-pine")
time([[Config for rose-pine]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType rust ++once lua require("packer.load")({'rustaceanvim'}, { ft = "rust" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au User FilePost ++once lua require("packer.load")({'nvim-colorizer.lua'}, { event = "User FilePost" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
