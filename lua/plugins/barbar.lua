local bufferline_status_ok, bufferline = pcall(require, "bufferline")
if not bufferline_status_ok then
  vim.notify("Bufferline failed to initialize.")
  return
end

