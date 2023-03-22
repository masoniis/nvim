return {
	"rcarriga/nvim-notify",
	config = function()
		local status_ok, notify = pcall(require, "notify")
		if not status_ok then
        	print("Status of the plugin nvim-notify is not good.")
           	return
      	end

		--Set default notifications to nvim-notify ones
		vim.notify = notify
	end
}
