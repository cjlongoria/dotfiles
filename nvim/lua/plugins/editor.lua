return {
  {
    "nvim-telescope/telescope.nvim",
    keys = function(_, keys)
      -- Insert at the start => if these keymaps already exist, don't override.
      table.insert(keys, 1, {
        "<leader>p",
        require("lazyvim.util").telescope("files"),
        desc = "Find Files (root)",
      })

      -- Insert at the end => override these keymaps even if they exist.
      vim.list_extend(keys, {
        { "<leader>,", false },
        { "<leader><space>", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
        {
          "<leader>P",
          function()
            require("lazyvim.util").telescope("files", { cwd = vim.fn.expand("%:p:h") })()
          end,
          desc = "Find Files (cwd)",
        },
      })
    end,
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<esc>"] = require("telescope.actions").close,
          },
        },
      },
    },
  },
}
