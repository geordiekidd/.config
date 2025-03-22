return {
  "lervag/vimtex",
  lazy = false,
  init = function()
    vim.g.vimtex_view_method = 'skim' -- for variant without xdotool to avoid errors in wayland
    vim.g.vimtex_syntax_enabled = 1
    vim.g.vimtex_quickfix_mode = 0              -- suppress error reporting on save and build
    -- vim.g.vimtex_mappings_enabled = 1           -- Ignore mappings
    -- vim.g.vimtex_indent_enabled = 0             -- Auto Indent
    vim.g.tex_flavor = 'latex'                  -- how to read tex files
    -- vim.g.tex_indent_items = 1                  -- turn off enumerate indent
    -- vim.g.tex_indent_brace = 0                  -- turn off brace indent
    vim.g.vimtex_context_pdf_viewer = 'skim'  -- external PDF viewer run from vimtex menu command
    vim.g.vimtex_texcount_custom_arg = '-merge' -- count all included files in each texcount
    vim.g.vimtex_log_ignore = ({                -- Error suppression:
      'Underfull',
      'Overfull',
      'specifier changed to',
      'Token not allowed in a PDF string',
    })
    -- local options = string.format(
    --     '--reuse-window --inverse-search="nvr --servername %s +%%2 %%1" --forward-search-file @tex --forward-search-line @line @pdf',
    --       vim.v.servername
    -- )
    -- local command = string.format(
    --   "let g:vimtex_view_general_options='%s'",
    --   options
    -- )
    -- vim.cmd(command)
    -- vim.cmd("let g:vimtex_compiler_progname='nvr'")
  end,
}
