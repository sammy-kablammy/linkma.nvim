# linkma

"what's linkma", you ask? 😈

(it's an assortment of markdown utilities)

## quickstart

example setup using lazy.nvim:
```lua

{
    "sammy-kablammy/linkma.nvim",
    config = function()
        local linkma = require("linkma")
        vim.api.nvim_create_autocmd({ "BufEnter" }, {
            pattern = { "*.md" },
            callback = function()
                vim.api.nvim_buf_create_user_command(0, "LinkmaToc", linkma.toc_loclist, {})
                vim.keymap.set("n", "<enter>", linkma.follow_link, { buffer = 0, desc = "follow link" })
                vim.keymap.set("n", "]x", linkma.next_checkbox, { desc = "next checkbox" })
                vim.keymap.set("n", "[x", linkma.previous_checkbox, { desc = "previous checkbox" })
                vim.keymap.set("n", "<c-x>", linkma.toggle_checkbox, { desc = "toggle checkbox" })
                -- text object for links
                vim.keymap.set("x", "il", linkma.select_link_text_object, { buffer = 0, desc = "inner link" })
                vim.keymap.set("o", "il", ":normal vil<cr>", { buffer = 0, desc = "inner link" })
                vim.keymap.set("x", "al", function() linkma.select_link_text_object(true) end, { buffer = 0, desc = "around link" })
                vim.keymap.set("o", "al", ":normal val<cr>", { buffer = 0, desc = "around link" })
            end,
        })
    end,
},

```

## follow link

- opens URLs with `vim.ui.open` (equivalent to linux `xdg-open`)
- opens files formatted with standard markdown syntax
  (`[link](path/to/file.md)`) or wiki links (`[[path/to/file.md]]`)

some examples of links:

```text

- [my beloved](http://neovim.io)
- [my beloved](https://www.neovim.io/)
- [a cool file](path/to/file.md)
- [[path/to/file]]

```

some caveats:

- this plugin assumes links do not span multiple lines (would that even be valid
  markdown? idk)
- parentheses are technically supposed to be valid URL characters, but this
  doesn't match them
- don't put spaces in your file names. if you do, the very fabric of the
  universe might disintegrate

## link textobject

- select a link (`vil`), delete a link (`dal`), etc.
- supports the same set of links supported by `follow_link` (URLs, markdown,
  wikilinks).
- handles inner (`i`) and around (`a`)

## markdown table of contents

generate a table of contents based on `# markdown` `## headings`

```lua

require("linkma.nvim").toc_loclist()

```

## checkbox support

navigate between checkboxes (like `[X] done` or `[ ] not yet done`). also you
can toggle the state of a checkbox.
