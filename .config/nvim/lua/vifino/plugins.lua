-- Packer plugins

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
					}
				})
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

				-- Haskell
				lspconfig.hls.setup({})
			end
		}

		-- Completion.
		use { "hrsh7th/nvim-compe",
			requires = {"neovim/nvim-lspconfig", "nvim-treesitter/nvim-treesitter"},
			config = function()
				vim.o.completeopt = "menu,menuone,noselect"
				require('compe').setup({
					enabled = true,
					source = {
						path = true,
						buffer =     { menu = "[BUF]" },
						nvim_lsp =   { menu = "[LSP]" },
						nvim_lua =   { menu = "[Lua]" },
						treesitter = { menu = "[TRS]" },
					},
				})
			end
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
		use { "glepnir/lspsaga.nvim", requires = "neovim/nvim-lspconfig",
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


		-- Additional language support which isn't solved by Treesitter/LSP.
		use { "Lattay/vim-openscad",
			ft = "openscad",
		}

	end,
	config = {}
})
