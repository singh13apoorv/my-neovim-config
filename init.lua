require "apoorvConf.lazy"
require "apoorvConf.myConf.init"

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

-- Set the Python executable for Neovim to the one from the active Conda environment
vim.g.python3_host_prog = get_conda_python_path()
