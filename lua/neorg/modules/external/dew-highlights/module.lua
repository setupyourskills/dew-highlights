local neorg = require "neorg.core"
local modules = neorg.modules

local api = vim.api
local autocmd = api.nvim_create_autocmd

local module = modules.create "external.dew-highlights"

module.load = function()
  module.private.set_autocmd()
end

module.config.public = {
  highlights_table = {},
}

module.private = {
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
