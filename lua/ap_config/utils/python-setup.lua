if vim.fn.executable('python3') == 1 then
    vim.g.python3_host_prog = 'python3'
elseif vim.fn.executable('python') == 1 then
    vim.g.python3_host_prog = 'python'
else
    print("Warning: Python executable not found!")
end
