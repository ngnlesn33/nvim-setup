return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "AndreM222/copilot-lualine" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "nordic",
        -- theme = "catppuccin",
        globalstatus = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = {
          {
            "filetype",
            icon_only = true,
            separator = "",
            padding = { left = 1, right = 0 },
          },
          {
            "filename",
            file_status = true,
            path = 1,
          },
        },
        lualine_x = {
          {
            "copilot",
            show_colors = true,
            show_loading = true,
          },
        },
        lualine_z = { "location" },
      },
    })
  end,
}
