-- lualine theme for kanna: flat, square, one dark strip under the buffer,
-- as in the ranma kanna mockup (NORMAL in hinoki, the rest on #1e1c1a).
local p = require("sumi").colors("kanna")

local function mode(color)
  return {
    a = { fg = p.ink, bg = color, gui = "bold" },
    b = { fg = p.washi, bg = p.sumi2 },
    c = { fg = p.washi, bg = p.sumi2 },
    x = { fg = p.kasumi, bg = p.sumi2 },
    y = { fg = p.fg_dim, bg = p.sumi2 },
    z = { fg = p.fg_dim, bg = p.sumi2 },
  }
end

return {
  normal = mode(p.hinoki),
  insert = mode(p.matcha),
  visual = mode(p.ai),
  replace = mode(p.shu),
  command = mode(p.sakura),
  terminal = mode(p.aonori),
  inactive = {
    a = { fg = p.kasumi, bg = p.ink },
    b = { fg = p.kasumi, bg = p.ink },
    c = { fg = p.kasumi, bg = p.ink },
  },
}
