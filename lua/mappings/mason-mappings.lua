local M = {}

function M.setup()
    local wk = require("which-key")

    local global_mappings = {
        ["<space>"] = {
            e = { vim.diagnostic.open_float, "Open diagnostic float" },
            q = { vim.diagnostic.setloclist, "Set location list" },
        },
        ["["] = {
            d = { vim.diagnostic.goto_prev, "Previous diagnostic" },
        },
        ["]"] = {
            d = { vim.diagnostic.goto_next, "Next diagnostic" },
        },
    }

    wk.register(global_mappings)

    -- thx u/lakenta: https://www.reddit.com/r/neovim/comments/13wcqdr/comment/jmbgqo5/
    vim.api.nvim_create_user_command("DiagnosticToggle", function()
        local config = vim.diagnostic.config
        local vt = config().virtual_text
        config {
            virtual_text = not vt,
            underline = not vt,
            signs = not vt,
        }
    end, { desc = "toggle diagnostic" })

    vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
            local bufnr = ev.buf
            local opts = { buffer = bufnr }

            local lsp_mappings = {
                g = {
                    D = { vim.lsp.buf.declaration, "Go to declaration", opts },
                    d = { vim.lsp.buf.definition, "Go to definition", opts },
                    i = { vim.lsp.buf.implementation, "Go to implementation", opts },
                    r = { vim.lsp.buf.references, "References", opts },
                    K = { vim.lsp.buf.signature_help, "Signature help", opts },
                    o = { vim.diagnostic.open_float, "Open diagnostic float", opts },
                    l = { ":DiagnosticToggle<CR>", "Toggle diagnostics", opts },
                },
                K = { vim.lsp.buf.hover, "Hover", opts },
                -- ["<gK>"] = { vim.lsp.buf.signature_help, "Signature help", opts },
                ["<leader>"] = {
                    name = "LSP",
                    wa = { vim.lsp.buf.add_workspace_folder, "Add workspace folder", opts },
                    wr = { vim.lsp.buf.remove_workspace_folder, "Remove workspace folder", opts },
                    wl = { function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end, "List workspace folders", opts },
                    D = { vim.lsp.buf.type_definition, "Type definition", opts },
                    rn = { vim.lsp.buf.rename, "Rename", opts },
                    ca = { vim.lsp.buf.code_action, "Code action", opts },
                    cf = { function() vim.lsp.buf.format { async = true } end, "Format", opts },
                },
            }

            wk.register(lsp_mappings, opts)
        end,
    })
end

return M
