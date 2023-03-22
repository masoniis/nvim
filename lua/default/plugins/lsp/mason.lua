return {
	"williamboman/mason.nvim",
	config = function()
		local status_ok, mason = pcall(require, "mason")
		if not status_ok then
		  vim.notify("Mason.nvim failed to initialize.")
		  return
		end

		mason.setup()
	end
}
