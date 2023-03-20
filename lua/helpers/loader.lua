-- These are helper functions for the init.lua

-- Import modules rather than requiring, to unload them so updates are applied.
local function import(module)
    package.loaded[module] = nil
    return require(module)
end

-- Function to load a directory of .lua files that way it doesn't have to be done manually.
local function import_dir(path)
    for _, file in ipairs(vim.fn.readdir(path)) do
        local file_path = path .. '/' .. file
        -- If it's a directory, then recursively call
        if vim.fn.isdirectory(file_path) == 1 then
            import_dir(file_path)
        elseif file:match('%.lua$') then
            vim.cmd('luafile ' .. file_path)
        end
    end
end

return {
    import = import,
    import_dir = import_dir
}
