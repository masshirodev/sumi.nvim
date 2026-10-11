-- lualine theme: the mode block takes ranma's colours, the rest sits on sumi-2,
-- as in the ranma sumi mockup (NORMAL in hinoki on a dark pill).
local p = require("sumi").palette

local function mode(color)
  return {
    a = { fg = p.ink, bg = color, gui = "bold" },
    b = { fg = p.washi, bg = p.sumi3 },
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
    a = { fg = p.kasumi, bg = p.bg_dim },
    b = { fg = p.kasumi, bg = p.bg_dim },
    c = { fg = p.kasumi, bg = p.bg_dim },
  },
}
