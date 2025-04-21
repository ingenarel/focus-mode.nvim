local m = { focusModeOn = false, firstinit = { foldcolumn = vim.opt.foldcolumn._value } }

function m.toggle()
	if m.focusModeOn then
		m.focusModeOn = false
		vim.opt.foldcolumn = "auto"
		vim.opt.colorcolumn = "+0,-20,-40"
		vim.opt.number = true
		vim.opt.relativenumber = true
		vim.opt.signcolumn = "auto"
		vim.opt.cursorcolumn = true
		vim.opt.cursorline = true
		vim.opt.laststatus = 3
		require("ibl").update({ enabled = true })
		-- vim.diagnostic.config{virtual_text=true}
		vim.fn.system({ "tmux", "set", "-g", "status", "on" })
	else
		m.focusModeOn = true
		vim.opt.foldcolumn = "0"
		vim.opt.colorcolumn = ""
		vim.opt.number = false
		vim.opt.relativenumber = false
		vim.opt.signcolumn = "no"
		vim.opt.cursorcolumn = false
		vim.opt.cursorline = false
		vim.opt.laststatus = 0
		require("ibl").update({ enabled = false })
		-- TODO: fix this; this is probably fucking crashing clangd
		-- vim.diagnostic.config{virtual_text=false}
		vim.fn.system({ "tmux", "set", "-g", "status", "off" })
	end
end

return m
