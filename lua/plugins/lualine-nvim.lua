local config = function()
  local theme = require("lualine.themes.nord")
  theme.normal.c.bg = nil -- Allow transparency

  require('lualine').setup {
    options = {
      theme = theme,
      globalstatus = true,
    },
    sections = {
      lualine_a = {{ 'buffers', }},
      lualine_x = { "encoding", { "fileformat", symbols = {unix = "" } }, "filetype" },
    }
  }
end

return {
  "nvim-lualine/lualine.nvim",
  lazy = false,
  config = config,
}
