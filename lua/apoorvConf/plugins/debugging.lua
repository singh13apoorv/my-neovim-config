return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "jay-babu/mason-nvim-dap.nvim",
        "nvim-neotest/nvim-nio",
        "leoluz/nvim-dap-go", -- For Go debugging
    },
    event = "VeryLazy",
    config = function()
        local dap = require "dap"
        local dapui = require "dapui"
        local dapgo = require "dap-go"

        -- Function to get the Python path from the active Conda environment
        local function get_conda_python_path()
            local conda_prefix = vim.env.CONDA_PREFIX
            if conda_prefix then
                return conda_prefix .. "/bin/python"
            else
                return "/usr/bin/python3"
            end
        end

        -- Setup DAP UI
        require("dapui").setup()

        -- DAP UI listeners
        dap.listeners.before.attach["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.launch["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end

        -- Configure codelldb adapter for C++ and Rust
        dap.adapters.cppdbg = {
            type = "server",
            port = "${port}",
            executable = {
                command = vim.fn.stdpath "data" .. "/mason/bin/codelldb",
                args = { "--port", "${port}" },
            },
        }

        -- C++ Debugging Configuration (Improved)
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
            },
        }

        -- Rust Debugging Configuration (Improved)
        dap.configurations.rust = {
            {
                name = "Launch file",
                type = "cppdbg", -- Use the "cppdbg" adapter defined above
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

        -- Python Configuration (Correct as is)
        dap.adapters.python = {
            type = "executable",
            command = vim.fn.stdpath "data" .. "/mason/packages/debugpy/venv/bin/python",
            args = { "-m", "debugpy.adapter" },
        }
        dap.configurations.python = {
            {
                type = "python",
                request = "launch",
                name = "Launch file",
                program = "${file}",
                pythonPath = get_conda_python_path(),
            },
        }

        -- Go Configuration (Handled by nvim-dap-go)
        dapgo.setup()

        -- Keybindings for DAP
        vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP: Toggle Breakpoint" })
        vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "DAP: Continue" })
        vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "DAP: Step Over" })
        vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "DAP: Step Into" })
        vim.keymap.set("n", "<leader>dq", dap.terminate, { desc = "DAP: Terminate/Quit" })
        vim.keymap.set("n", "<leader>dgt", dapgo.debug_test, { desc = "DAP: Debug Go Test" })
    end,
}
