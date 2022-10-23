local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  vim.notify("Lualine failed to initialize.")
  return
end

lualine.setup()
