return {
	"Vigemus/iron.nvim",
	config = function()
		local iron = require("iron.core")
		iron.setup({
			config = {
				repl_definition = {
					python = {
						command = { "ipython" },
					},
				},
				repl_open_cmd = require("iron.view").split.vertical.botright(60),
			},
			-- keymaps = {
			-- 	send_motion = "<leader>sc",
			-- 	visual_send = "<leader>sc",
			-- 	send_file = "<leader>sf",
			-- 	send_line = "<leader>sl",
			-- 	send_mark = "<leader>sm",
			-- 	mark_motion = "<leader>mc",
			-- 	mark_visual = "<leader>mc",
			-- 	remove_mark = "<leader>md",
			-- 	cr = "<leader>s<cr>",
			-- 	interrupt = "<leader>s<space>",
			-- 	exit = "<leader>sq",
			-- 	clear = "<leader>cl",
			-- },
			keymaps = {
				toggle_repl = "<space>rr", -- toggles the repl open and closed.
				-- If repl_open_command is a table as above, then the following keymaps are
				-- available
				-- toggle_repl_with_cmd_1 = "<space>rv",
				-- toggle_repl_with_cmd_2 = "<space>rh",
				restart_repl = "<space>rR", -- calls `IronRestart` to restart the repl
				send_motion = "<space>sc",
				visual_send = "<space>sc",
				send_file = "<space>sf",
				send_line = "<space>sl",
				send_paragraph = "<space>sp",
				send_until_cursor = "<space>su",
				send_mark = "<space>sm",
				send_code_block = "<space>sb",
				send_code_block_and_move = "<space>sn",
				mark_motion = "<space>mc",
				mark_visual = "<space>mc",
				remove_mark = "<space>md",
				cr = "<space>s<cr>",
				interrupt = "<space>s<space>",
				exit = "<space>sq",
				clear = "<space>cl",
			},
			highlight = {
				italic = true,
			},
			ignore_blank_lines = true,
		})

		-- Terminal mode navigation and quick-exit keymaps for Iron.nvim REPL
		vim.api.nvim_create_autocmd("TermOpen", {
			pattern = "*",
			callback = function()
				vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], { noremap = true, silent = true, buffer = true })
				vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], { noremap = true, silent = true, buffer = true })
				vim.keymap.set("t", "<C-q>", [[<C-\><C-n>]], { noremap = true, silent = true, buffer = true }) -- <C-q> to exit terminal mode
			end,
		})

		-- Now, <C-q> in terminal mode will instantly exit to normal mode (for Iron.nvim REPL or any terminal window)
	end,
}
