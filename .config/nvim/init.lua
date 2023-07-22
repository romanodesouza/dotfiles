require('packer').startup(function()
	use 'wbthomason/packer.nvim'
	use 'marko-cerovac/material.nvim'
	use 'junegunn/vim-slash'
	use 'ntpeters/vim-better-whitespace'
	use 'tpope/vim-commentary'
	use {
		{ 'junegunn/fzf', dir = '~/.fzf', run = './install --all' },
		{ 'junegunn/fzf.vim' },
	}
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
vim.opt.number=true

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
vim.cmd('cab Qall qall')
vim.cmd('cab qA qa')
vim.cmd('cab QA qa')
vim.cmd('cab Wq wq')

-- strip whitespaces
vim.cmd('autocmd BufEnter * EnableStripWhitespaceOnSave')

-- leader key
vim.g.mapleader=','

-- keymaps
vim.keymap.set({'n', 'v'}, 'Y', 'yy', { silent=true })
vim.keymap.set({'i', 'n'}, '<leader>s', '<ESC>:w<CR>:nohls<CR>', { silent=true })
vim.keymap.set({'n'}, '<space>o', ':FZF<CR>', { silent=true })
vim.keymap.set({'n'}, '<space>e', ':Files %:p:h<CR>', { silent=true })
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
vim.keymap.set({'c'}, '<C-g>', '<C-c>', { silent=true })
vim.keymap.set({'i','v', 'n'}, '<C-g>', '<ESC>', { silent=true })
