local builtin = require("telescope.builtin")
local cmp = require("cmp")
local ufo = require("ufo")

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
})

return {
	-- DAP
	vim.keymap.set("n", "<leader>dt", ":lua require('dapui').toggle() <CR>", { desc = "Toggle DAP UI" }),
	vim.keymap.set("n", "<F1>", ":lua require('dap').continue() <CR>", { desc = "Start/Continue Debugging" }),
	vim.keymap.set("n", "<leader>db", ":lua require('dap').toggle_breakpoint() <CR>", { desc = "Toggle Breakpoint" }),
	vim.keymap.set("n", "<leader>dr", ":lua require('dap').restart() <CR>", { desc = "Restart Debugging" }),
	vim.keymap.set("n", "<F3>", ":lua require('dap').step_over() <CR>", { desc = "Step Over" }),
	vim.keymap.set("n", "<F4>", ":lua require('dap').step_into() <CR>", { desc = "Step Into" }),
	vim.keymap.set("n", "<F2>", ":lua require('dap').step_out() <CR>", { desc = "Step Out" }),
	vim.keymap.set("n", "<leader>dx", ":lua require('dap').terminate() <CR>", { desc = "Stop Debugging" }),

	-- UFO
	vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "Opens all folds using UFO" }),
	vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "Closes all folds using UFO" }),
	vim.keymap.set("n", "<leader>pe", function()
		local winid = ufo.peekFoldedLinesUnderCursor()
		if not winid then
			vim.lsp.buf.hover()
		end
	end, { desc = "Peeks into fold" }),

	vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exits terminal mode" }),
	vim.keymap.set("n", "<leader>mi", ":MoltenInit<CR>", { silent = true, desc = "Initialize the plugin" }),
	vim.keymap.set("n", "<leader>e", ":MoltenEvaluateOperator<CR>", { silent = true, desc = "run operator selection" }),
	vim.keymap.set("n", "<leader>rl", ":MoltenEvaluateLine<CR>", { silent = true, desc = "evaluate line" }),
	vim.keymap.set("n", "<leader>rr", ":MoltenReevaluateCell<CR>", { silent = true, desc = "re-evaluate cell" }),
	vim.keymap.set("n", "<leader>img", ":MoltenImagePopup<CR>", { silent = true, desc = "evaluate visual selection" }),
	vim.keymap.set("n", "<C-b>", ":Neotree filesystem toggle right<CR>", {}),
	vim.keymap.set("n", "<leader>b", ":Neotree filesystem toggle float<CR>", {}),
	vim.keymap.set("n", "K", vim.lsp.buf.hover, {}),
	vim.keymap.set("n", "<leader>gd", builtin.lsp_definitions, { desc = "LSP: Get Definition" }),
	vim.keymap.set("n", "<leader>gr", builtin.lsp_references, { desc = "LSP: Get References" }),
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: Code Actions" }),
	vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "LSP: Get Format" }),
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP: ReName" }),
	vim.keymap.set("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", {}),
	vim.keymap.set("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", {}),
	vim.keymap.set("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", {}),
	vim.keymap.set("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", {}),
	vim.keymap.set("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", {}),
	vim.keymap.set("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>", {}),
	vim.keymap.set("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>", {}),
	vim.keymap.set("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>", {}),
	vim.keymap.set("n", "<leader>9", ":BufferLineGoToBuffer 9<CR>", {}),
	vim.keymap.set("n", "<leader>$", ":BufferLineGoToBuffer -1<CR>", {}),
	vim.keymap.set("n", "<C-f>", builtin.find_files, {}),
	vim.keymap.set("n", "<leader>co", ":VimtexCompile<CR>", { desc = "Start compilation of LaTeX files" }),
	vim.keymap.set("n", "<leader>inc", "i\\input{~/latex-config/format.tex}<ESC>i", { desc = "Write input for latex" }),
	vim.keymap.set("n", "<leader>fl", ":foldclose<CR>", { desc = "Fold environment" }),
	vim.keymap.set("v", "<leader>r", ":<C-u>MoltenEvaluateVisual<CR>"),

	-- Window movement
	vim.keymap.set("n", "<A-h>", "<C-W>h", { desc = "Moves to the window on the left" }),
	vim.keymap.set("n", "<A-j>", "<C-W>j", { desc = "Moves to the window below" }),
	vim.keymap.set("n", "<A-k>", "<C-W>k", { desc = "Moves to the window above" }),
	vim.keymap.set("n", "<A-l>", "<C-W>l", { desc = "Moves to the window on the right" }),

	--CPP open header file on side:
	-- vim.keymap.set(
	-- 	"n",
	-- 	"<localleader>h",
	-- 	":vsplit | wincmd l | ClangdSwitchSourceHeader<CR>",
	-- 	{ desc = "Opens header file of cpp file on right side" }
	-- ),

	vim.keymap.set("n", "<leader>h", function()
		local current_win = vim.api.nvim_get_current_win()
		local target_win = nil

		-- Find an existing split window to toggle
		for _, win in ipairs(vim.api.nvim_list_wins()) do
			-- Find a window that is not the current one and not a floating window (relative == "")
			if win ~= current_win and vim.api.nvim_win_get_config(win).relative == "" then
				target_win = win
				break
			end
		end

		if target_win then
			-- If a split window is found, close it (toggle behavior)
			vim.api.nvim_win_close(target_win, true)
		else
			-- Open the header file in a new split
			vim.cmd("vsplit") -- Create a vertical split
			vim.cmd("wincmd l") -- Move to the right window
			vim.cmd("ClangdSwitchSourceHeader") -- Switch to the header file

			-- Ensure normal mode and then move back to the left window
			vim.cmd("sleep 10m") -- Make sure we're in normal mode
			vim.cmd("wincmd h") -- Move back to the left window
		end
	end, { desc = "Toggles the header file on the right and returns focus to the left window" }),

	vim.keymap.set("n", "<leader>/", ":noh<CR>", { desc = "Cancel searach higlight" }),
}
