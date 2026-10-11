-- sumi.nvim — ink, washi paper and hinoki wood.
-- The editor half of ranma's sumi theme: same palette, same ground.

local M = {}

M.palette = {
  ink      = "#141317", -- terminal ground, float borders' ground
  bg       = "#17161a", -- editor ground (ranma's panes.active_bg)
  bg_dim   = "#121114", -- inactive windows (ranma's panes.inactive_bg)
  sumi2    = "#2a2724", -- statusline, popups, cursorline
  sumi3    = "#3a3631", -- borders, selection ground
  ln       = "#4a453f", -- line numbers
  kasumi   = "#6e665c", -- comments, dim text
  fg_dim   = "#a89f90", -- secondary text
  washi    = "#e8e1d3", -- text
  hinoki   = "#d9a55b", -- functions, focus
  ai       = "#7b93c9", -- floats, info, directories
  matcha   = "#9db37a", -- numbers, strings' cousin, ok
  shu      = "#e0533d", -- errors, urgent
  sakura   = "#c98aa8", -- keywords
  aonori   = "#7fb8b0", -- types
  kincha   = "#c4b28a", -- strings
}

M.config = {
  transparent = false, -- leave the ground to the terminal (and to ranma)
  dim_inactive = true, -- inactive windows take bg_dim
  italic_comments = true,
}

-- kanna: the same palette cut tight, as ranma's kanna theme. One ink ground
-- for every window (ranma's active_bg = inactive_bg there), flat bars, the
-- darker border line, and no cursorline wash: focus is the line number.
M.variants = {
  sumi = {},
  kanna = {
    bg = "#141317",
    bg_dim = "#141317",
    sumi2 = "#1e1c1a",
    sumi3 = "#2e2b27",
  },
}

function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", M.config, opts or {})
end

local function groups(p, c, variant)
  local kanna = variant == "kanna"
  local bg = c.transparent and "NONE" or p.bg
  local bg_nc = c.transparent and "NONE" or (c.dim_inactive and p.bg_dim or p.bg)
  return {
    -- Editor ------------------------------------------------------------------
    Normal = { fg = p.washi, bg = bg },
    NormalNC = { fg = p.washi, bg = bg_nc },
    NormalFloat = { fg = p.washi, bg = kanna and "#1b1a1d" or p.ink },
    FloatBorder = { fg = p.ai, bg = kanna and "#1b1a1d" or p.ink },
    FloatTitle = { fg = p.hinoki, bg = kanna and "#1b1a1d" or p.ink, bold = true },
    Cursor = { fg = p.ink, bg = p.washi },
    CursorLine = kanna and {} or { bg = "#1e1c1f" },
    CursorColumn = { link = "CursorLine" },
    ColorColumn = { bg = "#1e1c1f" },
    LineNr = { fg = p.ln },
    CursorLineNr = { fg = kanna and p.hinoki or p.washi, bold = true },
    SignColumn = { bg = "NONE" },
    FoldColumn = { fg = p.ln },
    Folded = { fg = p.fg_dim, bg = p.sumi2 },
    VertSplit = { fg = p.sumi3 },
    WinSeparator = { fg = p.sumi3 },
    EndOfBuffer = { fg = p.bg },
    NonText = { fg = p.sumi3 },
    Whitespace = { fg = p.sumi3 },
    SpecialKey = { fg = p.sumi3 },
    Conceal = { fg = p.kasumi },
    Visual = { bg = "#2f3447" },
    VisualNOS = { link = "Visual" },
    Search = { fg = p.ink, bg = p.matcha },
    IncSearch = { fg = p.ink, bg = p.hinoki },
    CurSearch = { link = "IncSearch" },
    Substitute = { fg = p.ink, bg = p.shu },
    MatchParen = { fg = p.hinoki, bold = true, underline = true },
    Directory = { fg = p.ai },
    Title = { fg = p.hinoki, bold = true },
    Question = { fg = p.matcha },
    MoreMsg = { fg = p.matcha },
    ModeMsg = { fg = p.hinoki, bold = true },
    ErrorMsg = { fg = p.shu, bold = true },
    WarningMsg = { fg = p.hinoki },
    QuickFixLine = { bg = p.sumi2, bold = true },

    StatusLine = { fg = p.washi, bg = p.sumi2 },
    StatusLineNC = { fg = p.kasumi, bg = p.bg_dim },
    WinBar = { fg = p.hinoki, bold = true },
    WinBarNC = { fg = p.kasumi },
    TabLine = { fg = p.fg_dim, bg = p.sumi2 },
    TabLineFill = { bg = p.ink },
    TabLineSel = { fg = p.ink, bg = p.hinoki, bold = true },

    Pmenu = { fg = p.washi, bg = p.sumi2 },
    PmenuSel = { fg = p.ink, bg = p.hinoki, bold = true },
    PmenuSbar = { bg = p.sumi2 },
    PmenuThumb = { bg = p.kasumi },
    WildMenu = { link = "PmenuSel" },

    SpellBad = { sp = p.shu, undercurl = true },
    SpellCap = { sp = p.hinoki, undercurl = true },
    SpellRare = { sp = p.sakura, undercurl = true },
    SpellLocal = { sp = p.ai, undercurl = true },

    DiffAdd = { bg = "#232a1f" },
    DiffChange = { bg = "#1f2430" },
    DiffDelete = { fg = p.shu, bg = "#2c1c1a" },
    DiffText = { bg = "#2f3a52" },
    Added = { fg = p.matcha },
    Changed = { fg = p.ai },
    Removed = { fg = p.shu },

    -- Syntax ------------------------------------------------------------------
    Comment = { fg = p.kasumi, italic = c.italic_comments },
    Constant = { fg = p.matcha },
    String = { fg = p.kincha },
    Character = { fg = p.kincha },
    Number = { fg = p.matcha },
    Boolean = { fg = p.matcha },
    Float = { fg = p.matcha },
    Identifier = { fg = p.washi },
    Function = { fg = p.hinoki },
    Statement = { fg = p.sakura },
    Conditional = { fg = p.sakura },
    Repeat = { fg = p.sakura },
    Label = { fg = p.sakura },
    Operator = { fg = p.fg_dim },
    Keyword = { fg = p.sakura },
    Exception = { fg = p.sakura },
    PreProc = { fg = p.sakura },
    Include = { fg = p.sakura },
    Define = { fg = p.sakura },
    Macro = { fg = p.ai },
    PreCondit = { fg = p.sakura },
    Type = { fg = p.aonori },
    StorageClass = { fg = p.sakura },
    Structure = { fg = p.aonori },
    Typedef = { fg = p.aonori },
    Special = { fg = p.ai },
    SpecialChar = { fg = p.ai },
    Tag = { fg = p.hinoki },
    Delimiter = { fg = p.fg_dim },
    SpecialComment = { fg = p.kasumi, bold = true },
    Debug = { fg = p.shu },
    Underlined = { fg = p.ai, underline = true },
    Error = { fg = p.shu },
    Todo = { fg = p.ink, bg = p.hinoki, bold = true },

    -- Treesitter --------------------------------------------------------------
    ["@variable"] = { fg = p.washi },
    ["@variable.builtin"] = { fg = p.sakura },
    ["@variable.parameter"] = { fg = p.washi },
    ["@variable.member"] = { fg = p.washi },
    ["@property"] = { fg = p.washi },
    ["@field"] = { fg = p.washi },
    ["@parameter"] = { fg = p.washi },
    ["@constant"] = { fg = p.matcha },
    ["@constant.builtin"] = { fg = p.matcha },
    ["@constant.macro"] = { fg = p.ai },
    ["@module"] = { fg = p.aonori },
    ["@namespace"] = { fg = p.aonori },
    ["@label"] = { fg = p.sakura },
    ["@string"] = { link = "String" },
    ["@string.escape"] = { fg = p.ai },
    ["@string.regexp"] = { fg = p.ai },
    ["@string.special"] = { fg = p.ai },
    ["@character"] = { link = "Character" },
    ["@number"] = { link = "Number" },
    ["@boolean"] = { link = "Boolean" },
    ["@type"] = { fg = p.aonori },
    ["@type.builtin"] = { fg = p.aonori },
    ["@attribute"] = { fg = p.ai },
    ["@function"] = { fg = p.hinoki },
    ["@function.call"] = { fg = p.hinoki },
    ["@function.builtin"] = { fg = p.hinoki },
    ["@function.macro"] = { fg = p.ai },
    ["@function.method"] = { fg = p.hinoki },
    ["@function.method.call"] = { fg = p.hinoki },
    ["@method"] = { fg = p.hinoki },
    ["@method.call"] = { fg = p.hinoki },
    ["@constructor"] = { fg = p.aonori },
    ["@operator"] = { link = "Operator" },
    ["@keyword"] = { fg = p.sakura },
    ["@keyword.function"] = { fg = p.sakura },
    ["@keyword.return"] = { fg = p.sakura },
    ["@keyword.operator"] = { fg = p.sakura },
    ["@punctuation.delimiter"] = { fg = p.fg_dim },
    ["@punctuation.bracket"] = { fg = p.fg_dim },
    ["@punctuation.special"] = { fg = p.ai },
    ["@comment"] = { link = "Comment" },
    ["@comment.documentation"] = { link = "Comment" },
    ["@tag"] = { fg = p.hinoki },
    ["@tag.attribute"] = { fg = p.aonori },
    ["@tag.delimiter"] = { fg = p.kasumi },
    ["@markup.heading"] = { fg = p.hinoki, bold = true },
    ["@markup.strong"] = { bold = true },
    ["@markup.italic"] = { italic = true },
    ["@markup.link"] = { fg = p.ai, underline = true },
    ["@markup.link.url"] = { fg = p.ai, underline = true },
    ["@markup.raw"] = { fg = p.kincha },
    ["@markup.list"] = { fg = p.sakura },
    ["@text.title"] = { fg = p.hinoki, bold = true },
    ["@text.uri"] = { fg = p.ai, underline = true },
    ["@text.literal"] = { fg = p.kincha },
    ["@lsp.type.namespace"] = { link = "@module" },
    ["@lsp.type.parameter"] = { link = "@variable.parameter" },
    ["@lsp.type.property"] = { link = "@property" },
    ["@lsp.type.selfKeyword"] = { link = "@variable.builtin" },
    ["@lsp.type.lifetime"] = { fg = p.sakura, italic = true },
    ["@lsp.mod.mutable"] = { underline = true },

    -- Vim's own Rust syntax (no treesitter), matched to the treesitter look.
    rustSelf = { fg = p.sakura },
    rustModPath = { fg = p.aonori },
    rustModPathSep = { fg = p.fg_dim },
    rustLifetime = { fg = p.sakura, italic = true },
    rustCommentLineDoc = { link = "Comment" },

    -- Diagnostics -------------------------------------------------------------
    DiagnosticError = { fg = p.shu },
    DiagnosticWarn = { fg = p.hinoki },
    DiagnosticInfo = { fg = p.ai },
    DiagnosticHint = { fg = p.aonori },
    DiagnosticOk = { fg = p.matcha },
    DiagnosticUnderlineError = { sp = p.shu, undercurl = true },
    DiagnosticUnderlineWarn = { sp = p.hinoki, undercurl = true },
    DiagnosticUnderlineInfo = { sp = p.ai, undercurl = true },
    DiagnosticUnderlineHint = { sp = p.aonori, undercurl = true },
    DiagnosticVirtualTextError = { fg = p.shu, bg = "#2a1a19" },
    DiagnosticVirtualTextWarn = { fg = p.hinoki, bg = "#2a2319" },
    DiagnosticVirtualTextInfo = { fg = p.ai, bg = "#1c2030" },
    DiagnosticVirtualTextHint = { fg = p.aonori, bg = "#1a2624" },
    LspReferenceText = { bg = p.sumi2 },
    LspReferenceRead = { bg = p.sumi2 },
    LspReferenceWrite = { bg = p.sumi2, underline = true },
    LspInlayHint = { fg = p.kasumi, italic = true },
    LspSignatureActiveParameter = { fg = p.hinoki, bold = true },

    -- Plugins -----------------------------------------------------------------
    GitSignsAdd = { fg = p.matcha },
    GitSignsChange = { fg = p.ai },
    GitSignsDelete = { fg = p.shu },
    TelescopeBorder = { link = "FloatBorder" },
    TelescopeTitle = { link = "FloatTitle" },
    TelescopeSelection = { bg = p.sumi2, bold = true },
    TelescopeMatching = { fg = p.hinoki, bold = true },
    TelescopePromptPrefix = { fg = p.hinoki },
    WhichKey = { fg = p.ai },
    WhichKeyGroup = { fg = p.hinoki, bold = true },
    WhichKeyDesc = { fg = p.washi },
    WhichKeySeparator = { fg = p.kasumi },
    NvimTreeNormal = { fg = p.washi, bg = p.bg_dim },
    NvimTreeFolderName = { fg = p.ai },
    NvimTreeOpenedFolderName = { fg = p.ai, bold = true },
    NeoTreeNormal = { fg = p.washi, bg = p.bg_dim },
    NeoTreeNormalNC = { fg = p.washi, bg = p.bg_dim },
    IndentBlanklineChar = { fg = p.sumi3 },
    IblIndent = { fg = "#24221f" },
    IblScope = { fg = p.sumi3 },
    MiniIndentscopeSymbol = { fg = p.sumi3 },
    CmpItemAbbrMatch = { fg = p.hinoki, bold = true },
    CmpItemAbbrMatchFuzzy = { fg = p.hinoki },
    CmpItemKindFunction = { fg = p.hinoki },
    CmpItemKindMethod = { fg = p.hinoki },
    CmpItemKindVariable = { fg = p.washi },
    CmpItemKindKeyword = { fg = p.sakura },
    CmpItemKindStruct = { fg = p.aonori },
    CmpItemKindClass = { fg = p.aonori },
    CmpItemKindModule = { fg = p.aonori },
    CmpItemKindSnippet = { fg = p.ai },
    BlinkCmpLabelMatch = { fg = p.hinoki, bold = true },
    FlashLabel = { fg = p.ink, bg = p.shu, bold = true },
  }
end

local function terminal(p)
  local t = {
    p.sumi2, p.shu, p.matcha, p.hinoki, p.ai, p.sakura, p.aonori, p.washi,
    p.kasumi, "#f06a52", "#b3c98f", "#e6b877", "#93a9d9", "#d9a0bb", "#96ccc4", "#f5efe3",
  }
  for i, col in ipairs(t) do vim.g["terminal_color_" .. (i - 1)] = col end
end

-- The palette of a variant: sumi's, with the variant's keys over it.
function M.colors(variant)
  return vim.tbl_extend("force", M.palette, M.variants[variant or "sumi"] or {})
end

function M.load(variant)
  variant = variant or "sumi"
  if vim.g.colors_name then vim.cmd("highlight clear") end
  if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end
  vim.o.termguicolors = true
  vim.o.background = "dark"
  vim.g.colors_name = variant
  local p = M.colors(variant)
  for name, spec in pairs(groups(p, M.config, variant)) do
    vim.api.nvim_set_hl(0, name, spec)
  end
  terminal(p)
end

return M
