local m = { focusModeOn = false }

function m.toggle()
	if m.focusModeOn == false then
		m.focusModeOn = true
		vim.opt_local.foldcolumn = "0"
		vim.opt_local.colorcolumn = ""
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
		vim.opt_local.signcolumn = "no"
		vim.opt_local.cursorcolumn = false
		vim.opt_local.cursorline = false
		vim.opt_local.laststatus = 0
		require("ibl").update({ enabled = false })
		-- TODO: fix this; this is probably fucking crashing clangd
		-- vim.diagnostic.config{virtual_text=false}
		vim.fn.system({ "tmux", "set", "-g", "status", "off" })
	elseif m.focusModeOn == true then
		m.focusModeOn = false
		vim.opt_local.foldcolumn = "auto"
		vim.opt_local.colorcolumn = "+0,-20,-40"
		vim.opt_local.number = true
		vim.opt_local.relativenumber = true
		vim.opt_local.signcolumn = "auto"
		vim.opt_local.cursorcolumn = true
		vim.opt_local.cursorline = true
		vim.opt_local.laststatus = 3
		require("ibl").update({ enabled = true })
		-- vim.diagnostic.config{virtual_text=true}
		vim.fn.system({ "tmux", "set", "-g", "status", "on" })
	end
end

return m
