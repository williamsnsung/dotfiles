-- Arcoiris colorscheme for Neovim
-- Exactly matches the Ghostty Arcoiris theme palette

vim.cmd('highlight clear')
vim.g.colors_name = 'arcoiris'

-- Palette (direct from Ghostty Arcoiris theme)
local c = {
  -- ansi normal
  black   = '#333333',
  red     = '#da2700',
  green   = '#12c258',
  yellow  = '#ffc656',
  blue    = '#518bfc',
  magenta = '#e37bd9',
  cyan    = '#63fad5',
  white   = '#bab2b2',
  -- ansi bright
  br_black   = '#777777',
  br_red     = '#ffb9b9',
  br_green   = '#e3f6aa',
  br_yellow  = '#ffddaa',
  br_blue    = '#b3e8f3',
  br_magenta = '#cbbaf9',
  br_cyan    = '#bcffc7',
  br_white   = '#efefef',
  -- ui
  bg         = '#201f1e',
  fg         = '#eee4d9',
  cursor     = '#872929',
  cursor_txt = '#fffbf2',
  sel_bg     = '#25524a',
  sel_fg     = '#f3fffd',
  -- derived
  bg_light   = '#2e2c2b',  -- slightly lighter bg for cursorline, etc.
  bg_lighter = '#3a3836',  -- for visual selection, statusline
  comment    = '#777777',  -- same as br_black
  dimmed     = '#8a8279',  -- muted fg for line numbers etc.
}

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- ── Editor UI ──────────────────────────────────────────────────────
hi('Normal',        { fg = c.fg,       bg = c.bg })
hi('NormalFloat',   { fg = c.fg,       bg = c.bg_light })
hi('FloatBorder',   { fg = c.br_black, bg = c.bg_light })
hi('Cursor',        { fg = c.cursor_txt, bg = c.cursor })
hi('CursorLine',    { bg = c.bg_light })
hi('CursorLineNr',  { fg = c.yellow,   bg = c.bg_light, bold = true })
hi('LineNr',        { fg = c.dimmed })
hi('SignColumn',    { fg = c.dimmed,   bg = c.bg })
hi('ColorColumn',   { bg = c.bg_light })
hi('Visual',        { fg = c.sel_fg,   bg = c.sel_bg })
hi('VisualNOS',     { fg = c.sel_fg,   bg = c.sel_bg })
hi('Search',        { fg = c.bg,       bg = c.yellow })
hi('IncSearch',     { fg = c.bg,       bg = c.cyan })
hi('CurSearch',     { fg = c.bg,       bg = c.cyan })
hi('MatchParen',    { fg = c.cyan,     bold = true, underline = true })
hi('StatusLine',    { fg = c.fg,       bg = c.bg_lighter })
hi('StatusLineNC',  { fg = c.dimmed,   bg = c.bg_light })
hi('WinSeparator',  { fg = c.bg_lighter })
hi('Pmenu',         { fg = c.fg,       bg = c.bg_light })
hi('PmenuSel',      { fg = c.bg,       bg = c.cyan })
hi('PmenuSbar',     { bg = c.bg_lighter })
hi('PmenuThumb',    { bg = c.br_black })
hi('TabLine',       { fg = c.dimmed,   bg = c.bg_light })
hi('TabLineSel',    { fg = c.fg,       bg = c.bg,    bold = true })
hi('TabLineFill',   { bg = c.bg_light })
hi('Title',         { fg = c.green,    bold = true })
hi('NonText',       { fg = c.bg_lighter })
hi('SpecialKey',    { fg = c.bg_lighter })
hi('Whitespace',    { fg = c.bg_lighter })
hi('EndOfBuffer',   { fg = c.bg })
hi('Folded',        { fg = c.comment,  bg = c.bg_light })
hi('FoldColumn',    { fg = c.comment,  bg = c.bg })
hi('Directory',     { fg = c.blue })
hi('QuickFixLine',  { fg = c.fg,       bg = c.sel_bg })
hi('WildMenu',      { fg = c.bg,       bg = c.cyan })
hi('ModeMsg',       { fg = c.green })
hi('MoreMsg',       { fg = c.green })
hi('Question',      { fg = c.green })
hi('ErrorMsg',      { fg = c.br_red,   bg = c.bg,    bold = true })
hi('WarningMsg',    { fg = c.yellow })

-- ── Syntax (classic vim groups, used as fallback) ──────────────────
hi('Comment',       { fg = c.comment,  italic = true })
hi('Constant',      { fg = c.br_magenta })
hi('String',        { fg = c.br_green })
hi('Character',     { fg = c.br_green })
hi('Number',        { fg = c.br_yellow })
hi('Boolean',       { fg = c.magenta })
hi('Float',         { fg = c.br_yellow })
hi('Identifier',    { fg = c.fg })
hi('Function',      { fg = c.blue })
hi('Statement',     { fg = c.red,      bold = true })
hi('Conditional',   { fg = c.red })
hi('Repeat',        { fg = c.red })
hi('Label',         { fg = c.red })
hi('Operator',      { fg = c.cyan })
hi('Keyword',       { fg = c.red,      bold = true })
hi('Exception',     { fg = c.red })
hi('PreProc',       { fg = c.magenta })
hi('Include',       { fg = c.magenta })
hi('Define',        { fg = c.magenta })
hi('Macro',         { fg = c.magenta })
hi('PreCondit',     { fg = c.magenta })
hi('Type',          { fg = c.yellow })
hi('StorageClass',  { fg = c.yellow })
hi('Structure',     { fg = c.yellow })
hi('Typedef',       { fg = c.yellow })
hi('Special',       { fg = c.cyan })
hi('SpecialChar',   { fg = c.cyan })
hi('Tag',           { fg = c.green })
hi('Delimiter',     { fg = c.white })
hi('SpecialComment',{ fg = c.br_blue,  italic = true })
hi('Underlined',    { underline = true })
hi('Ignore',        { fg = c.comment })
hi('Error',         { fg = c.br_red,   bold = true })
hi('Todo',          { fg = c.bg,       bg = c.yellow, bold = true })

-- ── Treesitter highlight groups ────────────────────────────────────
hi('@comment',              { link = 'Comment' })
hi('@comment.documentation',{ fg = c.br_blue,  italic = true })
hi('@string',               { link = 'String' })
hi('@string.escape',        { fg = c.cyan })
hi('@string.special',       { fg = c.cyan })
hi('@character',            { link = 'Character' })
hi('@number',               { link = 'Number' })
hi('@float',                { link = 'Float' })
hi('@boolean',              { link = 'Boolean' })
hi('@constant',             { fg = c.br_magenta })
hi('@constant.builtin',     { fg = c.magenta,  bold = true })
hi('@constant.macro',       { fg = c.magenta })
hi('@variable',             { fg = c.fg })
hi('@variable.builtin',     { fg = c.red,      italic = true })
hi('@variable.parameter',   { fg = c.br_yellow })
hi('@variable.member',      { fg = c.br_blue })
hi('@function',             { fg = c.blue })
hi('@function.builtin',     { fg = c.cyan })
hi('@function.call',        { fg = c.blue })
hi('@function.macro',       { fg = c.magenta })
hi('@function.method',      { fg = c.blue })
hi('@function.method.call', { fg = c.blue })
hi('@constructor',          { fg = c.green })
hi('@keyword',              { fg = c.red,      bold = true })
hi('@keyword.import',       { fg = c.magenta })
hi('@keyword.function',     { fg = c.red,      bold = true })
hi('@keyword.return',       { fg = c.red,      bold = true })
hi('@keyword.operator',     { fg = c.cyan })
hi('@keyword.coroutine',    { fg = c.red })
hi('@operator',             { fg = c.cyan })
hi('@punctuation.bracket',  { fg = c.white })
hi('@punctuation.delimiter',{ fg = c.white })
hi('@punctuation.special',  { fg = c.cyan })
hi('@type',                 { fg = c.yellow })
hi('@type.builtin',         { fg = c.yellow,   bold = true })
hi('@type.definition',      { fg = c.yellow })
hi('@attribute',            { fg = c.magenta })
hi('@label',                { fg = c.red })
hi('@namespace',            { fg = c.green })
hi('@module',               { fg = c.green })
hi('@tag',                  { fg = c.red })
hi('@tag.attribute',        { fg = c.yellow })
hi('@tag.delimiter',        { fg = c.white })
hi('@markup.heading',       { fg = c.blue,     bold = true })
hi('@markup.link',          { fg = c.cyan,     underline = true })
hi('@markup.raw',           { fg = c.br_green })
hi('@markup.strong',        { bold = true })
hi('@markup.italic',        { italic = true })
hi('@diff.plus',            { fg = c.green })
hi('@diff.minus',           { fg = c.red })
hi('@diff.delta',           { fg = c.yellow })

-- ── LSP semantic tokens ────────────────────────────────────────────
hi('@lsp.type.class',       { fg = c.yellow })
hi('@lsp.type.enum',        { fg = c.yellow })
hi('@lsp.type.interface',   { fg = c.yellow,   italic = true })
hi('@lsp.type.struct',      { fg = c.yellow })
hi('@lsp.type.parameter',   { fg = c.br_yellow })
hi('@lsp.type.variable',    { fg = c.fg })
hi('@lsp.type.property',    { fg = c.br_blue })
hi('@lsp.type.function',    { fg = c.blue })
hi('@lsp.type.method',      { fg = c.blue })
hi('@lsp.type.macro',       { fg = c.magenta })
hi('@lsp.type.namespace',   { fg = c.green })
hi('@lsp.type.keyword',     { fg = c.red,      bold = true })
hi('@lsp.type.comment',     { link = 'Comment' })
hi('@lsp.type.string',      { link = 'String' })
hi('@lsp.type.number',      { link = 'Number' })
hi('@lsp.type.operator',    { fg = c.cyan })
hi('@lsp.type.lifetime',    { fg = c.magenta,  italic = true }) -- Rust lifetimes
hi('@lsp.type.selfKeyword', { fg = c.red,      italic = true }) -- Rust self
hi('@lsp.mod.deprecated',   { strikethrough = true })
hi('@lsp.mod.readonly',     { fg = c.br_magenta })

-- ── Diagnostics ────────────────────────────────────────────────────
hi('DiagnosticError',           { fg = c.red })
hi('DiagnosticWarn',            { fg = c.yellow })
hi('DiagnosticInfo',            { fg = c.blue })
hi('DiagnosticHint',            { fg = c.cyan })
hi('DiagnosticOk',              { fg = c.green })
hi('DiagnosticUnderlineError',  { undercurl = true, sp = c.red })
hi('DiagnosticUnderlineWarn',   { undercurl = true, sp = c.yellow })
hi('DiagnosticUnderlineInfo',   { undercurl = true, sp = c.blue })
hi('DiagnosticUnderlineHint',   { undercurl = true, sp = c.cyan })
hi('DiagnosticVirtualTextError',{ fg = c.red,    italic = true })
hi('DiagnosticVirtualTextWarn', { fg = c.yellow, italic = true })
hi('DiagnosticVirtualTextInfo', { fg = c.blue,   italic = true })
hi('DiagnosticVirtualTextHint', { fg = c.cyan,   italic = true })
hi('DiagnosticSignError',       { fg = c.red })
hi('DiagnosticSignWarn',        { fg = c.yellow })
hi('DiagnosticSignInfo',        { fg = c.blue })
hi('DiagnosticSignHint',        { fg = c.cyan })

-- ── gitsigns ───────────────────────────────────────────────────────
hi('GitSignsAdd',    { fg = c.green })
hi('GitSignsChange', { fg = c.yellow })
hi('GitSignsDelete', { fg = c.red })

-- ── Terminal colors (so :terminal inside nvim matches Ghostty) ─────
vim.g.terminal_color_0  = c.black
vim.g.terminal_color_1  = c.red
vim.g.terminal_color_2  = c.green
vim.g.terminal_color_3  = c.yellow
vim.g.terminal_color_4  = c.blue
vim.g.terminal_color_5  = c.magenta
vim.g.terminal_color_6  = c.cyan
vim.g.terminal_color_7  = c.white
vim.g.terminal_color_8  = c.br_black
vim.g.terminal_color_9  = c.br_red
vim.g.terminal_color_10 = c.br_green
vim.g.terminal_color_11 = c.br_yellow
vim.g.terminal_color_12 = c.br_blue
vim.g.terminal_color_13 = c.br_magenta
vim.g.terminal_color_14 = c.br_cyan
vim.g.terminal_color_15 = c.br_white
