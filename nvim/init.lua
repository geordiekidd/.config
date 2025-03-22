require("core")
require("bootstrap")
-- Somewhere in your Neovim startup, e.g. init.lua
require("luasnip").config.set_config({ -- Setting LuaSnip config
  -- Enable autotriggered snippets
  enable_autosnippets = true,

  -- Use Tab (or some other key if you prefer) to trigger visual selection
  store_selection_keys = "<Tab>",

})

vim.cmd[[
    " Expand or jump in insert mode
    imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'

    " Jump forward through tabstops in visual mode
    smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'

]]

-- vim.cmd[[
--     " Change VimTeX view method to Skim
--     let g:vimtex_view_method = 'skim'
--
--     " Change default TeXcount argument(s)
--     let g:vimtex_texcount_custom_arg = '-merge'
--
--     " Disable VimTeX syntax
--     let g:vimtex_syntax_enabled = 1
-- ]]

vim.g.neovide_title_background_color = string.format(
  "%x",
    vim.api.nvim_get_hl(0, {id=vim.api.nvim_get_hl_id_by_name("Normal")}).bg
)
