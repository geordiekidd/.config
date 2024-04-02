return {
  "kylechui/nvim-surround",
  event = { "BufReadPre", "BufNewFile" },
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  config = function()
    require("nvim-surround").setup({
      keymaps = {
        insert = "<C-g>s",
        insert_line = false,
        normal = "ys",
        normal_cur = "yss",
        normal_line = false,
        normal_cur_line = false,
        visual = "<S-s>",
        visual_line = false,
        delete = "cs",
        change = false,
      },
      aliases = {
        ["a"] = false,
        ["b"] = false,
        ["B"] = false,
        ["r"] = false,
        ["q"] = false,
        ["s"] = false,
      },
    })
  end
}
