vim.cmd 'highlight clear'
if vim.fn.exists 'syntax_on' ~= 0 then
  vim.cmd 'syntax reset'
end
vim.g.colors_name = 'material-darker-hc'
vim.o.background = 'dark'

-- Colors extracted from Community Material Theme Darker High Contrast
local c = {
  bg = '#212121',
  bg_dark = '#1a1a1a',
  bg_input = '#2B2B2B',
  fg = '#EEFFFF',
  comment = '#4A4A4A',
  red = '#FF5370',
  orange = '#F78C6C',
  yellow = '#FFCB6B',
  green = '#C3E88D',
  cyan = '#89DDFF',
  blue = '#82AAFF',
  purple = '#C792EA',
  pink = '#f07178',
  teal = '#80CBC4',
  white = '#FFFFFF',
  cursor = '#FFCC00',
  line_nr = '#424242',
  line_nr_active = '#848484',
  -- Pre-blended alpha colors (blended onto #212121 background)
  cur_line = '#171717', -- #00000050
  selection = '#353535', -- #61616150
  sel_highlight = '#3c361d', -- #FFCC0020
  indent = '#303030', -- #42424270
  gutter_mod = '#455574', -- #82AAFF60
  gutter_add = '#5e6c49', -- #C3E88D60
  gutter_del = '#74343f', -- #FF537060
  diff_add = '#1e2b1a', -- #C3E88D15
  diff_del = '#2b1a1d', -- #FF537020
  diff_change = '#1a1e2b', -- #82AAFF15
}

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- =====================
-- EDITOR UI
-- =====================
hi('Normal', { fg = c.fg }) -- bg = c.bg
hi('NormalNC', { fg = c.fg }) -- bg = c.bg
hi('NormalFloat', { fg = c.fg, bg = c.bg_dark })
hi('FloatBorder', { fg = c.line_nr, bg = c.bg_dark })
hi('Cursor', { fg = c.bg, bg = c.cursor })
hi('lCursor', { fg = c.bg, bg = c.fg })
hi('CursorIM', { fg = c.bg, bg = c.cursor })
hi('CursorLine', { bg = c.cur_line })
hi('CursorColumn', { bg = c.cur_line })
hi('LineNr', { fg = c.line_nr })
hi('CursorLineNr', { fg = c.line_nr_active })
hi('SignColumn', { bg = c.bg })
hi('ColorColumn', { bg = c.cur_line })
hi('Visual', { bg = c.selection })
hi('VisualNOS', { bg = c.selection })
hi('Search', { bg = '#000000', fg = c.fg })
hi('IncSearch', { bg = c.teal, fg = '#000000', bold = true })
hi('CurSearch', { bg = c.teal, fg = '#000000', bold = true })
hi('Substitute', { bg = c.red, fg = '#000000' })
hi('MatchParen', { fg = c.cursor, bold = true })
hi('NonText', { fg = '#4a4a4a' })
hi('Whitespace', { fg = '#383838' })
hi('SpecialKey', { fg = '#383838' })
hi('EndOfBuffer', { fg = c.bg })
hi('Conceal', { fg = c.comment })
hi('WinSeparator', { fg = '#2e2e2e' })
hi('VertSplit', { fg = '#2e2e2e' })

-- Status line
hi('StatusLine', { fg = '#616161', bg = c.bg_dark })
hi('StatusLineNC', { fg = c.comment, bg = c.bg_dark })

-- Tabs
hi('TabLine', { fg = '#848484', bg = c.bg })
hi('TabLineSel', { fg = c.white, bg = c.bg })
hi('TabLineFill', { bg = c.bg })

-- Popup menu
hi('Pmenu', { fg = c.fg, bg = c.bg })
hi('PmenuSel', { fg = c.teal, bg = '#2a2a2a' })
hi('PmenuSbar', { bg = c.bg })
hi('PmenuThumb', { bg = c.line_nr })

-- Folding
hi('Folded', { fg = c.comment, bg = c.bg_dark })
hi('FoldColumn', { fg = c.comment, bg = c.bg })

-- Misc UI
hi('Directory', { fg = c.blue })
hi('Title', { fg = c.green, bold = true })
hi('Question', { fg = c.green })
hi('MoreMsg', { fg = c.green })
hi('ErrorMsg', { fg = c.red })
hi('WarningMsg', { fg = c.yellow })
hi('ModeMsg', { fg = c.fg })
hi('MsgArea', { fg = c.fg })
hi('WildMenu', { fg = c.teal, bg = '#2a2a2a' })

-- Spell
hi('SpellBad', { undercurl = true, sp = c.red })
hi('SpellCap', { undercurl = true, sp = c.yellow })
hi('SpellRare', { undercurl = true, sp = c.cyan })
hi('SpellLocal', { undercurl = true, sp = c.teal })

-- Diff
hi('DiffAdd', { bg = c.diff_add })
hi('DiffChange', { bg = c.diff_change })
hi('DiffDelete', { bg = c.diff_del })
hi('DiffText', { bg = c.gutter_mod })

-- =====================
-- DIAGNOSTICS
-- =====================
hi('DiagnosticError', { fg = '#ff6b80' })
hi('DiagnosticWarn', { fg = '#ffd080' })
hi('DiagnosticInfo', { fg = '#8fbfff' })
hi('DiagnosticHint', { fg = c.teal })
hi('DiagnosticOk', { fg = c.green })
hi('DiagnosticUnderlineError', { undercurl = true, sp = c.red })
hi('DiagnosticUnderlineWarn', { undercurl = true, sp = c.yellow })
hi('DiagnosticUnderlineInfo', { undercurl = true, sp = c.blue })
hi('DiagnosticUnderlineHint', { undercurl = true, sp = c.teal })
hi('DiagnosticVirtualTextError', { fg = '#ff6b80', bg = '#2b1a1d' })
hi('DiagnosticVirtualTextWarn', { fg = '#ffd080', bg = '#2b2618' })
hi('DiagnosticVirtualTextInfo', { fg = '#8fbfff', bg = '#1a1e2b' })
hi('DiagnosticVirtualTextHint', { fg = c.teal, bg = '#1a2421' })

-- =====================
-- GIT SIGNS
-- =====================
hi('GitSignsAdd', { fg = c.green })
hi('GitSignsChange', { fg = c.blue })
hi('GitSignsDelete', { fg = c.red })
hi('GitSignsAddNr', { fg = c.green })
hi('GitSignsChangeNr', { fg = c.blue })
hi('GitSignsDeleteNr', { fg = c.red })

-- =====================
-- TELESCOPE
-- =====================
hi('TelescopeBorder', { fg = c.line_nr, bg = c.bg_dark })
hi('TelescopeNormal', { fg = c.fg, bg = c.bg_dark })
hi('TelescopePromptBorder', { fg = c.line_nr, bg = c.bg_input })
hi('TelescopePromptNormal', { fg = c.fg, bg = c.bg_input })
hi('TelescopePromptTitle', { fg = c.teal, bold = true })
hi('TelescopeResultsTitle', { fg = c.teal })
hi('TelescopePreviewTitle', { fg = c.teal })
hi('TelescopeMatching', { fg = c.teal })
hi('TelescopeSelection', { fg = c.teal, bg = c.bg_dark })
hi('TelescopeSelectionCaret', { fg = c.teal })

-- =====================
-- WHICH-KEY
-- =====================
hi('WhichKey', { fg = c.cyan })
hi('WhichKeyGroup', { fg = c.blue })
hi('WhichKeyDesc', { fg = c.fg })
hi('WhichKeySeparator', { fg = c.comment })
hi('WhichKeyFloat', { bg = c.bg_dark })
hi('WhichKeyValue', { fg = c.comment })

-- =====================
-- INDENT GUIDES (ibl)
-- =====================
hi('IblIndent', { fg = c.indent })
hi('IblScope', { fg = c.line_nr })

-- =====================
-- BASE SYNTAX GROUPS
-- =====================
hi('Comment', { fg = c.comment, italic = true })
hi('Constant', { fg = c.orange })
hi('String', { fg = c.green })
hi('Character', { fg = c.green })
hi('Number', { fg = c.orange })
hi('Boolean', { fg = c.orange })
hi('Float', { fg = c.orange })
hi('Identifier', { fg = c.fg })
hi('Function', { fg = c.blue })
hi('Statement', { fg = c.purple, italic = true })
hi('Conditional', { fg = c.cyan, italic = true })
hi('Repeat', { fg = c.cyan, italic = true })
hi('Label', { fg = c.cyan })
hi('Operator', { fg = c.cyan })
hi('Keyword', { fg = c.purple, italic = true })
hi('Exception', { fg = c.cyan, italic = true })
hi('PreProc', { fg = c.cyan })
hi('Include', { fg = c.cyan, italic = true })
hi('Define', { fg = c.cyan })
hi('Macro', { fg = c.cyan })
hi('PreCondit', { fg = c.cyan })
hi('Type', { fg = c.yellow })
hi('StorageClass', { fg = c.purple, italic = true })
hi('Structure', { fg = c.yellow })
hi('Typedef', { fg = c.yellow })
hi('Special', { fg = c.cyan })
hi('SpecialChar', { fg = c.cyan })
hi('Tag', { fg = c.pink })
hi('Delimiter', { fg = c.cyan })
hi('SpecialComment', { fg = c.comment, italic = true })
hi('Debug', { fg = c.red })
hi('Underlined', { underline = true })
hi('Error', { fg = c.red })
hi('Todo', { fg = c.yellow, bold = true })

-- =====================
-- TREESITTER
-- =====================

-- Variables
hi('@variable', { fg = c.fg })
hi('@variable.builtin', { fg = c.red, italic = true })
hi('@variable.parameter', { fg = c.red })
hi('@variable.parameter.builtin', { fg = c.red })
hi('@variable.member', { fg = c.fg })
-- Old treesitter name fallbacks
hi('@parameter', { fg = c.red })

-- Constants
hi('@constant', { fg = c.orange })
hi('@constant.builtin', { fg = c.orange })
hi('@constant.macro', { fg = c.orange })

-- Strings
hi('@string', { fg = c.green })
hi('@string.regexp', { fg = c.cyan })
hi('@string.escape', { fg = c.cyan })
hi('@string.special', { fg = c.cyan })
hi('@string.special.symbol', { fg = c.green })
hi('@string.special.url', { fg = c.blue, underline = true })

-- Numbers / booleans
hi('@number', { fg = c.orange })
hi('@number.float', { fg = c.orange })
hi('@boolean', { fg = c.orange })

-- Functions
hi('@function', { fg = c.blue })
hi('@function.builtin', { fg = c.blue })
hi('@function.call', { fg = c.blue })
hi('@function.macro', { fg = c.blue })
hi('@function.method', { fg = c.blue, italic = true })
hi('@function.method.call', { fg = c.blue })
hi('@constructor', { fg = c.yellow })

-- Keywords
-- Purple: storage, declaration, module keywords (const/let/import/export/function/return/type)
-- Cyan: flow-control keywords (if/else/for/while/try/catch/switch)
hi('@keyword', { fg = c.purple, italic = true })
hi('@keyword.function', { fg = c.purple, italic = true })
hi('@keyword.storage', { fg = c.purple, italic = true })
hi('@keyword.modifier', { fg = c.purple, italic = true })
hi('@keyword.type', { fg = c.purple, italic = true })
hi('@keyword.import', { fg = c.purple, italic = true })
hi('@keyword.export', { fg = c.purple, italic = true })
hi('@keyword.return', { fg = c.purple, italic = true })
hi('@keyword.conditional', { fg = c.cyan, italic = true })
hi('@keyword.conditional.ternary', { fg = c.cyan })
hi('@keyword.repeat', { fg = c.cyan, italic = true })
hi('@keyword.operator', { fg = c.cyan })
hi('@keyword.exception', { fg = c.cyan, italic = true })
hi('@keyword.debug', { fg = c.red })
-- Old treesitter group names (pre-0.9 fallbacks)
hi('@include', { fg = c.purple, italic = true })
hi('@storageclass', { fg = c.purple, italic = true })

-- Types
hi('@type', { fg = c.yellow })
hi('@type.builtin', { fg = c.yellow })
hi('@type.definition', { fg = c.yellow })
hi('@type.qualifier', { fg = c.purple, italic = true })

-- Attributes / decorators
hi('@attribute', { fg = c.purple, italic = true })
hi('@attribute.builtin', { fg = c.purple, italic = true })

-- Tags (HTML/JSX/TSX)
hi('@tag', { fg = c.pink })
hi('@tag.builtin', { fg = c.pink })
hi('@tag.attribute', { fg = c.purple, italic = true })
hi('@tag.delimiter', { fg = c.cyan })

-- Operators / Punctuation
hi('@operator', { fg = c.cyan })
hi('@punctuation.delimiter', { fg = c.cyan })
hi('@punctuation.bracket', { fg = c.cyan })
hi('@punctuation.special', { fg = c.cyan })

-- Modules / Namespaces
hi('@module', { fg = c.fg })
hi('@module.builtin', { fg = c.red, italic = true })
hi('@namespace', { fg = c.fg })

-- Labels
hi('@label', { fg = c.cyan })

-- Comments
hi('@comment', { fg = c.comment, italic = true })
hi('@comment.documentation', { fg = c.comment, italic = true })
hi('@comment.error', { fg = c.red, italic = true })
hi('@comment.warning', { fg = c.yellow, italic = true })
hi('@comment.todo', { fg = c.yellow, bold = true })
hi('@comment.note', { fg = c.blue, italic = true })

-- Markup (Markdown / RST)
hi('@markup.heading', { fg = c.green, bold = true })
hi('@markup.heading.1', { fg = c.green, bold = true })
hi('@markup.heading.2', { fg = c.green, bold = true })
hi('@markup.heading.3', { fg = c.green, bold = true })
hi('@markup.raw', { fg = c.purple })
hi('@markup.raw.block', { fg = c.purple })
hi('@markup.raw.inline', { fg = c.purple })
hi('@markup.italic', { fg = c.pink, italic = true })
hi('@markup.bold', { fg = c.pink, bold = true })
hi('@markup.strikethrough', { fg = c.comment, strikethrough = true })
hi('@markup.underline', { fg = c.orange, underline = true })
hi('@markup.quote', { fg = c.comment, italic = true })
hi('@markup.math', { fg = c.cyan })
hi('@markup.link', { fg = c.blue, underline = true })
hi('@markup.link.url', { fg = c.blue, underline = true })
hi('@markup.link.label', { fg = c.blue })
hi('@markup.list', { fg = c.fg })
hi('@markup.list.checked', { fg = c.green })
hi('@markup.list.unchecked', { fg = c.comment })

-- =====================
-- LSP SEMANTIC TOKENS
-- =====================
hi('@lsp.type.variable', { fg = c.fg })
hi('@lsp.type.parameter', { fg = c.red })
hi('@lsp.type.function', { fg = c.blue })
hi('@lsp.type.method', { fg = c.blue })
hi('@lsp.type.class', { fg = c.yellow })
hi('@lsp.type.interface', { fg = c.yellow })
hi('@lsp.type.struct', { fg = c.yellow })
hi('@lsp.type.type', { fg = c.yellow })
hi('@lsp.type.typeParameter', { fg = c.yellow })
hi('@lsp.type.namespace', { fg = c.fg })
hi('@lsp.type.keyword', { fg = c.purple, italic = true })
hi('@lsp.type.string', { fg = c.green })
hi('@lsp.type.number', { fg = c.orange })
hi('@lsp.type.operator', { fg = c.cyan })
hi('@lsp.type.comment', { fg = c.comment, italic = true })
hi('@lsp.type.enum', { fg = c.yellow })
hi('@lsp.type.enumMember', { fg = c.orange })
hi('@lsp.type.property', { fg = c.fg })
hi('@lsp.type.macro', { fg = c.cyan })
hi('@lsp.type.decorator', { fg = c.blue, italic = true })
hi('@lsp.type.builtinType', { fg = c.yellow })
hi('@lsp.type.selfKeyword', { fg = c.red, italic = true })
-- Typemod combinations (type + modifier) used by TypeScript LSP
hi('@lsp.typemod.variable.readonly', { fg = c.fg })
hi('@lsp.typemod.variable.local', { fg = c.fg })
hi('@lsp.typemod.variable.declaration', { fg = c.pink })
hi('@lsp.typemod.variable.defaultLibrary', { fg = c.blue })
hi('@lsp.typemod.function.defaultLibrary', { fg = c.blue })
hi('@lsp.typemod.variable.callable', { fg = c.blue })
hi('@lsp.mod.deprecated', { strikethrough = true })

hi('Identifier', { fg = c.pink })

-- =====================
-- TERMINAL COLORS
-- =====================
vim.g.terminal_color_0 = '#000000'
vim.g.terminal_color_1 = '#FF5370'
vim.g.terminal_color_2 = '#C3E88D'
vim.g.terminal_color_3 = '#FFCB6B'
vim.g.terminal_color_4 = '#82AAFF'
vim.g.terminal_color_5 = '#C792EA'
vim.g.terminal_color_6 = '#89DDFF'
vim.g.terminal_color_7 = '#ffffff'
vim.g.terminal_color_8 = '#4A4A4A'
vim.g.terminal_color_9 = '#FF5370'
vim.g.terminal_color_10 = '#C3E88D'
vim.g.terminal_color_11 = '#FFCB6B'
vim.g.terminal_color_12 = '#82AAFF'
vim.g.terminal_color_13 = '#C792EA'
vim.g.terminal_color_14 = '#89DDFF'
vim.g.terminal_color_15 = '#ffffff'
