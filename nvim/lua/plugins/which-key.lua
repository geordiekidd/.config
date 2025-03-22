local opts = { nowait = true, remap = false }
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 200
  end,
  opts = {
    setup = {
      show_help = true,
      plugins = {
        presets = {
          operators = false,    -- adds help for operators like d, y, ... and registers them for motion / text object completion
          motions = false,      -- adds help for motions
          text_objects = false, -- help for text objects triggered after entering an operator
          windows = false,      -- default bindings on <c-w>
          nav = false,          -- misc bindings to work with windows
          z = false,            -- bindings for folds, spelling and others prefixed with z
          g = false,            -- bindings for prefixed with g
          marks = false,        -- shows a list of your marks on ' and `
          registers = false,    -- shows your registers on " in NORMAL or <C-r> in INSERT mode
          spelling = {
            enabled = false,    -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 10,   -- how many suggestions should be shown in the list?
          },
          -- the presets plugin, adds help for a bunch of default keybindings in Neovim
          -- No actual key bindings are created
        },
      },
      replace = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        -- ["<space>"] = "SPC",
        -- ["<CR>"] = "RET",
        -- ["<tab>"] = "TAB",
      },
      -- triggers = "auto", -- automatically setup triggers
      triggers = { "<leader>" }, -- or specify a list manually
      -- add operators that will trigger motion and text object completion
      -- to enable native operators, set the preset / operators plugin above
      -- operators = { gc = "Comments" },
      icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+",      -- symbol prepended to a group
      },
      keys = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>",   -- binding to scroll up inside the popup
      },
      win = {
        border = "rounded",
        no_overlap = true,
        padding = { 2, 2 },
        title = false,
        zindex = 1000,
        wo = {
          winblend = 20,
        },
      },
      layout = {
        height = { min = 4, max = 25 },                                             -- min and max height of the columns
        width = { min = 20, max = 50 },                                             -- min and max width of the columns
        spacing = 3,                                                                -- spacing between columns
        align = "left",                                                             -- align columns left, center or right
      },
      -- ignore_missing = true,                                                        -- enable this to hide mappings for which you didn't specify a label
      -- hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
      -- delay = {
      -- },
      -- triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
      --  i = { "j", "k" },
      --  v = { "j", "k" },
      -- },
      -- disable the WhichKey popup for certain buf types and file types.
      -- Disabled by default for Telescope
      disable = {
        buftypes = {},
        filetypes = {},
      },
    },
    defaults = {
      buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
      mode = { "n", "v" },
      { "<leader>L", group = "LSP", opts },
      { "<leader>LD", "<cmd>lua vim.lsp.buf.declaration()<CR>", desc = "declaration", opts },
      { "<leader>LR", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "rename", opts },
      { "<leader>LT", "<cmd>Telescope lsp_type_definitions<CR>", desc = "type definition", opts },
      { "<leader>Lb", "<cmd>Telescope diagnostics bufnr=0<CR>", desc = "buffer diagnostics", opts },
      { "<leader>Lc", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "code action", opts },
      { "<leader>Ld", "<cmd>Telescope lsp_definitions<CR>", desc = "definition", opts },
      { "<leader>Lh", "<cmd>lua vim.lsp.buf.hover()<CR>", desc = "help", opts },
      { "<leader>Li", "<cmd>Telescope lsp_implementations<CR>", desc = "implementations", opts },
      { "<leader>Lk", "<cmd>LspStop<CR>", desc = "kill lsp", opts },
      { "<leader>Ll", "<cmd>lua vim.diagnostic.open_float()<CR>", desc = "line diagnostics", opts },
      { "<leader>Ln", "<cmd>lua vim.diagnostic.goto_next()<CR>", desc = "next diagnostic", opts },
      { "<leader>Lp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", desc = "previous diagnostic", opts },
      { "<leader>Lr", "<cmd>Telescope lsp_references<CR>", desc = "references", opts },
      { "<leader>Ls", "<cmd>LspRestart<CR>", desc = "restart lsp", opts },
      { "<leader>Lt", "<cmd>LspStart<CR>", desc = "start lsp", opts },

      { "<leader>S", group = "SESSIONS", opts },
      { "<leader>Sd", "<cmd>SessionManager delete_session<CR>", desc = "delete", opts },
      { "<leader>Sl", "<cmd>SessionManager load_session<CR>", desc = "load", opts },
      { "<leader>Ss", "<cmd>SessionManager save_current_session<CR>", desc = "save", opts },

      { "<leader>v", group = "VIMTEX", opts },
      { "<leader>vc", "<cmd>:VimtexClearCache All<CR>", desc = "clear vimtex", opts },
      { "<leader>ve", "<cmd>e ~/.config/nvim/snippets/tex.snippets<CR>", desc = "edit snippets", opts },
      { "<leader>vf", "<cmd>lua vim.lsp.buf.format()<CR>", desc = "format", opts },
      { "<leader>vh", "<cmd>LocalHighlightToggle<CR>", desc = "highlight", opts },
      { "<leader>vk", "<cmd>VimtexClean<CR>", desc = "kill aux", opts },
      { "<leader>vr", "<cmd>VimtexErrors<CR>", desc = "report errors", opts },
      { "<leader>vu", "<cmd>cd %:p:h<CR>", desc = "update cwd", opts },
      { "<leader>vm", "<plug>(vimtex-context-menu)", desc = "vimtex menu", opts },
      { "<leader>vw", "<cmd>VimtexCountWords!<CR>", desc = "word count", opts },
      { "<leader>vv", "<cmd>VimtexView<CR>", desc = "view", opts },
      { "<leader>vb", "<cmd>!biber --validate_datamodel %:t:r<CR>", desc = "run biber on file", opts },
      { "<leader>vi", "<cmd>!biber --validate_datamodel compiler && lualatex -jobname=compiler --enable-write18 '\\include{chs/%:t:r}\\input{compiler.tex}'<CR>", desc = "compile current chapter", opts },
      { "<leader>vs", "<cmd>e ~/.config/nvim/after/ftplugin/tex.lua<CR>", desc = "edit surrounds", opts },
      { "<leader>i", "<cmd>VimtexTocOpen<CR>", desc = "index", opts },

      { "<leader>b", "<cmd>VimtexCompile<CR>", desc = "build", opts },
      { "<leader>c", "<cmd>clo<CR>", desc = "close split", opts },
      { "<leader>d", "<cmd>update! | bdelete!<CR>", desc = "delete buffer", opts },
      -- { "dse", "<Plug>(vimtex-env-delete)", desc = "delete environment", opts },

      { "<leader>f", group = "FIND", opts },
      { "<leader>fs", "<cmd>lua Snacks.picker.smart()<CR>", desc = "Smart Find Files", opts },
      { "<leader>ff", "<cmd>lua Snacks.picker.grep()<CR>", desc = "Grep", opts },
      { "<leader>fb", "<cmd>lua Snacks.picker.buffers()<CR>", desc = "Buffers", opts },
      { "<leader>fB", "<cmd>lua Snacks.picker.grep_buffers()<CR>", desc = "Grep Open Buffers", opts },
      { '<leader>f"', "<cmd>lua Snacks.picker.registers()<CR>", desc = "Registers", opts },
      { "<leader>fr", "<cmd>lua Snacks.picker.recent()<CR>", desc = "Recent", opts },
      { "<leader>fk", "<cmd>lua Snacks.picker.keymaps()<CR>", desc = "Keymaps", opts },
      { "<leader>fc", "<cmd>Telescope bibtex format_string=\\autocite{%s}<CR>", desc = "citations", opts },
      { "<leader>e", "<cmd>lua Snacks.explorer.open()<CR>", desc = "Explorer", opts },
      { "<leader>f:", "<cmd>lua Snacks.picker.command_history()<CR>", desc = "Command History", opts },
      { "<leader>f/", "<cmd>lua Snacks.picker.search_history()<CR>", desc = "Search History", opts },
      { "<leader>fq", "<cmd>lua Snacks.picker.qflist()<CR>", desc = "Quickfix List", opts },

      { "<leader>G", group = "GIT", opts },
      { "<leader>Gb", "<cmd>Gitsigns toggle_current_line_blame<CR>", desc = "blame", opts },
      { "<leader>Gd", "<cmd>Gitsigns diffthis HEAD<CR>", desc = "diff", opts },
      { "<leader>Gg", "<cmd>LazyGit<CR>", desc = "lazygit", opts },
      { "<leader>Gj", "<cmd>Gitsigns next_hunk<CR>", desc = "next hunk", opts },
      { "<leader>Gk", "<cmd>Gitsigns prev_hunk<CR>", desc = "prev hunk", opts },
      { "<leader>Gp", "<cmd>Gitsigns preview_hunk<CR>", desc = "preview hunk", opts },
      { "<leader>h", "<cmd>lua Snacks.dashboard()<CR>", desc = "home", opts },
      { "<leader>j", "<cmd>vert sb<CR>", desc = "new split", opts },
      { "<leader>k", "<cmd>on<CR>", desc = "max split", opts },

      { "<leader>l", group = "LIST", opts },
      { "<leader>lc", "<cmd>lua HandleCheckbox()<CR>", desc = "checkbox", opts },
      { "<leader>ln", "<cmd>AutolistCycleNext<CR>", desc = "next", opts },
      { "<leader>lp", "<cmd>AutolistCyclePrev<CR>", desc = "previous", opts },
      { "<leader>lr", "<cmd>AutolistRecalculate<CR>", desc = "reorder", opts },

      { "<leader>T", group = "TEMPLATES", opts },
      { "<leader>Tb", "<cmd>read ~/.config/nvim/templates/PhilBeamer.tex<CR>", desc = "PhilBeamer.tex", opts },
      { "<leader>Tg", "<cmd>read ~/.config/nvim/templates/Glossary.tex<CR>", desc = "Glossary.tex", opts },
      { "<leader>Th", "<cmd>read ~/.config/nvim/templates/HandOut.tex<CR>", desc = "HandOut.tex", opts },
      { "<leader>Tl", "<cmd>read ~/.config/nvim/templates/Letter.tex<CR>", desc = "Letter.tex", opts },
      { "<leader>Tm", "<cmd>read ~/.config/nvim/templates/MultipleAnswer.tex<CR>", desc = "MultipleAnswer.tex", opts },
      { "<leader>Tp", "<cmd>read ~/.config/nvim/templates/PhilPaper.tex<CR>", desc = "PhilPaper.tex", opts },
      { "<leader>Tr", "<cmd>read ~/.config/nvim/templates/Root.tex<CR>", desc = "Root.tex", opts },
      { "<leader>Ts", "<cmd>read ~/.config/nvim/templates/SubFile.tex<CR>", desc = "SubFile.tex", opts },

      { "<leader>u", "<cmd>Telescope undo<CR>", desc = "undo", opts },
      { "<leader>w", "<cmd>wa!<CR>", desc = "write", opts },
      { "<leader>F", "<cmd>lua MiniFiles.open()<CR>", desc = "MiniFiles", opts },
      { "<leader>q", "<cmd>qa<CR>", desc = "Quit", opts },

      { "<leader>t", "<cmd>FloatermToggle<CR>", desc = "Floaterm", opts, mode = { "n", "v" } },
      { "<C-t>", "<cmd>FloatermToggle<CR>", desc = "Floaterm", opts, mode = "t" },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts.setup)
    wk.add(opts.defaults)
  end,
}
