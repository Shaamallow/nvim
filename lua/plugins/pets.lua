return {
  {
    "giusgad/pets.nvim",
    lazy = true,
    dependencies = { "MunifTanjim/nui.nvim", "giusgad/hologram.nvim" },
    opts = {
      row = 7,
      col = 20,
      popup = {
        hl = { Normal = "NormalNC" },
        avoid_statusline = true,
      },
    },
  },
}
