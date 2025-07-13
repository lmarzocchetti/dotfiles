-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")

local M = {}

M.dap = {
    n = {
        ["<leader>db"] = {
            "<cmd> DapToggleBreakpoint <CR>",
            "Toggle breakpoint",
        },
        ["<leader>do"] = {
            "<cmd> DapStepOver <CR>",
            "Step Over",
        },
        ["<leader>di"] = {
            "<cmd> DapStepInto <CR>",
            "Step Into",
        },
        ["<leader>dc"] = {
            "<cmd> DapContinue <CR>",
            "Continue execution",
        },
    },
}

return M
