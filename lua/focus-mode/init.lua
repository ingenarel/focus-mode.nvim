local m = {
	focusModeOn = false,
	firstinit = {
		foldcolumn = vim.opt.foldcolumn._value,
		colorcolumn = vim.opt.colorcolumn._value,
		number = vim.opt.number._value,
		relativenumber = vim.opt.relativenumber._value,
		signcolumn = vim.opt.signcolumn._value,
		cursorcolumn = vim.opt.cursorcolumn._value,
		cursorline = vim.opt.cursorline._value,
		laststatus = vim.opt.laststatus._value,
	},
}

function m.toggle()
	if m.focusModeOn then
		m.focusModeOn = false
		vim.opt.foldcolumn = m.firstinit.foldcolumn
		vim.opt.colorcolumn = m.firstinit.colorcolumn
		vim.opt.number = m.firstinit.number
		vim.opt.relativenumber = m.firstinit.relativenumber
		vim.opt.signcolumn = m.firstinit.signcolumn
		vim.opt.cursorcolumn = m.firstinit.cursorcolumn
		vim.opt.cursorline = m.firstinit.cursorline
		vim.opt.laststatus = m.firstinit.laststatus
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
