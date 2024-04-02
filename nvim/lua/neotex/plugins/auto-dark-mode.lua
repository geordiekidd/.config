return {
  "f-person/auto-dark-mode.nvim",
  opts = {
    update_interval = 1000,
    set_dark_mode = function()
      vim.api.nvim_set_option("background", "dark")
      vim.cmd("colorscheme catppuccin-frappe")
      -- vim.cmd("colorscheme bluloco") -- for BluLoco
    end,
    set_light_mode = function()
      vim.api.nvim_set_option("background", "light")
      vim.cmd("colorscheme catppuccin")
      --vim.cmd("colorscheme bluloco") -- as above
    end,
  },
}
