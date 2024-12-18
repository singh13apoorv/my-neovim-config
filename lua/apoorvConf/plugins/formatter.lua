return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require "conform"
        -- Define Prettier arguments once
        local prettier_args = { "--tab-width", "4" }
        local python_args = { { "--tab-width", "4" }, { "--max-line-length", "88" } }
        local clang_format_args = { '-style="{IndentWidth: 4}"' }

        conform.setup {
            formatters_by_ft = {
                javascript = { "prettier", args = prettier_args },
                typescript = { "prettier", args = prettier_args },
                javascriptreact = { "prettier", args = prettier_args },
                typescriptreact = { "prettier", args = prettier_args },
                svelte = { "prettier", args = prettier_args },
                css = { "prettier", args = prettier_args },
                html = { "prettier", args = prettier_args },
                json = { "prettier", args = prettier_args },
                yaml = { "prettier", args = prettier_args },
                markdown = { "prettier", args = prettier_args },
                graphql = { "prettier", args = prettier_args },
                liquid = { "prettier", args = prettier_args },
                lua = { "stylua", args = prettier_args },
                python = { "isort", "black", args = python_args },
                cpp = { "clang-format", args = clang_format_args },
                rust = { "clang-format", args = clang_format_args },
            },
            format_on_save = {
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            },
        }

        vim.keymap.set({ "n", "v" }, "<leader>mp", function()
            conform.format {
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            }
        end, { desc = "Format file or range (in visual mode)" })
    end,
}
