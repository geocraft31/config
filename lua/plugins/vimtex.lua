return {
	"lervag/vimtex",
	config = function()
		-- local commands_file = vim.fn.expand("~/latex-config/commands.tex")

		vim.g.vimtex_compiler_method = "latexmk"
		vim.g.vimtex_quickfix_mode = 0

		-- Optional: specify LaTeX compiler options
		vim.g.vimtex_compiler_latexmk = {
			out_dir = "pdf",
			options = {
				"-pdf",
				"-shell-escape",
				"-interaction=nonstopmode",
				"-synctex=0",
				"-file-line-error",
				-- "-usepretex=\\input{" .. commands_file .. "}",
			},
		}

		local augroup = vim.api.nvim_create_augroup("vimtex_config", {})
		vim.api.nvim_create_autocmd("User", {
			pattern = "VimtexEventQuit",
			group = augroup,
			desc = "Clean files on exit.",
			command = [[ call vimtex#compiler#clean(0) ]],
		})
    vim.g.vimtex_fold_enabled = true
    vim.g.fillchars="fold:\\"
	end,
}
