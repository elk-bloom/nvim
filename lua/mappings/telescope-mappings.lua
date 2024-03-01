local M = {}

function M.setup()
    local wk = require("which-key")
    local mappings = {
        ["<leader>"] = {
            f = {
                name = "Find",
                f = { "<cmd>Telescope find_files<cr>", "Find Files" },
                F = { "<cmd>Telescope find_files cwd=false<cr>", "Find Files (no cwd)" },
                b = { "<cmd>Telescope buffers<cr>", "Buffers" },
                h = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
                r = { "<cmd>Telescope oldfiles<cr>", "Recent Files" },
                p = { "<cmd>Telescope projects<cr>", "Projects" },
            },
            -- I would prefer the grep ones to be under `s` for search, so make those edits
            s = {
                g = { "<cmd>Telescope live_grep<cr>", "Grep (root dir)" },
                G = { "<cmd>Telescope live_grep cwd=false<cr>", "Grep (cwd)" },
            },
        },
    }

    wk.register(mappings)
end

return M
