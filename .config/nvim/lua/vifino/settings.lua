-- Editor settings.
local h = require("vifino.helpers")
local au = require("vifino.au")
local g, o, b, w = vim.g, vim.o, vim.bo, vim.wo
local has = vim.fn.has

-- Editor system settings.
o.autoread = true
o.inccommand = "nosplit"
g.clipboard = "unnamed"

-- Editor appearance.
if has("termguicolors") then o.termguicolors = true end
o.scrolloff = 4
o.sidescrolloff = 8
w.wrap = false

o.wildmenu = true
o.wildmode= "list,full"

o.shortmess="filnxtToOFI"

local protocol = require('vim.lsp.protocol')
protocol.CompletionItemKind = {
	' Text',        -- = 1,
	'ƒ Method',      -- = 2,
	' Function',    -- = 3,
	' Constructor', -- = 4,
	'ƒ Field',       -- = 5,
	' Variable',    -- = 6,
	' Class',       -- = 7,
	'ﰮ Interface',   -- = 8,
	' Module',      -- = 9,
	' Property',    -- = 10,
	' Unit',        -- = 11,
	' Value',       -- = 12,
	'了Enum',        -- = 13,
	' Keyword',     -- = 14,
	'﬌ Snippet',     -- = 15,
	' Color',       -- = 16,
	' File',        -- = 17,
	'Reference',     -- = 18,
	' Folder',      -- = 19,
	' EnumMember',  -- = 20,
	' Constant',    -- = 21,
	' Struct',      -- = 22,
	'Event',         -- = 23,
	'Operator',      -- = 24,
	'TypeParameter', -- = 25,
}

-- Default indentation.
local indent = 4
b.expandtab = false
b.shiftwidth = indent
b.tabstop = indent

-- Keybindings
local map = h.map
map("n", "<Space>", "", {})
g.mapleader = " "

map("n", "<leader><esc>", ":nohlsearch<cr>")
map("n", "<leader>n", ":bnext<cr>")
map("n", "<leader>p", ":bprev<cr>")

map("i", "<Tab>", 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
map("i", "<S-Tab>", 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})


-- Autocommands to override settings.
au.group("vifino_settings", {
	{"FileType", "lua", "set ts=2 sw=2 noet"},
	{"FileType", "lua", function() print("Hello from Lua!") end},
	{"FileType", "rust", "set ts=4 sw=4 et"},
	{"FileType", "nix", "set ts=2 sw=2 et"},
	{"FileType", "markdown", "set ts=2 sw=2 et"},
	{"FileType", "yaml", "set ts=2 sw=2 et"},
	{"BufNewFile,BufRead", "*.sls", "setf yaml"},
})

return {}
