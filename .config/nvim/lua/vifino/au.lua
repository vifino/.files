local cmd = vim.api.nvim_command
local format, concat = string.format, table.concat

local function autocmd(this, event, spec)
	local is_table = type(spec) == "table"
	local pattern = is_table and spec[1] or "*"
	local action = is_table and spec[2] or spec
	if type(action) == "function" then
		action = this.set(action)
	end
	local e = type(event) == "table" and concat(event, ",") or event
	cmd(concat({"autocmd", e, pattern, action}, " "))
end

local _S = {
	__fn = {},
}

-- Merge new __au with files from previous load.
if type(package.loaded["vifino.au"]) == "table" then
		for k, fn in pairs(package.loaded["vifino.au"].__fn) do
				_S.__fn[k] = fn
		end
end

local _M = setmetatable({}, {
	__index = _S,
	__newindex = autocmd,
	__call = autocmd,
})

function _S.exec(id)
	_S.__fn[id]()
end

function _S.set(fn)
	local id = format("%p", fn)
	_S.__fn[id] = fn
	return format("lua require('vifino.au').exec('%s')", id)
end

function _S.group(grp, cmds)
	cmd("augroup " .. grp)
	cmd("autocmd!")
	if type(cmds) == "function" then
		cmds(_M)
	else
		for _, au in ipairs(cmds) do
			autocmd(_S, au[1], { au[2], au[3] })
		end
	end
	cmd("augroup END")
end

return _M
