require("nvim-tree").setup({
  disable_netrw = true,
  hijack_netrw = true,
  open_on_tab = false,
  hijack_cursor = false,
  diagnostics = {
    enable = true,
    show_on_dirs = true,
  },
  filesystem_watchers = {
    enable = true,
  },
  update_focused_file = {
    enable = true,
    update_root = false,
  },
  filters = {
    dotfiles = false,
    custom = { "^.git$" },
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  renderer = {
    root_folder_label = false,
    group_empty = true,
  },
  tab = {
    sync = {
      open = true,
      close = true,
      ignore = { "^fugitive://.*", "^term://.*" },
    },
  },
  view = {
    adaptive_size = true,
    side = "left",
    mappings = {
      custom_only = false,
      list = {},
    },
    number = false,
    relativenumber = false,
    signcolumn = "yes",
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
})
