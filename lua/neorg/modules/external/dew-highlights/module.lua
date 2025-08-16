local neorg = require "neorg.core"
local modules = neorg.modules

local api = vim.api
local autocmd = api.nvim_create_autocmd

local module = modules.create "external.dew-highlights"

module.load = function()
  module.private.set_autocmd()

  module.private.set_default_highlights()
end

module.config.public = {
  highlights_table = {},
}

module.config.private = {
  default_highlights_table = {
    ["@neorg.markup.verbatim"] = { fg = "#ffab00", italic = true },
    ["dewTransclude"] = { fg = "#D2DAD7", bg = "#2A3230" },
  },
}

module.private = {
  set_default_highlights = function()
    module.config.public.highlights_table =
      vim.tbl_extend(
        "keep",
        module.config.public.highlights_table,
        module.config.private.default_highlights_table
      )
  end,

  apply_highlights = function()
    local hl_table = module.config.public.highlights_table or {}
    for group, opts in pairs(hl_table) do
      api.nvim_set_hl(0, group, opts)
    end
  end,

  set_autocmd = function()
    autocmd({ "FileType" }, {
      pattern = "norg",
      callback = function()
        module.private.apply_highlights()
      end,
    })
  end,
}

return module
