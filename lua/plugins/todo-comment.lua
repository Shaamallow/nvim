return {
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = "LazyFile",
    config = true,
    opts = {
      keywords = {
        NOTE = { icon = "", color = "hint", alt = { "INFO" } },
      },
    },
  },
}
