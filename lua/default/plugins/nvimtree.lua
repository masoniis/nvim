
-- map('n', '<leader>e', ':NvimTreeToggle<CR>')
return {
	"nvim-tree/nvim-tree.lua",
	keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "asdasdNvimtree" },
    },
	config = function()
        local status_ok, nvimtree = pcall(require, "nvim-tree")
        if not status_ok then
            vim.notify("Nvim-tree failed to initialize.")
            return
        end
		nvimtree.setup{
  		sync_root_with_cwd = true,
  		respect_buf_cwd = true,
  		update_focused_file = {
    		enable = true,
    		update_root = true
		},
	}
end
}
 
