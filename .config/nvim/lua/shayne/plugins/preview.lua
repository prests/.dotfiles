return {
  {
    "https://gitlab.com/itaranto/preview.nvim",
    version = "*",
    lazy = false,
    dependencies = {
      "aklt/plantuml-syntax",
    },
    opts = {
      previewers_by_ft = {
        plantuml = {
          name = "plantuml_svg",
          renderer = { type = "command", opts = { cmd = { "open", "-a", "Preview" } } },
        },
      },
      previewers = {
        plantuml_svg = {
          args = { "-pipe", "-tpng" },
        },
      },
    },
  },
}
