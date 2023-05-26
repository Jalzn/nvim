local hop = require("hop")

local directions = require("hop.hint").HintDirection

hop.setup()

vim.keymap.set("", "f", function()
	hop.hint_char2({ direction = directions.AFTER_CURSOR })
end, { remap = true })
vim.keymap.set("", "F", function()
	hop.hint_char2({ direction = directions.BEFORE_CURSOR })
end, { remap = true })
