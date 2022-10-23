require'alpha'.setup(require'alpha.themes.dashboard'.config)

local alpha = require("alpha")
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


local headers = {thickvim, classicvim}

local function header_chars()
  math.randomseed(os.time())
  return headers[math.random(#headers)]
end

dashboard.section.header.val = header_chars()

-- Set menu
dashboard.section.buttons.val = {
    dashboard.button( "e", "  > New file" , ":ene <BAR> startinsert <CR>"),
    dashboard.button( "f", "  > Find file", ":cd ~/dev/ | Telescope find_files<CR>"),
    dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
	dashboard.button( "b", "  > Bookmarks", ":Telescope marks<CR>"),
	dashboard.button( "t", "嗀 > Themes"   , ":Telescope colorscheme<CR>"),
    dashboard.button( "s", "  > Settings" , ":e ~/.config/nvim/lua/settings.lua<CR>"),
    dashboard.button( "q", "  > Quit NVIM", ":qa<CR>"),
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


--local present, alpha = pcall(require, "alpha")
--
--if not present then
--  return
--end
--
--require("base46").load_highlight "alpha"
--
--local function button(sc, txt, keybind)
--  local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")
--
--  local opts = {
--    position = "center",
--    text = txt,
--    shortcut = sc,
--    cursor = 5,
--    width = 36,
--    align_shortcut = "right",
--    hl = "AlphaButtons",
--  }
--
--  if keybind then
--    opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
--  end
--
--  return {
--    type = "button",
--    val = txt,
--    on_press = function()
--      local key = vim.api.nvim_replace_termcodes(sc_, true, false, true) or ""
--      vim.api.nvim_feedkeys(key, "normal", false)
--    end,
--    opts = opts,
--  }
--end
--
---- dynamic header padding
--local fn = vim.fn
--local marginTopPercent = 0.3
--local headerPadding = fn.max { 2, fn.floor(fn.winheight(0) * marginTopPercent) }
--
--local options = {
--
--  header = {
--    type = "text",
--    val = {
--      "   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ",
--      "    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
--      "          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ",
--      "           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
--      "          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
--      "   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
--      "  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
--      " ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
--      " ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ",
--      "      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
--      "       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
--    },
--    opts = {
--      position = "center",
--      hl = "AlphaHeader",
--    },
--  },
--
--  buttons = {
--    type = "group",
--    val = {
--      button("SPC f f", "  Find File  ", ":Telescope find_files<CR>"),
--      button("SPC f o", "  Recent File  ", ":Telescope oldfiles<CR>"),
--      button("SPC f w", "  Find Word  ", ":Telescope live_grep<CR>"),
--      button("SPC b m", "  Bookmarks  ", ":Telescope marks<CR>"),
--      button("SPC t h", "  Themes  ", ":Telescope themes<CR>"),
--      button("SPC e s", "  Settings", ":e $MYVIMRC | :cd %:p:h <CR>"),
--    },
--    opts = {
--      spacing = 1,
--    },
--  },
--
--  headerPaddingTop = { type = "padding", val = headerPadding },
--  headerPaddingBottom = { type = "padding", val = 2 },
--}
--
--options = require("core.utils").load_override(options, "goolord/alpha-nvim")
--
--alpha.setup {
--  layout = {
--    options.headerPaddingTop,
--    options.header,
--    options.headerPaddingBottom,
--    options.buttons,
--  },
--  opts = {},
--}
--
---- Disable statusline in dashboard
--vim.api.nvim_create_autocmd("FileType", {
--  pattern = "alpha",
--  callback = function()
--    -- store current statusline value and use that
--    local old_laststatus = vim.opt.laststatus
--    vim.api.nvim_create_autocmd("BufUnload", {
--      buffer = 0,
--      callback = function()
--        vim.opt.laststatus = old_laststatus
--      end,
--    })
--    vim.opt.laststatus = 0
--  end,
--})
