local status_ok, cmp = pcall(require, "flutter-tools")
if not status_ok then
  vim.notify("flutter-tools failed to initialize.")
  return
end
