-- Packer plugins


-- Automatically recompile settings here.
--[[local au = require("vifino.au")
au.group("PackerGroup", {
		{ "BufWritePost", vim.fn.stdpath("config").."/lua/vifino/plugins.lua", "source <afile> | PackerSync" },
})
--]]

return require('packer').startup({
	function(use)
		-- Let packer manage itself.
		use { "wbthomason/packer.nvim", opt = true}

		-- Treesitter and LSP.
		use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate",
			requires = {
				{"nvim-treesitter/nvim-treesitter-refactor", after = "nvim-treesitter"},
				{"nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter"},
				{"p00f/nvim-ts-rainbow", after = "nvim-treesitter" },
			},
			config = function()
				require("nvim-treesitter.configs").setup({
					ensure_installed = "maintained",
					highlight = {
						enable = true
					},
					indent = {
						enable = false
					},
					rainbow = {
						enable = true
					},
					incremental_selection = {
						enable = true
					},

				})

				local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
				parser_config.openscad = {
						install_info = {
								url = "https://github.com/bollian/tree-sitter-openscad.git",
								files = {"src/parser.c"}
						},
						filetype = "scad",
				}
			end,
		}
		use { "neovim/nvim-lspconfig",
		  config = function()
				local hasbin = vim.fn.executable

				local lspconfig = require("lspconfig")
				local capabilities = vim.lsp.protocol.make_client_capabilities()
				capabilities.textDocument.completion.completionItem.snippetSupport = true

				-- Rust
				if hasbin("rust-analyzer") then
					lspconfig.rust_analyzer.setup({
						capabilities = capabilities
					})
				else
					lspconfig.rls.setup({})
				end

				-- C/CPP
				lspconfig.clangd.setup({})

				-- Go
				lspconfig.gopls.setup({})

				-- Lua
				-- But only for nixos.
				local runtime_path = vim.split(package.path, ';')
				table.insert(runtime_path, "lua/?.lua")
				table.insert(runtime_path, "lua/?/init.lua")
				lspconfig.sumneko_lua.setup({
						cmd = { "lua-language-server" },
						settings = {
								Lua = {
										runtime = {
												version = "LuaJIT",
												path = runtime_path,
										},
										diagnostics = {
												globals = {"vim"}
										},
										workspace = {
												library = vim.api.nvim_get_runtime_file("", true),
										},
										telemetry = {
												enable = false,
										},
								}
						}
				})

				-- Nix
				lspconfig.rnix.setup({})

				-- Haskell
				lspconfig.hls.setup({})
			end
		}

		-- Completion.
		use { "hrsh7th/nvim-cmp",
			config = function()
				local has_words_before = function()
					local line, col = unpack(vim.api.nvim_win_get_cursor(0))
					return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
				end

				local luasnip = require("luasnip")
				local cmp = require("cmp")
				local lspkind = require("lspkind")
				cmp.setup {
					preselect = cmp.PreselectMode.None,
					completion = { completeopt = "menu,menuone,noselect,noinsert" },
					snippet = { expand = function(args) require("luasnip").lsp_expand(args.body) end },
					mapping = {
						["<C-j>"] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select}),
						["<C-n>"] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select}),
						["<C-m>"] = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = true, },
						["<C-d>"] = cmp.mapping.scroll_docs(-4),
						["<C-u>"] = cmp.mapping.scroll_docs(4),
						["<C-Space>"] = cmp.mapping.complete(),
						["<C-c>"] = cmp.mapping.close(),
						["<CR>"] = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = true, },
						["<Tab>"] = cmp.mapping(function(fallback)
							if cmp.visible() then
								cmp.select_next_item({behavior = cmp.SelectBehavior.Select})
							elseif has_words_before() and luasnip.expand_or_jumpable() then
								vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "", true)
							else fallback() end
						end, { "i", "s" }),
						["<S-Tab>"] = cmp.mapping(function()
							if cmp.visible() then
								cmp.select_prev_item({behavior = cmp.SelectBehavior.Select})
							elseif luasnip.jumpable(-1) then
								vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "", true)
							end
						end, { "i", "s" }),
						["<C-l>"] = cmp.mapping(function()
							if has_words_before() and luasnip.expand_or_jumpable() then
								vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "", true)
							else
								vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Right>", true, true, true), "", true)
							end
						end, { "i", "s" }),
						["<C-h>"] = cmp.mapping(function()
							if luasnip.jumpable(-1) then
								vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "", true)
							else
								vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Left>", true, true, true), "", true)
							end
						end, { "i", "s" }),
					},
					documentation = {
						border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
						winhighlight = "FloatBorder:TelescopeBorder",
					},
					sources = {
						{ name = "luasnip"  }, { name = "nvim_lua" },
						{ name = "nvim_lsp" }, { name = "calc" },
						{ name = "path"	 }, { name = "buffer" },
						--{ name = "neorg"	}, { name = "cmp_tabnine" },
					},
					formatting = {
						format = lspkind.cmp_format({with_text=true, menu = ({
							buffer = "[BUF]",
							nvim_lsp = "[LSP]",
							luasnip = "[SNP]",
							calc = "[CAL]",
							path = "[PTH]",
							neorg = "[NRG]",
							cmp_tabnine = "[TB9]",
						}),
						border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
						}),
					},
					experimental = { ghost_text = false, custom_menu = true }
				}
				end,
				requires = {
					{ "L3MON4D3/LuaSnip" },
					{ "hrsh7th/cmp-buffer", after = "nvim-cmp" },
					{ "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
					{ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
					{ "hrsh7th/cmp-calc", after = "nvim-cmp" },
					{ "hrsh7th/cmp-path", after = "nvim-cmp" },
					{ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
					},
		}

		use { 'onsails/lspkind-nvim' }
		use { 'ray-x/lsp_signature.nvim', module = 'lsp_signature' }
		use { "simrat39/symbols-outline.nvim",
			setup = function()
				vim.g.symbols_outline = {
					highlight_hovered_item = true,
					show_guides = true,
					auto_preview = true,
					position = "right",
					width = 25,
					show_numbers = false,
					show_relative_numbers = false,
					show_symbol_details = true,
					keymaps = {
						close = "q",
						goto_location  = "<CR>",
						focus_location = "<space>",
						hover_symbol   = "K",
						toggle_preview = "p",
						rename_symbol  = "r",
						code_actions   = "a",
					},
				}
			end,
			cmd = { "SymbolsOutline", "SymbolsOutlineOpen", "SymbolsOutlineClose" }
		}

		use { "nvim-telescope/telescope.nvim",
			requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
			cmd = "Telescope",
			setup = function()
				local h = require("vifino.helpers")
				h.map("n", "<leader>ff", ":Telescope find_files<cr>")
				h.map("n", "<leader>fg", ":Telescope live_grep<cr>")
				h.map("n", "<leader>fb", ":Telescope buffers<cr>")
				h.map("n", "<leader>fh", ":Telescope help_tags<cr>")

				--h.map("n", "<leader>ca", ":Telescope lsp_code_actions<cr>")
				h.map("n", "<leader>cr", ":Telescope lsp_references<cr>")
				h.map("n", "<leader>cs", ":Telescope lsp_document_symbols<cr>")
				h.map("n", "<leader>cw", ":Telescope lsp_workspace_symbols<cr>")
			end
		}
		use { "tami5/lspsaga.nvim", branch = "nvim51",
		requires = "neovim/nvim-lspconfig",
			cmd = "Lspsaga",
			setup = function()
				local h = require("vifino.helpers")
				h.map("n", "<leader>ca", ":Lspsaga code_action<cr>")
				h.map("n", "<leader>rr", ":Lspsaga rename<cr>")
			end
		}

		-- Appearance.
		use { 'glepnir/zephyr-nvim',
			config = function()
				require('zephyr')
			end
		}
		use { "norcalli/nvim-colorizer.lua", -- Highlights colors like #213342 or Purple4, very pretty.
			config = function()
				require("colorizer").setup()
			end
		}
		use { "beauwilliams/statusline.lua",
			requires = {"kyazdani42/nvim-web-devicons", "kosayoda/nvim-lightbulb", opt = true}
		}

		-- Find with skim.
		use { 'lotabout/skim',
			run = "./install",
			requires = {"lotabout/skim.vim", after = "skim"}
		}

		-- Additional language support which isn't solved by Treesitter/LSP.
		--[[use { 'salkin-mada/openscad.nvim',
			config = function()
				vim.g.openscad_default_mappings = true
				require('openscad')
			end
		}
		--]]

		use { 'LnL7/vim-nix',
			ft = 'nix',
		}

		-- Small things.
		use { 'RRethy/nvim-align',
		  module = "align",
			setup = function()
				vim.api.nvim_command("command! -range=% -nargs=1 Align lua require'align'.align(<f-args>)")
			end,
	}
		use { "dhulihan/vim-rfc",
			cmd = "RFC"
		}
	end,
	config = {}
})
