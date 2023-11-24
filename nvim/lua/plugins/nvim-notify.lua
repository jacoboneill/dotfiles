local config = function()
  require("notify").setup({
    background_color = "#000000",
  })
  vim.api.nvim_set_option('showmode', false)
end

return {
  "rcarriga/nvim-notify",
  config = config,
}

