-- vifino's helpers.

local _M = {}

local tbl_extend = vim.tbl_extend
local set_keymap = vim.api.nvim_set_keymap
function _M.map(mode, key, cmd, opts)
	local options = {noremap = true}
	if opts then options = tbl_extend('force', options, opts) end
	set_keymap(mode, key, cmd, options)
end

return _M
