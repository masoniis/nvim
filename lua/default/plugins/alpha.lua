-- Protected require alpha
local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
    print("Status of the plugin Alpha is not good.")
    return
end

-- Setup for themes dashboard
require 'alpha'.setup(require 'alpha.themes.dashboard'.config)

local dashboard = require("alpha.themes.dashboard")
-- Set header
local thickvim = {
    "                                                     ",
    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "                                                     ",
}

local classicvim = {
    [[                               __                ]],
    [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
    [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
    [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
    [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
    [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}

local headers = { thickvim, classicvim }

local function header_chars()
    math.randomseed(os.time())
    return headers[math.random(#headers)]
end

dashboard.section.header.val = header_chars()

-- Set menu
dashboard.section.buttons.val = {
    dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("f", "  > Find file", ":cd ~/dev/ | Telescope find_files<CR>"),
    dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
    dashboard.button("b", "  > Bookmarks", ":Telescope marks<CR>"),
    dashboard.button("t", "嗀 > Themes", ":Telescope colorscheme<CR>"),
    dashboard.button("s", "  > Settings", ":e ~/.config/nvim/lua/common/settings.lua<CR>"),
    dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
}

local handle = io.popen('fortune')
local fortune = handle:read("*a")
handle:close()
dashboard.section.footer.val = fortune

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])

-- Hide cursor on alpha buffer
vim.api.nvim_create_autocmd('User', {
    pattern = 'AlphaReady',
    desc = 'hide cursor for alpha',
    callback = function()
        local hl = vim.api.nvim_get_hl_by_name('Cursor', true)
        hl.blend = 100
        vim.api.nvim_set_hl(0, 'Cursor', hl)
        vim.opt.guicursor:append('a:Cursor/lCursor')
    end,
})

-- Show cursor after alpha buffer
vim.api.nvim_create_autocmd('BufUnload', {
    buffer = 0,
    desc = 'show cursor after alpha',
    callback = function()
        local hl = vim.api.nvim_get_hl_by_name('Cursor', true)
        hl.blend = 0
        vim.api.nvim_set_hl(0, 'Cursor', hl)
        vim.opt.guicursor:remove('a:Cursor/lCursor')
    end,
})
