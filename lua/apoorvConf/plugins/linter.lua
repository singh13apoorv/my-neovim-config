return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local lint = require "lint"

        local function get_conda_pylint_path()
            local conda_prefix = vim.env.CONDA_PREFIX
            if conda_prefix then
                -- Return the full path to the pylint executable inside the active Conda environment
                return conda_prefix .. "/bin/pylint"
            else
                -- Fallback to system pylint if no Conda environment is active
                return "/usr/local/bin/pylint"
            end
        end

        lint.linters_by_ft = {
            javascript = { "eslint_d" },
            typescript = { "eslint_d" },
            javascriptreact = { "eslint_d" },
            typescriptreact = { "eslint_d" },
            svelte = { "eslint_d" },
            python = {
                command = get_conda_pylint_path(), -- Call the function to get the path
                args = { "--from-stdin", "%:p" }, -- Example args to pass, modify as needed
                stream = "stdout",
                ignore_exitcode = true, -- Ignore exit code to allow further handling
                env = { PYTHONPATH = vim.env.PYTHONPATH },
            },
        }

        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            group = lint_augroup,
            callback = function()
                lint.try_lint()
            end,
        })

        vim.keymap.set("n", "<leader>l", function()
            lint.try_lint()
        end, { desc = "Trigger linting for current file" })
    end,
}
