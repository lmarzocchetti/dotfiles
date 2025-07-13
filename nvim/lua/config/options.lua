-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.o.tabstop = 4 -- A TAB looks like 4 spaces
vim.o.expandtab = true -- Insert spaces and not TAB
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

vim.opt.colorcolumn = "120"

vim.o.clipboard = "unnamedplus"

if jit then
    local os = jit.os
    if os == "OSX" then
        vim.g.clipboard = "pbcopy"
    else
        vim.g.clipboard = "xsel"
    end
end
