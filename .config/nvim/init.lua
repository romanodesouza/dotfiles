local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- leader key
vim.g.mapleader=","

require("lazy").setup({
	-- FZF
	{
		"junegunn/fzf.vim",
		dependencies = { "junegunn/fzf", build = ":call fzf#install()" },
		config = function()
			vim.keymap.set({ "n" }, "<space>o", ":FZF<CR>", { silent=true })
			vim.keymap.set({ "n" }, "<space>e", ":Files %:p:h<CR>", { silent=true })
			vim.keymap.set({ "n" }, "<leader>b", ":Buffers<CR>", { silent=true })
			vim.keymap.set({ "x" }, "<leader>a", '"yy:<C-u>Rg <c-r>y<CR>', { silent=true })
			vim.keymap.set({ "n" }, "<leader>a", ":Rg<CR>", { silent=true })
			vim.g.fzf_action = {
				["ctrl-q"]="fill_quickfix",
			}
		end
	},
	{
		"gfanto/fzf-lsp.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local fzf_lsp = require("fzf_lsp")
			vim.lsp.handlers["textDocument/implementation"] = fzf_lsp.implementation_handler
			vim.lsp.handlers["textDocument/references"] = fzf_lsp.references_handler
			vim.lsp.handlers["textDocument/documentSymbol"] = fzf_lsp.document_symbol_handler
		end
	},

	-- Syntax highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function ()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "go", "gomod", "javascript", "json", "yaml", "html", "lua", "dockerfile", "make", "bash", "dart" },
				sync_install = false,
				highlight = { enable = true },
				incremental_selection = { enable = true },
				disable = { "sql" },
			})
		end
	},
	-- Themes
	{ "shaunsingh/nord.nvim", lazy = false },
	{ "catppuccin/nvim", lazy = false },

	-- Airline
	{
		"vim-airline/vim-airline",
		dependencies = { "vim-airline/vim-airline-themes" },
		config = function()
			vim.g.airline_theme=(function(theme)
				if theme == "nord" then return "base16_nord" end
				return theme
			end)(os.getenv("THEME"))
		end
	},

	-- Automatically clears search highlight when cursor is moved
	{ "junegunn/vim-slash" },

	-- Highlights trailing whitespace characters
	{
		"ntpeters/vim-better-whitespace",
		config = function()
			-- strip whitespaces on save
			vim.cmd("autocmd BufEnter * EnableStripWhitespaceOnSave")
		end
	},

	-- Comment stuff out
	{
		"tpope/vim-commentary",
		config = function()
			vim.keymap.set("", "<leader>c", "<Plug>Commentary", { silent=true })
		end
	},

	-- LSP
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{ "neovim/nvim-lspconfig" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-vsnip" },
			{ "hrsh7th/vim-vsnip" },
			{ "hrsh7th/cmp-nvim-lsp-signature-help" }
		},
		config = function()
			vim.opt.completeopt="menu,menuone,noselect"
			local cmp = require("cmp")

			cmp.setup({
				sources = {
					{ name="nvim_lsp" },
					{ name="nvim_lsp_signature_help" },
				},
				snippet = {
					-- REQUIRED - you must specify a snippet engine
					expand = function(args)
						vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
			})

			local nvim_lsp = require("lspconfig")
			local on_attach = function(client, bufnr)
				vim.lsp.handlers["textDocument/hover"]=vim.lsp.with(vim.lsp.handlers.hover, { border="rounded" })
				local opts = { noremap=true, silent=true, buffer=bufnr }
				vim.keymap.set({ "n" }, "K", vim.lsp.buf.hover, opts)
				vim.keymap.set({ "n" }, "<C-]>", vim.lsp.buf.definition, opts)
				vim.keymap.set({ "n" }, "<space>i", vim.lsp.buf.implementation, opts)
				vim.keymap.set({ "n" }, "<space>r", vim.lsp.buf.references, opts)
				vim.keymap.set({ "n" }, "<space>d", vim.lsp.buf.document_symbol, opts)
			end

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Go
			nvim_lsp.gopls.setup({
				on_attach=on_attach,
				capabilities=capabilities
			})

			-- Dart
			nvim_lsp.dartls.setup({
				on_attach=on_attach,
				capabilities=capabilities
			})
		end
	},

	-- Diff and file history logs
	{
		"sindrets/diffview.nvim",
		config = function()
			vim.keymap.set({ "n" }, "<space>l", ":DiffviewFileHistory --no-merges %<CR>", { silent=true })
		end
	},

	-- Neovim + Kitty window navigator
	{
		"knubie/vim-kitty-navigator",
		build = "cp ./*.py ~/.config/kitty/",
		config = function()
			vim.g.kitty_navigator_no_mappings=1
			vim.keymap.set({ "n" }, "<M-h>", ":KittyNavigateLeft<CR>", { silent=true })
			vim.keymap.set({ "n" }, "<M-j>", ":KittyNavigateDown<CR>", { silent=true })
			vim.keymap.set({ "n" }, "<M-k>", ":KittyNavigateUp<CR>", { silent=true })
			vim.keymap.set({ "n" }, "<M-l>", ":KittyNavigateRight<CR>", { silent=true })
		end
	},
})

-- Apply colorscheme
vim.opt.termguicolors=true
if os.getenv("THEME") == "nord" then
	vim.g.nord_bold=false
	vim.g.nord_italic=false
end
vim.cmd.colorscheme(os.getenv("THEME"))

-- clipboard behaviour
vim.opt.clipboard={"unnamedplus"}

-- no backup and swap files
vim.opt.backup=false
vim.opt.swapfile=false

-- search
vim.opt.hlsearch=true
vim.opt.incsearch=true
vim.opt.ignorecase=true
vim.opt.smartcase=true
vim.opt.wrapscan=true

-- lines
vim.opt.wrap=true
vim.opt.linebreak=true
vim.opt.relativenumber=true

-- indent
vim.opt.smartindent=true
vim.opt.expandtab=false
vim.opt.shiftwidth=4

-- scroll
vim.opt.scrolloff=8
vim.opt.sidescrolloff=15
vim.opt.sidescroll=1

-- folding
vim.opt.foldenable=false

-- quit
vim.cmd("cab Q q")
vim.cmd("cab Qa qa")
vim.cmd("cab Qall qall")
vim.cmd("cab qA qa")
vim.cmd("cab QA qa")
vim.cmd("cab Wq wq")

-- netrw file tree browser
vim.g.netrw_banner=0
vim.g.netrw_liststyle=3
vim.g.netrw_hide=0
vim.api.nvim_create_autocmd("FileType", {
	pattern = "netrw",
	callback = function()
		vim.keymap.set({ "n" }, "o", "<CR>", { silent=true, buffer=true, remap=true })
		vim.keymap.set({ "n" }, "a", "%", { silent=true, buffer=true, remap=true })
	end
})

-- keymaps
vim.keymap.set({ "n" }, "<leader>q", ":bdelete<CR>:tabclose<CR>", { silent=true })
vim.keymap.set({ "n" }, "<leader>w", ":only<CR>", { silent=true })
vim.keymap.set({ "n" }, "<leader>v", ":vsplit<CR>", { silent=true })
vim.keymap.set({ "i", "n" }, "<leader>s", "<ESC>:w<CR>:nohls<CR>", { silent=true })
vim.keymap.set({ "n", "v" }, "Y", "yy", { silent=true })
vim.keymap.set({ "i" }, "fd", "<ESC>", { silent=true })
vim.keymap.set({ "n" }, "<C-h>", "<C-w>h", { silent=true })
vim.keymap.set({ "n" }, "<C-j>", "<C-w>j", { silent=true })
vim.keymap.set({ "n" }, "<C-k>", "<C-w>k", { silent=true })
vim.keymap.set({ "n" }, "<C-l>", "<C-w>l", { silent=true })
vim.keymap.set({ "n" }, "j", "gj", { silent=true })
vim.keymap.set({ "n" }, "k", "gk", { silent=true })
vim.keymap.set({ "c" }, "<C-g>", "<C-c>", { silent=true })
vim.keymap.set({ "i", "v", "n" }, "<C-g>", "<ESC>", { silent=true })
vim.keymap.set({ "i" }, "<C-BS>", "<C-w>", { silent=true })
vim.keymap.set({ "n" }, "<space>x", vim.cmd.Ex, { silent=true })


-- Taken from https://github.com/golang/tools/blob/1f10767725e2be1265bef144f774dc1b59ead6dd/gopls/doc/vim.md#neovim-imports
function OrgImports(wait_ms)
	local params = vim.lsp.util.make_range_params()
	params.context = { only = { "source.organizeImports" } }
	local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
	for _, res in pairs(result or {}) do
		for _, r in pairs(res.result or {}) do
			if r.edit then
				vim.lsp.util.apply_workspace_edit(r.edit, "UTF-8")
			else
				vim.lsp.buf.execute_command(r.command)
			end
		end
	end
end

local orgimports_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.go" },
	callback = function()
		OrgImports(1000)
	end,
	group = orgimports_sync_grp
})

local format_sync_grp = vim.api.nvim_create_augroup("GoFmt", {})
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.go" },
	callback = function()
		vim.lsp.buf.format({ sync=true })
	end,
	group = format_sync_grp
})

require("init_local")
