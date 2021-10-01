-- Automatically reload Lua files when they change.
-- However, since all the files here are modules,
-- they are cached.
-- So to actually reload, we need to source it,
-- then replace the entry in the module cache.

local cmd = vim.api.nvim_command
local gsub = string.gsub

local _M = {}


local lua_base = vim.fn.stdpath("config") .. "/lua/"
function _M.reload_file(filename)
    -- Convert the path of the file in the config folder to a valid lua module path.
		local relpath = gsub(filename, "^"..lua_base, "")
		local modname = gsub(gsub(relpath, "%.lua$", ""), "/", ".")

		-- We only want to reload when it is already loaded and
		-- only replace modules when they successfully load.
		-- This avoids lots of bullshit.
		if package.loaded[modname] then
				local success, mod = pcall(dofile, filename)
				if success then
						package.loaded[modname] = mod
						vim.notify("autoreload: Successfully reloaded "..modname, "debug")
				else
						vim.notify("autoreload: Failed to reload "..modname..": "..mod, "error")
				end
		end
end

-- Set up the autogroup
local au = require("vifino.au")
au.group("vifino_autoreload", {
		{
				"BufWritePost",
				lua_base .. "*/*.lua",
				"lua require('vifino.autoreload').reload_file(vim.fn.expand('<amatch>'))"
		}
})

return _M
