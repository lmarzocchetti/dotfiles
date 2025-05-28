local M = {}

M.dap = {
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Toggle breakpoint"
    },
    ["<leader>do"] = {
      "<cmd> DapStepOver <CR>",
      "Step Over"
    },
    ["<leader>di"] = {
      "<cmd> DapStepInto <CR>",
      "Step Into"
    },
    ["<leader>dc"] = {
      "<cmd> DapContinue <CR>",
      "Continue execution"
    },
  }
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function ()
        require("dap-python").test_method()
      end
    }
  }
}

return M
