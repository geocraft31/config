local options = {
	expandtab = true,
	tabstop = 2,
	softtabstop = 2,
	shiftwidth = 2,
	number = true,
	smarttab = true,
	relativenumber = true,
  termguicolors = true,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

return {}
