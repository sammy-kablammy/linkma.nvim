# linkma

_navigate ya' markdown files_

- create markdown table of contents
- follow local markdown links formatted like `[name](filepath)`

## example configuration

example setup using lazy.nvim:
```lua
{
    "sammy-kablammy/linkma.nvim",
    config = function()
        local linkma = require("linkma")
        vim.api.nvim_create_autocmd({ "BufEnter" }, {
            pattern = { "*.md", },
            callback = function()
                vim.api.nvim_buf_create_user_command(0, "LinkmaToc", linkma.toc_loclist, {})
                vim.keymap.set("n", "<leader>lk", linkma.follow_link, { buffer = 0, })
            end,
        })
    end,
},
```
