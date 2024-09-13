return {
  -- This plugin breaks "hjkl" navigation inside LazyGit.
  -- Also, this plugin is redundant when using Tmux.
  -- {
  --   "akinsho/toggleterm.nvim",
  --   version = "*",
  --   opts = {
  --     open_mapping = [[<c-\>]],
  --     hide_numbers = true,
  --     -- direction = 'float'
  --   },
  --   init = function()
  --     -- Doesn't make sense for floating mode
  --     function _G.set_terminal_keymaps()
  --       local opts = { buffer = 0 }
  --       -- vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
  --       vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
  --       vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
  --       vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
  --       vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
  --       vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
  --       vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
  --     end

  --     -- If you only want these mappings for toggle term use term://*toggleterm#* instead
  --     vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
  --   end,
  -- },
  {
    "voldikss/vim-floaterm",
    keys = {
      { "<Leader>ft", "<cmd>FloatermToggle<CR>" },
      { "<Leader>fc", "<cmd>FloatermNew<CR>" },
      { "<Leader>fp", "<cmd>FloatermPrev<CR>" },
      { "<Leader>fn", "<cmd>FloatermNext<CR>" },
    },
    init = function()
      -- Do not use this, because then the leader is mapped to space in the terminal mode
      -- and there is a delay when pressing space, because it waits for the next key
      -- vim.cmd("let g:floaterm_keymap_toggle = '<Leader>ft'")
      -- vim.cmd("let g:floaterm_keymap_new = '<Leader>fc'")
      -- vim.cmd("let g:floaterm_keymap_prev = '<Leader>fp'")
      -- vim.cmd("let g:floaterm_keymap_next = '<Leader>fn'")

      -- Apply the highlight when the terminal is opened
      -- autocmd TermOpen * highlight TermCursor ctermfg=white ctermbg=yellow guifg=blue guibg=yellow
      vim.cmd([[
        augroup FloatermSettings
          autocmd!
          autocmd TermOpen * setlocal cursorline
          autocmd TermOpen * highlight TermCursor ctermfg=white guifg=blue
        augroup END
      ]])
    end,
  },
}
