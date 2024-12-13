-- Function to get the Python path from the active Conda environment
local function get_conda_python_path()
    local conda_prefix = vim.env.CONDA_PREFIX
    if conda_prefix then
        -- Return the full path to the Python executable inside the active Conda environment
        return conda_prefix .. "/bin/python"
    else
        -- Fallback to system Python if no Conda environment is active
        return "/usr/bin/python3"
    end
end

return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "jay-babu/mason-nvim-dap.nvim",
        "nvim-neotest/nvim-nio",
    },
    config = function()
        local dap = require "dap"
        local dapui = require "dapui"

        -- Setup DAP UI
        require("dapui").setup()

        -- Open/close UI automatically
        dap.listeners.before.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end

        -- Configure codelldb as adapter
        dap.adapters.cppdbg = {
            type = "server",
            port = "${port}",
            executable = {
                command = vim.fn.stdpath "data" .. "/mason/bin/codelldb",
                args = { "--port", "${port}" },
            },
        }

        -- C++ Debugging Configuration
        dap.configurations.cpp = {
            {
                name = "Launch file",
                type = "cppdbg",
                request = "launch",
                program = function()
                    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                end,
                cwd = "${workspaceFolder}",
                stopAtEntry = false,
                setupCommands = {
                    {
                        text = "-enable-pretty-printing",
                        description = "Enable pretty printing",
                        ignoreFailures = false,
                    },
                },
                MIDebuggerPath = "/opt/homebrew/opt/llvm/bin/lldb", -- Correct path for lldb
                MIMode = "lldb", -- Debugger mode
            },
        }

        -- Rust Debugging Configuration
        dap.configurations.rust = {
            {
                name = "Launch file",
                type = "codelldb",
                request = "launch",
                program = function()
                    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
                end,
                cwd = "${workspaceFolder}",
                stopAtEntry = false,
                setupCommands = {
                    {
                        text = "-enable-pretty-printing",
                        description = "Enable pretty printing",
                        ignoreFailures = false,
                    },
                },
            },
        }

        -- Configure debugpy as adapter
        dap.adapters.python = {
            type = "executable",
            command = vim.fn.stdpath "data" .. "/mason/packages/debugpy/venv/bin/python",
            args = { "-m", "debugpy.adapter" },
        }

        local python_path = get_conda_python_path()

        -- Python Debugging Configuration
        dap.configurations.python = {
            {
                type = "python",
                request = "launch",
                name = "Launch file",
                program = "${file}",
                pythonPath = python_path,
            },
        }

        -- Configure delve as adapter
        dap.adapters.go = {
            type = "server",
            port = "${port}",
            executable = {
                command = vim.fn.stdpath "data" .. "/mason/bin/dlv",
                args = { "dap", "-l", "127.0.0.1:${port}" },
            },
        }

        -- Go Debugging Configuration
        dap.configurations.go = {
            {
                type = "go",
                name = "Debug",
                request = "launch",
                program = "${file}",
            },
        }

        -- Keybindings for DAP
        vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, {})
        vim.keymap.set("n", "<leader>dc", dap.continue, {})
        vim.keymap.set("n", "<leader>do", dap.step_over, {})
        vim.keymap.set("n", "<leader>di", dap.step_into, {})
        vim.keymap.set("n", "<leader>dq", dap.terminate, {})
    end,
}
