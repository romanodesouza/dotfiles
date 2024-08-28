local lazypath=vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
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
		"ibhagwan/fzf-lua",
		dependencies={ "nvim-tree/nvim-web-devicons" },
		config=function()
			local fzf_lua=require("fzf-lua")

			fzf_lua.setup({
				"fzf-native",
				winopts={
					preview={ default=false },
				},
				files={
					cmd=os.getenv("FZF_DEFAULT_COMMAND"),
				},
				grep={
					actions={
						["ctrl-g"]=false,
					},
				},
			})

			vim.keymap.set({ "n" }, "<space>o", "<Cmd>FzfLua files<CR>", { silent=true })
			vim.keymap.set({ "n" }, "<leader>b", "<Cmd>FzfLua buffers<CR>", { silent=true })
			vim.keymap.set({ "x" }, "<leader>a", "<Cmd>FzfLua grep_visual<CR>", { silent=true })
			vim.keymap.set({ "n" }, "<leader>a", "<Cmd>FzfLua grep<CR>", { silent=true })
		end
	},

	-- Themes
	{
		"tinted-theming/base16-vim",
		lazy=false,
		config=function()
			vim.opt.termguicolors=true
			vim.cmd.colorscheme "base16-catppuccin-frappe"
		end
	},

	-- Airline
	{
		"vim-airline/vim-airline",
		dependencies={ "vim-airline/vim-airline-themes" },
	},

	-- Automatically clears search highlight when cursor is moved
	{ "junegunn/vim-slash" },

	-- Highlights trailing whitespace characters
	{
		"ntpeters/vim-better-whitespace",
		config=function()
			-- strip whitespaces on save
			vim.cmd("autocmd BufEnter * EnableStripWhitespaceOnSave")
		end
	},

	-- Comment stuff out
	{
		"tpope/vim-commentary",
		config=function()
			vim.keymap.set("", "<leader>c", "<Plug>Commentary", { silent=true })
		end
	},

	-- Indentation auto detection
	{
		"tpope/vim-sleuth",
	}
})

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

-- line numbers
vim.opt.number=true

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
	pattern="netrw",
	callback=function()
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

vim.api.nvim_create_autocmd("FileType", {
	pattern={ "make", "go", "lua", "sh" },
	callback=function()
		vim.opt_local.tabstop=4
		vim.opt_local.shiftwidth=4
	end
})

vim.api.nvim_create_autocmd("FileType", {
	pattern={ "yaml" },
	callback=function()
		vim.opt_local.tabstop=2
		vim.opt_local.shiftwidth=2
	end
})

require("init_local")
