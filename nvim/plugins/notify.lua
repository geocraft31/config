return {
	"https://github.com/rcarriga/nvim-notify",
	config = function()
		vim.notify = require("notify")
		require("notify").setup({
			stages = "slide",
		})
	end,
}
