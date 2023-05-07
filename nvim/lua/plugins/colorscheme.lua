return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 100000,
  config = function()
    require("catppuccin").setup({
      flavour = "frappe",
      integrations = {
        notify = true,
        neotree = true,
        telescope = true,
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
