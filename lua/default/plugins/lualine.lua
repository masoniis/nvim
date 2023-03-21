return {
  'nvim-lualine/lualine.nvim', -- cool status line bar	
  name = "lualine",
  version = "v3.*",
  dependencies = 'kyazdani42/nvim-web-devicons',
  config = function()
    require("lualine").setup {}
  end
}
