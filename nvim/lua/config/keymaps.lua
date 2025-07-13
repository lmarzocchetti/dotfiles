-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

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
