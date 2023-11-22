return {
  {
    "dccsillag/magma-nvim",
    version = "*",
    name = "Magma",
    build = ":UpdateRemotePlugins",
    lazy = false,
    keys = {
      {
        "<leader>ri",
        "<cmd>MagmaInit<CR>",
        desc = "Init Kernel",
      },
      {
        "<leader>rm",
        "<cmd>MagmaEvaluateVisual<CR>",
        desc = "Evaluate visual selection",
        silent = true,
      },

      {
        "<leader>rb",
        "<cmd>MagmaEvaluateBlock<CR>",
        desc = "Evaluate block",
        silent = true,
      },

      {
        "<leader>rs",
        "<cmd>MagmaShowOutput<CR>",
        desc = "Toggle show output",
        silent = true,
      },
    },
    config = function()
      -- Settings
      vim.g.magma_automatically_open_output = false
      vim.g.magma_image_provider = "kitty"
      -- Define a custom function to select and evaluate the block between ampersands
      function MagmaEvaluateBlock()
        -- Search for the "```python" code block
        local python_start_pos = vim.fn.search("```python", "bn")
        local python_end_pos = vim.fn.search("```", "n")

        if python_start_pos ~= 0 then
          -- Use the "```python" code block if found
          vim.fn.setpos(".", { 0, python_start_pos + 1, 1, 0 })
          vim.api.nvim_input("V")

          for i = python_start_pos + 1, python_end_pos - 2, 1 do
            vim.api.nvim_input("j")
          end
          vim.cmd("MagmaEvaluateVisual")
        else
          -- If no "```python" code block, try to find "# %%" blocks
          local start_pos = vim.fn.search("# %%", "bn")
          local end_pos = vim.fn.search("# %%", "n")

          if start_pos ~= 0 and end_pos ~= 0 then
            -- Use visual mode to select the text between # %%
            vim.fn.setpos(".", { 0, start_pos + 1, 1, 0 })
            vim.api.nvim_input("V")

            for i = start_pos + 1, end_pos - 2, 1 do
              vim.api.nvim_input("j")
            end
            vim.cmd("MagmaEvaluateVisual")
          else
            print("No valid code block found")
            return
          end
        end
      end
      vim.cmd("command! -nargs=0 MagmaEvaluateBlock lua MagmaEvaluateBlock()")
    end,
  },
}
