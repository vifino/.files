-- vifino's neovim config.

-- Initialize package management.
local firstrun = false
if not pcall(vim.cmd, [[packadd packer.nvim]]) then
	print("[init] packer not found, installing")
	local opt_path = vim.fn.stdpath("data").."/site/pack/packer/opt"
	local packer_path = opt_path .. "/packer.nvim"
	vim.fn.mkdir(opt_path, "p")
	vim.cmd("!git clone https://github.com/wbthomason/packer.nvim '"..packer_path.."'")
	vim.cmd("packadd packer.nvim")
	
	firstrun = true
end

-- Require other parts of the config.
require("vifino.settings")
require("vifino.plugins")

if firstrun then
	require("packer").sync()
end
