require('packer').startup(function()
	use 'wbthomason/packer.nvim'
	use 'marko-cerovac/material.nvim'
	use 'junegunn/vim-slash'
	use 'ntpeters/vim-better-whitespace'
	use 'tpope/vim-commentary'
	use {
		'neovim/nvim-lspconfig',
		'hrsh7th/nvim-cmp',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-vsnip',
		'hrsh7th/vim-vsnip',
	}
	use {
		{ 'junegunn/fzf', dir = '~/.fzf', run = './install --all' },
		{ 'junegunn/fzf.vim' },
	}
	use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
	use 'nvim-tree/nvim-web-devicons'
	use 'nvim-treesitter/nvim-treesitter'
	use 'moll/vim-bbye'
end)

-- term colors
vim.opt.termguicolors=true

-- clipboard behaviour
vim.opt.clipboard={'unnamedplus'}

-- search
vim.opt.hlsearch=true
vim.opt.incsearch=true
vim.opt.ignorecase=true
vim.opt.smartcase=true
vim.opt.wrapscan=true

-- lines
vim.opt.wrap=true
vim.opt.linebreak=true

-- indent
vim.opt.autoindent=true
vim.opt.smartindent=true
vim.opt.copyindent=true
vim.opt.preserveindent=true
vim.opt.softtabstop=0
vim.opt.shiftwidth=4
vim.opt.tabstop=4

-- scroll
vim.opt.scrolloff=8
vim.opt.sidescrolloff=15
vim.opt.sidescroll=1

-- theme
vim.cmd('silent! colorscheme material')
vim.g.material_style='deep ocean'

-- quit
vim.cmd('cab Q q')
vim.cmd('cab Qa qa')
vim.cmd('cab qA qa')
vim.cmd('cab QA qa')
vim.cmd('cab Wq wq')

-- strip whitespaces
vim.cmd('autocmd BufEnter * EnableStripWhitespaceOnSave')

-- treesitter
require('nvim-treesitter.configs').setup({
	ensure_installed={"go", "lua"},
	highlight={enable=true},
	incremental_selection={enable=true},
})

-- leader key
vim.g.mapleader=','

-- keymaps
vim.keymap.set({'n', 'v'}, 'Y', 'yy', { silent=true })
vim.keymap.set({'i', 'n'}, '<leader>s', '<ESC>:w<CR>:nohls<CR>', { silent=true })
vim.keymap.set({'n'}, '<space>o', ':FZF<CR>', { silent=true })
vim.keymap.set({'n'}, '<leader>q', ':Bdelete<CR>', { silent=true })
vim.keymap.set({'n'}, '<leader>w', ':only<CR>', { silent=true })
vim.keymap.set({'n'}, '<leader>v', ':vsplit<CR>', { silent=true })
vim.keymap.set({'n'}, '<leader>b', ':Buffers<CR>', { silent=true })
vim.keymap.set({'n'}, '<leader>d', ':BLines<CR>', { silent=true })
vim.keymap.set({'i'}, 'fd', '<ESC>', { silent=true })
vim.keymap.set({'n'}, '<C-h>', '<C-w>h', { silent=true })
vim.keymap.set({'n'}, '<C-j>', '<C-w>j', { silent=true })
vim.keymap.set({'n'}, '<C-k>', '<C-w>k', { silent=true })
vim.keymap.set({'n'}, '<C-l>', '<C-w>l', { silent=true })
vim.keymap.set({'n'}, 'j', 'gj', { silent=true })
vim.keymap.set({'n'}, 'k', 'gk', { silent=true })
vim.keymap.set('', '<leader>c', '<Plug>Commentary', { silent=true })
vim.keymap.set({'x'}, '<leader>a', '"yy:<C-u>Rg <c-r>y<CR>', { silent=true })
vim.keymap.set({'n'}, '<leader>a', ':Rg<CR>', { silent=true })
vim.keymap.set({'n'}, '<space>dh', ':DiffviewFileHistory %<CR>', { silent=true })
vim.keymap.set({'n'}, '<space>dc', ':DiffviewClose<CR>', { silent=true })

local nvim_lsp=require('lspconfig')
local on_attach=function(client, bufnr)
	local opts={noremap=true, silent=true, buffer=bufnr}
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
	vim.keymap.set('n', '<C-]>', vim.lsp.buf.definition, opts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
end

-- lsp imports
vim.api.nvim_create_autocmd('BufWritePre', {
	pattern = {'*.go'},
	callback = function(args)
		vim.lsp.buf.code_action({context={only={'source.organizeImports'}}, apply=true})
	end,
})

-- lsp format
vim.api.nvim_create_autocmd('BufWritePre', {
	pattern = {'*.go' },
	callback = function(args)
		vim.lsp.buf.format({sync=true})
	end,
})

-- completion
vim.opt.completeopt='menu,menuone,noselect'
local cmp=require('cmp')

cmp.setup({
	sources = {
		{ name='nvim_lsp'},
	},
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
})

-- go
vim.api.nvim_create_autocmd('FileType', {
	pattern={'go'},
	callback=function(args)
		vim.keymap.set({'n'}, '<leader>d', ':BLines ^type\\|^func <CR>', { silent=true, buffer=true })
	end,
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
nvim_lsp.gopls.setup({
	on_attach=on_attach,
	capabilities=capabilities
})

