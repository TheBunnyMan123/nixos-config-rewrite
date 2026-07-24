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
local function open_float()
	vim.diagnostic.open_float{}
end
wk.add { "<leader>nd", function() vim.diagnostic.jump{count=1, on_jump = open_float} end,
	desc = "Next Diagnostic Message" }
wk.add { "<leader>nw", function() vim.diagnostic.jump{severity=vim.diagnostic.severity.WARN, count=1, on_jump = open_float} end,
	desc = "Next Diagnostic Warning" }
wk.add { "<leader>ne", function() vim.diagnostic.jump{severity=vim.diagnostic.severity.ERROR, count=1, on_jump = open_float} end,
	desc = "Next Diagnostic Error" }

