
return {
  "kaicataldo/material.vim",
  lazy = false,
  priority = 999,
  config = function()
    -- Set the theme style
    vim.g.material_theme_style = 'palenight'
    vim.cmd('colorscheme material')
  end
}
