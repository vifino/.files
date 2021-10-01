-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

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

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/vifino/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/vifino/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/vifino/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/vifino/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/vifino/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
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
  ["lspsaga.nvim"] = {
    commands = { "Lspsaga" },
    loaded = false,
    needs_bufread = false,
    path = "/home/vifino/.local/share/nvim/site/pack/packer/opt/lspsaga.nvim"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/home/vifino/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    config = { "\27LJ\2\n�\2\0\0\5\0\18\0\0216\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0005\2\a\0005\3\b\0005\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\3=\3\17\2B\0\2\1K\0\1\0\vsource\15treesitter\1\0\1\tmenu\n[TRS]\rnvim_lua\1\0\1\tmenu\n[Lua]\rnvim_lsp\1\0\1\tmenu\n[LSP]\vbuffer\1\0\1\tmenu\n[BUF]\1\0\1\tpath\2\1\0\1\fenabled\2\nsetup\ncompe\frequire\26menu,menuone,noselect\16completeopt\6o\bvim\0" },
    loaded = true,
    path = "/home/vifino/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lightbulb"] = {
    loaded = true,
    path = "/home/vifino/.local/share/nvim/site/pack/packer/start/nvim-lightbulb"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n�\6\0\0\14\0004\0\\6\0\0\0009\0\1\0009\0\2\0006\1\3\0'\3\4\0B\1\2\0026\2\0\0009\2\5\0029\2\6\0029\2\a\2B\2\1\0029\3\b\0029\3\t\0039\3\n\3+\4\2\0=\4\v\3\18\3\0\0'\5\f\0B\3\2\2\15\0\3\0X\4\6�9\3\r\0019\3\14\0035\5\15\0=\2\16\5B\3\2\1X\3\4�9\3\17\0019\3\14\0034\5\0\0B\3\2\0019\3\18\0019\3\14\0034\5\0\0B\3\2\0019\3\19\0019\3\14\0034\5\0\0B\3\2\0016\3\0\0009\3\20\0036\5\21\0009\5\22\5'\6\23\0B\3\3\0026\4\24\0009\4\25\4\18\6\3\0'\a\26\0B\4\3\0016\4\24\0009\4\25\4\18\6\3\0'\a\27\0B\4\3\0019\4\28\0019\4\14\0045\6\30\0005\a\29\0=\a\31\0065\a/\0005\b!\0005\t \0=\3\22\t=\t\"\b5\t$\0005\n#\0=\n%\t=\t&\b5\t*\0006\n\0\0009\n'\n9\n(\n'\f)\0+\r\2\0B\n\3\2=\n+\t=\t,\b5\t-\0=\t.\b=\b0\a=\a1\6B\4\2\0019\0042\0019\4\14\0044\6\0\0B\4\2\0019\0043\0019\4\14\0044\6\0\0B\4\2\1K\0\1\0\bhls\trnix\rsettings\bLua\1\0\0\14telemetry\1\0\1\venable\1\14workspace\flibrary\1\0\0\5\26nvim_get_runtime_file\bapi\16diagnostics\fglobals\1\0\0\1\2\0\0\bvim\fruntime\1\0\0\1\0\1\fversion\vLuaJIT\bcmd\1\0\0\1\2\0\0\24lua-language-server\16sumneko_lua\19lua/?/init.lua\14lua/?.lua\vinsert\ntable\6;\tpath\fpackage\nsplit\ngopls\vclangd\brls\17capabilities\1\0\0\nsetup\18rust_analyzer\18rust-analyzer\19snippetSupport\19completionItem\15completion\17textDocument\29make_client_capabilities\rprotocol\blsp\14lspconfig\frequire\15executable\afn\bvim\0" },
    loaded = true,
    path = "/home/vifino/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    after = { "nvim-treesitter-textobjects", "nvim-treesitter-refactor", "nvim-ts-rainbow" },
    loaded = true,
    only_config = true
  },
  ["nvim-treesitter-refactor"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/vifino/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-refactor"
  },
  ["nvim-treesitter-textobjects"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/vifino/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects"
  },
  ["nvim-ts-rainbow"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/vifino/.local/share/nvim/site/pack/packer/opt/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/vifino/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["openscad.nvim"] = {
    config = { "\27LJ\2\nX\0\0\3\0\5\0\b6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\3\0'\2\4\0B\0\2\1K\0\1\0\ropenscad\frequire\30openscad_default_mappings\6g\bvim\0" },
    loaded = true,
    path = "/home/vifino/.local/share/nvim/site/pack/packer/start/openscad.nvim"
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
  skim = {
    loaded = true,
    path = "/home/vifino/.local/share/nvim/site/pack/packer/start/skim"
  },
  ["skim.vim"] = {
    loaded = true,
    path = "/home/vifino/.local/share/nvim/site/pack/packer/start/skim.vim"
  },
  ["statusline.lua"] = {
    loaded = true,
    path = "/home/vifino/.local/share/nvim/site/pack/packer/start/statusline.lua"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    loaded = false,
    needs_bufread = true,
    path = "/home/vifino/.local/share/nvim/site/pack/packer/opt/telescope.nvim"
  },
  ["vim-nix"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/vifino/.local/share/nvim/site/pack/packer/opt/vim-nix"
  },
  ["vim-rfc"] = {
    commands = { "RFC" },
    loaded = false,
    needs_bufread = false,
    path = "/home/vifino/.local/share/nvim/site/pack/packer/opt/vim-rfc"
  },
  ["zephyr-nvim"] = {
    config = { "\27LJ\2\n&\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\vzephyr\frequire\0" },
    loaded = true,
    path = "/home/vifino/.local/share/nvim/site/pack/packer/start/zephyr-nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: lspsaga.nvim
time([[Setup for lspsaga.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\6\0\b\0\0146\0\0\0'\2\1\0B\0\2\0029\1\2\0'\3\3\0'\4\4\0'\5\5\0B\1\4\0019\1\2\0'\3\3\0'\4\6\0'\5\a\0B\1\4\1K\0\1\0\24:Lspsaga rename<cr>\15<leader>rr\29:Lspsaga code_action<cr>\15<leader>ca\6n\bmap\19vifino.helpers\frequire\0", "setup", "lspsaga.nvim")
time([[Setup for lspsaga.nvim]], false)
-- Setup for: telescope.nvim
time([[Setup for telescope.nvim]], true)
try_loadstring("\27LJ\2\n�\3\0\0\6\0\18\0'6\0\0\0'\2\1\0B\0\2\0029\1\2\0'\3\3\0'\4\4\0'\5\5\0B\1\4\0019\1\2\0'\3\3\0'\4\6\0'\5\a\0B\1\4\0019\1\2\0'\3\3\0'\4\b\0'\5\t\0B\1\4\0019\1\2\0'\3\3\0'\4\n\0'\5\v\0B\1\4\0019\1\2\0'\3\3\0'\4\f\0'\5\r\0B\1\4\0019\1\2\0'\3\3\0'\4\14\0'\5\15\0B\1\4\0019\1\2\0'\3\3\0'\4\16\0'\5\17\0B\1\4\1K\0\1\0):Telescope lsp_workspace_symbols<cr>\15<leader>cw(:Telescope lsp_document_symbols<cr>\15<leader>cs\":Telescope lsp_references<cr>\15<leader>cr\29:Telescope help_tags<cr>\15<leader>fh\27:Telescope buffers<cr>\15<leader>fb\29:Telescope live_grep<cr>\15<leader>fg\30:Telescope find_files<cr>\15<leader>ff\6n\bmap\19vifino.helpers\frequire\0", "setup", "telescope.nvim")
time([[Setup for telescope.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n�\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\frainbow\1\0\1\venable\2\vindent\1\0\1\venable\1\14highlight\1\0\1\venable\2\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-compe
time([[Config for nvim-compe]], true)
try_loadstring("\27LJ\2\n�\2\0\0\5\0\18\0\0216\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0005\2\a\0005\3\b\0005\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\3=\3\17\2B\0\2\1K\0\1\0\vsource\15treesitter\1\0\1\tmenu\n[TRS]\rnvim_lua\1\0\1\tmenu\n[Lua]\rnvim_lsp\1\0\1\tmenu\n[LSP]\vbuffer\1\0\1\tmenu\n[BUF]\1\0\1\tpath\2\1\0\1\fenabled\2\nsetup\ncompe\frequire\26menu,menuone,noselect\16completeopt\6o\bvim\0", "config", "nvim-compe")
time([[Config for nvim-compe]], false)
-- Config for: openscad.nvim
time([[Config for openscad.nvim]], true)
try_loadstring("\27LJ\2\nX\0\0\3\0\5\0\b6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\3\0'\2\4\0B\0\2\1K\0\1\0\ropenscad\frequire\30openscad_default_mappings\6g\bvim\0", "config", "openscad.nvim")
time([[Config for openscad.nvim]], false)
-- Config for: zephyr-nvim
time([[Config for zephyr-nvim]], true)
try_loadstring("\27LJ\2\n&\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\vzephyr\frequire\0", "config", "zephyr-nvim")
time([[Config for zephyr-nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n�\6\0\0\14\0004\0\\6\0\0\0009\0\1\0009\0\2\0006\1\3\0'\3\4\0B\1\2\0026\2\0\0009\2\5\0029\2\6\0029\2\a\2B\2\1\0029\3\b\0029\3\t\0039\3\n\3+\4\2\0=\4\v\3\18\3\0\0'\5\f\0B\3\2\2\15\0\3\0X\4\6�9\3\r\0019\3\14\0035\5\15\0=\2\16\5B\3\2\1X\3\4�9\3\17\0019\3\14\0034\5\0\0B\3\2\0019\3\18\0019\3\14\0034\5\0\0B\3\2\0019\3\19\0019\3\14\0034\5\0\0B\3\2\0016\3\0\0009\3\20\0036\5\21\0009\5\22\5'\6\23\0B\3\3\0026\4\24\0009\4\25\4\18\6\3\0'\a\26\0B\4\3\0016\4\24\0009\4\25\4\18\6\3\0'\a\27\0B\4\3\0019\4\28\0019\4\14\0045\6\30\0005\a\29\0=\a\31\0065\a/\0005\b!\0005\t \0=\3\22\t=\t\"\b5\t$\0005\n#\0=\n%\t=\t&\b5\t*\0006\n\0\0009\n'\n9\n(\n'\f)\0+\r\2\0B\n\3\2=\n+\t=\t,\b5\t-\0=\t.\b=\b0\a=\a1\6B\4\2\0019\0042\0019\4\14\0044\6\0\0B\4\2\0019\0043\0019\4\14\0044\6\0\0B\4\2\1K\0\1\0\bhls\trnix\rsettings\bLua\1\0\0\14telemetry\1\0\1\venable\1\14workspace\flibrary\1\0\0\5\26nvim_get_runtime_file\bapi\16diagnostics\fglobals\1\0\0\1\2\0\0\bvim\fruntime\1\0\0\1\0\1\fversion\vLuaJIT\bcmd\1\0\0\1\2\0\0\24lua-language-server\16sumneko_lua\19lua/?/init.lua\14lua/?.lua\vinsert\ntable\6;\tpath\fpackage\nsplit\ngopls\vclangd\brls\17capabilities\1\0\0\nsetup\18rust_analyzer\18rust-analyzer\19snippetSupport\19completionItem\15completion\17textDocument\29make_client_capabilities\rprotocol\blsp\14lspconfig\frequire\15executable\afn\bvim\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-treesitter-refactor ]]
vim.cmd [[ packadd nvim-treesitter-textobjects ]]
vim.cmd [[ packadd nvim-ts-rainbow ]]
time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file RFC lua require("packer.load")({'vim-rfc'}, { cmd = "RFC", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Lspsaga lua require("packer.load")({'lspsaga.nvim'}, { cmd = "Lspsaga", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType nix ++once lua require("packer.load")({'vim-nix'}, { ft = "nix" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/vifino/.local/share/nvim/site/pack/packer/opt/vim-nix/ftdetect/nix.vim]], true)
vim.cmd [[source /home/vifino/.local/share/nvim/site/pack/packer/opt/vim-nix/ftdetect/nix.vim]]
time([[Sourcing ftdetect script at: /home/vifino/.local/share/nvim/site/pack/packer/opt/vim-nix/ftdetect/nix.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
