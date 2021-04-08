" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/home/vifino/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/vifino/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/vifino/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/vifino/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/vifino/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  ["lspsaga.nvim"] = {
    commands = { "Lspsaga" },
    loaded = false,
    needs_bufread = false,
    path = "/home/vifino/.local/share/nvim/site/pack/packer/opt/lspsaga.nvim"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\0027\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/home/vifino/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    config = { "\27LJ\2\2è\2\0\0\4\0\18\0\0216\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\1\5\0B\0\2\0029\0\6\0005\1\a\0005\2\b\0005\3\t\0=\3\n\0025\3\v\0=\3\f\0025\3\r\0=\3\14\0025\3\15\0=\3\16\2=\2\17\1B\0\2\1K\0\1\0\vsource\15treesitter\1\0\1\tmenu\n[TRS]\rnvim_lua\1\0\1\tmenu\n[Lua]\rnvim_lsp\1\0\1\tmenu\n[LSP]\vbuffer\1\0\1\tmenu\n[BUF]\1\0\1\tpath\2\1\0\1\fenabled\2\nsetup\ncompe\frequire\26menu,menuone,noselect\16completeopt\6o\bvim\0" },
    loaded = true,
    path = "/home/vifino/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\2˛\2\0\0\5\0\21\0,6\0\0\0009\0\1\0009\0\2\0006\1\3\0'\2\4\0B\1\2\0026\2\0\0009\2\5\0029\2\6\0029\2\a\2B\2\1\0029\3\b\0029\3\t\0039\3\n\3+\4\2\0=\4\v\3\18\3\0\0'\4\f\0B\3\2\2\15\0\3\0X\4\6Ä9\3\r\0019\3\14\0035\4\15\0=\2\16\4B\3\2\1X\3\4Ä9\3\17\0019\3\14\0034\4\0\0B\3\2\0019\3\18\0019\3\14\0034\4\0\0B\3\2\0019\3\19\0019\3\14\0034\4\0\0B\3\2\0019\3\20\0019\3\14\0034\4\0\0B\3\2\1K\0\1\0\bhls\ngopls\vclangd\brls\17capabilities\1\0\0\nsetup\18rust_analyzer\18rust-analyzer\19snippetSupport\19completionItem\15completion\17textDocument\29make_client_capabilities\rprotocol\blsp\14lspconfig\frequire\15executable\afn\bvim\0" },
    loaded = true,
    path = "/home/vifino/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    after = { "nvim-treesitter-refactor", "nvim-treesitter-textobjects", "nvim-ts-rainbow" },
    only_config = true
  },
  ["nvim-treesitter-refactor"] = {
    load_after = {},
    loaded = false,
    needs_bufread = false,
    path = "/home/vifino/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-refactor"
  },
  ["nvim-treesitter-textobjects"] = {
    load_after = {},
    loaded = false,
    needs_bufread = false,
    path = "/home/vifino/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects"
  },
  ["nvim-ts-rainbow"] = {
    load_after = {},
    loaded = false,
    needs_bufread = false,
    path = "/home/vifino/.local/share/nvim/site/pack/packer/opt/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/vifino/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/vifino/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/vifino/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/vifino/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["statusline.lua"] = {
    loaded = true,
    path = "/home/vifino/.local/share/nvim/site/pack/packer/start/statusline.lua"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    loaded = false,
    needs_bufread = false,
    path = "/home/vifino/.local/share/nvim/site/pack/packer/opt/telescope.nvim"
  },
  ["vim-openscad"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/vifino/.local/share/nvim/site/pack/packer/opt/vim-openscad"
  },
  ["zephyr-nvim"] = {
    config = { "\27LJ\2\2&\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\vzephyr\frequire\0" },
    loaded = true,
    path = "/home/vifino/.local/share/nvim/site/pack/packer/start/zephyr-nvim"
  }
}

-- Setup for: lspsaga.nvim
try_loadstring("\27LJ\2\2ü\1\0\0\5\0\b\0\0146\0\0\0'\1\1\0B\0\2\0029\1\2\0'\2\3\0'\3\4\0'\4\5\0B\1\4\0019\1\2\0'\2\3\0'\3\6\0'\4\a\0B\1\4\1K\0\1\0\24:Lspsaga rename<cr>\15<leader>rr\29:Lspsaga code_action<cr>\15<leader>ca\6n\bmap\19vifino.helpers\frequire\0", "setup", "lspsaga.nvim")
-- Setup for: telescope.nvim
try_loadstring("\27LJ\2\2◊\3\0\0\5\0\18\0'6\0\0\0'\1\1\0B\0\2\0029\1\2\0'\2\3\0'\3\4\0'\4\5\0B\1\4\0019\1\2\0'\2\3\0'\3\6\0'\4\a\0B\1\4\0019\1\2\0'\2\3\0'\3\b\0'\4\t\0B\1\4\0019\1\2\0'\2\3\0'\3\n\0'\4\v\0B\1\4\0019\1\2\0'\2\3\0'\3\f\0'\4\r\0B\1\4\0019\1\2\0'\2\3\0'\3\14\0'\4\15\0B\1\4\0019\1\2\0'\2\3\0'\3\16\0'\4\17\0B\1\4\1K\0\1\0):Telescope lsp_workspace_symbols<cr>\15<leader>cw(:Telescope lsp_document_symbols<cr>\15<leader>cs\":Telescope lsp_references<cr>\15<leader>cr\29:Telescope help_tags<cr>\15<leader>fh\27:Telescope buffers<cr>\15<leader>fb\29:Telescope live_grep<cr>\15<leader>fg\30:Telescope find_files<cr>\15<leader>ff\6n\bmap\19vifino.helpers\frequire\0", "setup", "telescope.nvim")
-- Config for: nvim-treesitter
try_loadstring("\27LJ\2\2∫\1\0\0\3\0\n\0\r6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0005\2\4\0=\2\5\0015\2\6\0=\2\a\0015\2\b\0=\2\t\1B\0\2\1K\0\1\0\frainbow\1\0\1\venable\2\vindent\1\0\1\venable\1\14highlight\1\0\1\venable\2\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
-- Config for: nvim-colorizer.lua
try_loadstring("\27LJ\2\0027\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
-- Config for: nvim-lspconfig
try_loadstring("\27LJ\2\2˛\2\0\0\5\0\21\0,6\0\0\0009\0\1\0009\0\2\0006\1\3\0'\2\4\0B\1\2\0026\2\0\0009\2\5\0029\2\6\0029\2\a\2B\2\1\0029\3\b\0029\3\t\0039\3\n\3+\4\2\0=\4\v\3\18\3\0\0'\4\f\0B\3\2\2\15\0\3\0X\4\6Ä9\3\r\0019\3\14\0035\4\15\0=\2\16\4B\3\2\1X\3\4Ä9\3\17\0019\3\14\0034\4\0\0B\3\2\0019\3\18\0019\3\14\0034\4\0\0B\3\2\0019\3\19\0019\3\14\0034\4\0\0B\3\2\0019\3\20\0019\3\14\0034\4\0\0B\3\2\1K\0\1\0\bhls\ngopls\vclangd\brls\17capabilities\1\0\0\nsetup\18rust_analyzer\18rust-analyzer\19snippetSupport\19completionItem\15completion\17textDocument\29make_client_capabilities\rprotocol\blsp\14lspconfig\frequire\15executable\afn\bvim\0", "config", "nvim-lspconfig")
-- Config for: nvim-compe
try_loadstring("\27LJ\2\2è\2\0\0\4\0\18\0\0216\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\1\5\0B\0\2\0029\0\6\0005\1\a\0005\2\b\0005\3\t\0=\3\n\0025\3\v\0=\3\f\0025\3\r\0=\3\14\0025\3\15\0=\3\16\2=\2\17\1B\0\2\1K\0\1\0\vsource\15treesitter\1\0\1\tmenu\n[TRS]\rnvim_lua\1\0\1\tmenu\n[Lua]\rnvim_lsp\1\0\1\tmenu\n[LSP]\vbuffer\1\0\1\tmenu\n[BUF]\1\0\1\tpath\2\1\0\1\fenabled\2\nsetup\ncompe\frequire\26menu,menuone,noselect\16completeopt\6o\bvim\0", "config", "nvim-compe")
-- Config for: zephyr-nvim
try_loadstring("\27LJ\2\2&\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\vzephyr\frequire\0", "config", "zephyr-nvim")
-- Load plugins in order defined by `after`
vim.cmd [[ packadd nvim-ts-rainbow ]]
vim.cmd [[ packadd nvim-treesitter-textobjects ]]
vim.cmd [[ packadd nvim-treesitter-refactor ]]

-- Command lazy-loads
vim.cmd [[command! -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Lspsaga lua require("packer.load")({'lspsaga.nvim'}, { cmd = "Lspsaga", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
vim.cmd [[au FileType openscad ++once lua require("packer.load")({'vim-openscad'}, { ft = "openscad" }, _G.packer_plugins)]]
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
vim.cmd [[source /home/vifino/.local/share/nvim/site/pack/packer/opt/vim-openscad/ftdetect/openscad.vim]]
vim.cmd("augroup END")
END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
