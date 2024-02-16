local M = {}

M.setup = function()
    print("there isn't any setup lol")
end

M.toc_loclist = function()
    vim.cmd([[
        lvimgrep /^\# / %
        lopen
    ]])
end

M.follow_link = function()
    vim.cmd.norm([[0f(lgf]])
end

return M
