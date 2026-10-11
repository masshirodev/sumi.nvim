-- Loads every colorscheme and both lualine themes in a clean Neovim and fails
-- on the first error, or on a highlight group that ended up empty. CI runs it
-- (`.github/workflows/ci.yml`); so can you:
--
--   nvim --headless -u NONE -l scripts/check.lua
vim.opt.rtp:prepend(vim.fn.getcwd())
vim.o.termguicolors = true

local failures = {}
local function check(what, fn)
  local ok, err = pcall(fn)
  if not ok then
    table.insert(failures, what .. ": " .. tostring(err))
  end
end

for _, path in ipairs(vim.fn.globpath(vim.fn.getcwd(), "colors/*.lua", false, true)) do
  local name = vim.fn.fnamemodify(path, ":t:r")
  check("colorscheme " .. name, function()
    vim.cmd.colorscheme(name)
    assert(vim.g.colors_name == name, "colors_name is " .. tostring(vim.g.colors_name))
    local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
    assert(normal.fg and normal.bg, "Normal has no fg or bg")
  end)
  check("colors(" .. name .. ")", function()
    local colors = require("sumi").colors(name)
    assert(type(colors) == "table" and next(colors), "no colours")
  end)
  check("lualine theme " .. name, function()
    local theme = require("lualine.themes." .. name)
    assert(theme.normal and theme.normal.a, "no normal.a section")
  end)
end

check("setup", function()
  require("sumi").setup({ transparent = true, dim_inactive = true })
  vim.cmd.colorscheme("sumi")
end)

if #failures > 0 then
  io.stderr:write(table.concat(failures, "\n") .. "\n")
  os.exit(1)
end
print("ok: every colorscheme and lualine theme loads")
