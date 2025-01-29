return {
	{
		"akinsho/flutter-tools.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim",
		},
		config = function()
			require("flutter-tools").setup({
				lsp = {
					color = {
						enabled = true,
						background = true,
					},
					settings = {
						showTodos = true,
						renameFilesWithClasses = "prompt",
					},
				},
				debugger = {
					enabled = true,
					run_via_dap = true,
				},
				widget_guides = {
					enabled = true,
				},
			})
		end,
	},
}
