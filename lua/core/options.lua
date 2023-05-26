local options = {
	backup = false,
	clipboard = "unnamedplus",
	cmdheight = 0,
	number = true,
	relativenumber = true,
	expandtab = true,
	shiftwidth = 2,
	tabstop = 2,
	background = "dark",
	title = true,
	signcolumn = "yes",
	wrap = false,
	fileencoding = "utf-8",
	incsearch = true,
	hlsearch = true,
	swapfile = false,
	termguicolors = true,
	cursorline = true,
	syntax = "on",
	pumheight = 8,
	pumwidth = 10,
	splitbelow = true,
	splitright = true,
	timeout = true,
	timeoutlen = 300,
	updatetime = 500,
}

for key, value in pairs(options) do
	vim.opt[key] = value
end

vim.g.mapleader = " "
