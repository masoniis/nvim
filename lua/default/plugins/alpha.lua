return {
    'goolord/alpha-nvim',
    dependencies = 'kyazdani42/nvim-web-devicons', -- startup screen
    config = function()
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

        local doomvim = {
            [[=================     ===============     ===============   ========  ========]],
            [[\\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //]],
            [[||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||]],
            [[|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||]],
            [[||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||]],
            [[|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||]],
            [[||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||]],
            [[|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||]],
            [[||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||]],
            [[||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||]],
            [[||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||]],
            [[||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||]],
            [[||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||]],
            [[||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||]],
            [[||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||]],
            [[||.=='    _-'                                                     `' |  /==.||]],
            [[=='    _-'                        N E O V I M                         \/   `==]],
            [[\   _-'                                                                `-_   /]],
            [[ `''                                                                      ``' ]],
        }

        local headers = { thickvim, classicvim, doomvim }

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
            dashboard.button("p", "  > Plugins", ":Lazy<CR>"),
            dashboard.button("s", "  > Settings", ":e ~/.config/nvim/lua/common/settings.lua<CR>"),
            dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
        }

        local handle = io.popen('fortune')
        local fortune = handle:read("*a")
        handle:close()
        -- dashboard.section.footer.val = fortune

        -- Info text for the footer
        function info_text()
            ---@diagnostic disable-next-line:undefined-field
            local total_plugins = #vim.tbl_keys(_G.packer_plugins)
            local datetime = os.date " %Y-%m-%d   %A"
            local version = vim.version()
            local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch

            return datetime .. "   " .. total_plugins .. " plugins" .. nvim_version_info
        end

        local function info()
            datetime = os.date "  %A, %Y-%m-%d"
            return datetime
        end


        dashboard.section.footer.val = info()

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
    end
}
