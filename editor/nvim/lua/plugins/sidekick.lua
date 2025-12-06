return {
  "folke/sidekick.nvim",
  opts = {
    nes = {
      enabled = false,
    },
  },
  keys = {
    {
      "<leader>an",
      function()
        require("sidekick.nes").toggle()
      end,
      desc = "Sidekick NES Toggle",
    },
  },
}
