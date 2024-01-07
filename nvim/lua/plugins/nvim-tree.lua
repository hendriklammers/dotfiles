return {
  "nvim-tree/nvim-tree.lua",
  tag = "nightly", -- optional, updated every week. (see issue #1193)
  keys = {
    { "<leader>nt", "<cmd>NvimTreeToggle<cr>", desc = "NvimTree" },
    { "<leader>nf", "<cmd>NvimTreeFindFile<cr>", desc = "NvimTreeFindFile" },
  },
  opts = {
    renderer = {
      icons = {
        show = {
          file = false,
          folder = false,
          folder_arrow = true,
          git = false,
        },
      },
    },
    git = {
      ignore = false,
    }
  }
}
