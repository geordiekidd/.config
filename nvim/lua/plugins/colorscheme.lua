-- CATPPUCCIN
return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
		})
		vim.cmd.colorscheme("catppuccin")
		vim.o.background = "dark"
	end,
}

-- TOKYO NIGHT
-- return {
--   "folke/tokyonight.nvim",
--   lazy = false,
--   priority = 1000,
--   opts = {},
--   config = function()
--     vim.cmd.colorscheme("tokyonight-storm")
--   end
-- }

-- KANAGAWA
-- return {
--   "rebelot/kanagawa.nvim",
--   name = "kanagawa",
--   config = function()
--     require("kanagawa").setup({
--       colors = {
--         theme = {
--           all = {
--             ui = {
--               bg_gutter = "none"
--             }
--           }
--         }
--       }
--     })
--     require("kanagawa").load("wave")
--   end,
-- }

-- SOLARIZED
-- return {
--   'maxmx03/solarized.nvim',
--   lazy = false,
--   priority = 1000,
--   ---@type solarized.config
--   opts = {},
--   config = function(_, opts)
--     vim.o.termguicolors = true
--     vim.o.background = 'dark'
--     require('solarized').setup(opts)
--     vim.cmd.colorscheme 'solarized'
--   end,
-- }

-- EDGE
-- return {
--   "sainnhe/edge",
--   name = "edge",
--   priority = 1000,
--   config = function()
--     vim.cmd("colorscheme edge")
--     -- vim.o.background = "light"
--   end,
-- }

-- BLULOCO
-- return {
--  'uloco/bluloco.nvim',
--    lazy = false,
--    priority = 1000,
--    dependencies = { 'rktjmp/lush.nvim' },
--    config = function()
--    -- your optional config goes here, see below.
--      require("bluloco").setup({
--        style = "auto",
--        transparent = false,
--        italics = true,
--        guicursor = true,
--      })
--      vim.cmd('colorscheme bluloco')
--  end,
-- }

-- GRUVBOX
-- return {
--    "ellisonleao/gruvbox.nvim",
--    priority = 1000, -- make sure to load this before all the other start plugins
--    config = function()
--       vim.cmd("colorscheme gruvbox")
--    end,
-- }


-- -- NIGHTFLY
-- return {
--   "bluz71/vim-nightfly-guicolors",
--   priority = 1000, -- make sure to load this before all the other start plugins
--   config = function()
--     -- load the colorscheme here
--     vim.cmd("colorscheme nightfly")
--   end,
-- }
