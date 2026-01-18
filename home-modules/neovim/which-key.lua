vim.o.timeout = true
vim.o.timeoutlen = 500

vim.g.mapleader = " "

local wk = require("which-key")
wk.add { "<leader>tr", ":NvimTreeFocus<CR>", desc = "File Tree" }
wk.add { "<leader>ctr", ":NvimTreeClose<CR>", desc = "Close File Tree" }
wk.add { "<leader>ut", ":UndotreeToggle<CR>", desc = "Toggle Undo Tree" }

wk.add { "<leader>ex", ":Ex<CR>", desc = "File Explorer" }
wk.add { "<leader>bf", ":buffers<CR>", desc = "Buffers" }

wk.add { "<leader>ff", ":Telescope find_files<CR>", desc = "Find Files" }
wk.add { "<leader>gf", ":Telescope git_files<CR>", desc = "Git Files" }

wk.add { "<leader>sh", ":split<CR>", desc = "Split Horizontally" }
wk.add { "<leader>sv", ":vsplit<CR>", desc = "Split Vertically" }


-- Diagnostics
wk.add { "<leader>nd", function() vim.diagnostic.goto_next{} end,
	desc = "Next Diagnostic Message" }
wk.add { "<leader>nw", function() vim.diagnostic.goto_next{severity=vim.diagnostic.severity.WARN} end,
	desc = "Next Diagnostic Warning" }
wk.add { "<leader>ne", function() vim.diagnostic.goto_next{severity=vim.diagnostic.severity.ERROR} end,
	desc = "Next Diagnostic Error" }

wk.add { "<leader>pd", function() vim.diagnostic.goto_prev{} end,
	desc = "Previous Diagnostic Message" }
wk.add { "<leader>pw", function() vim.diagnostic.goto_prev{severity=vim.diagnostic.severity.WARN} end,
	desc = "Previous Diagnostic Warning" }
wk.add { "<leader>pe", function() vim.diagnostic.goto_prev{severity=vim.diagnostic.severity.ERROR} end,
	desc = "Previous Diagnostic Error" }

