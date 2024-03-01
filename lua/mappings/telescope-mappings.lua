local M = {}

function M.setup()
    local wk = require("which-key")
    local mappings = {
        ["<leader>"] = {
            f = {
                name = "Find",
                f = { "<cmd>Telescope git_files<cr>", "Find Git Files" },
                F = { "<cmd>Telescope git_files cwd=false<cr>", "Find Git Files (no cwd)" },
                v = { "<cmd>Telescope find_files<cr>", "Find Files" },
                V = { "<cmd>Telescope find_files cwd=false<cr>", "Find Files (no cwd)" },
                b = { "<cmd>Telescope buffers<cr>", "Buffers" },
                h = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
                r = { "<cmd>Telescope oldfiles<cr>", "Recent Files" },
                p = { "<cmd>Telescope projects<cr>", "Projects" },
            },
            s = {
                g = { "<cmd>Telescope live_grep<cr>", "Grep (root dir)" },
                G = { "<cmd>Telescope live_grep cwd=false<cr>", "Grep (cwd)" },
            },
        },
    }

    wk.register(mappings)
end

return M
