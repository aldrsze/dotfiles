-- Small quality-of-life editing plugins.
return {
  {
    "windwp/nvim-autopairs", -- auto-close brackets/quotes
    event = "InsertEnter",
    config = true,
  },
  {
    "numToStr/Comment.nvim", -- gcc / gc to comment lines, like Cmd+/
    config = true,
  },
  {
    "lukas-reineke/indent-blankline.nvim", -- visible indent guides
    main = "ibl",
    config = true,
  },
}
