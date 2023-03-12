require('tabby.tabline').use_preset('active_tab_with_wins', {
  theme = {
    fill = 'TabLineFill', -- tabline background
    head = 'TabLine', -- head element highlight
    current_tab = 'TabLineSel', -- current tab label highlight
    tab = 'TabLine', -- other tab label highlight
    win = 'TabLine', -- window highlight
    tail = 'TabLine', -- tail element highlight
  },
})

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

--require('nightfox').setup({
  --options = {
    --styles = {
      --comments = "italic",
      --keywords = "bold",
      --types = "italic,bold",
    --}
  --}
--})

vim.cmd("colorscheme everforest")
