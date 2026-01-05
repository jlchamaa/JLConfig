-- This is Vim's default color scheme. It doesn't define the Normal
-- highlighting, it uses whatever the colors used to be.
-- Ultra Violent Colors
local uv_black = '#242728'
local uv_red = '#ff0090'
local uv_green = '#b6ff00'
local uv_yellow = '#fff727'
local uv_blue = '#47e0fb'
local uv_purple = '#d731ff'
local uv_cyan = '#0effbb'
local uv_white = '#e1e1e1'
local uv_brightBlack = '#636667'
local uv_brightRed = '#fb58b4'
local uv_brightGreen = '#deff8c'
local uv_brightYellow = '#ebe087'
local uv_brightBlue = '#7fecff'
local uv_brightPurple = '#e681ff'
local uv_brightCyan = '#69fcd3'
local uv_brightWhite = '#f9f9f5'
local uv_background = '#242728'
local uv_foreground = '#c1c1c1'
local uv_cursorColor = '#c1c1c1'
local uv_selectionBackground = '#574c49'

vim.cmd.highlight('clear')
vim.g.colors_name = 'ultraviolent'

local hi = function(name, val)
  -- Force links
  val.force = true

  -- Make sure that `cterm` attribute is not populated from `gui`
  val.cterm = val.cterm or {} ---@type vim.api.keyset.highlight

  -- Define global highlight
  vim.api.nvim_set_hl(0, name, val)
end

--stylua: ignore start
-- General
hi('Normal', {bg = uv_black})
hi('activeNormal', {bg = "#121212"})

hi('Conceal',      { fg = 'LightGrey', bg = 'DarkGrey'})
hi('Cursor',       {})
hi('lCursor',      {})
hi('DiffText',     { bg = uv_red, bold = true})
hi('ErrorMsg',     { fg = uv_white, bg = uv_red})
hi('IncSearch',    { reverse = true })
hi('ModeMsg',      { bold = true})
hi('NonText',      { fg = uv_blue, bold = true})
hi('PmenuSbar',    { bg = 'Grey'})
hi('StatusLine',   { reverse = true, bold = true})
hi('StatusLineNC', { reverse = true})
hi('TabLineFill',  { reverse = true})
hi('TabLineSel',   { bold = true})
hi('TermCursor',   { bg = uv_brightWhite})
hi('WinBar',       { bold = true})
hi('WildMenu',     { fg = uv_black, bg = uv_yellow})

hi('VertSplit',      { link = 'Normal' })
hi('WinSeparator',   { link = 'VertSplit' })
hi('WinBarNC',       { link = 'WinBar' })
hi('EndOfBuffer',    { link = 'NonText' })
hi('LineNrAbove',    { link = 'LineNr' })
hi('LineNrBelow',    { link = 'LineNr' })
hi('QuickFixLine',   { link = 'Search' })
hi('CursorLineSign', { link = 'SignColumn' })
hi('CursorLineFold', { link = 'FoldColumn' })
hi('CurSearch',      { link = 'Search' })
hi('PmenuKind',      { link = 'Pmenu' })
hi('PmenuKindSel',   { link = 'PmenuSel' })
hi('PmenuMatch',     { link = 'Pmenu' })
hi('PmenuMatchSel',  { link = 'PmenuSel' })
hi('PmenuExtra',     { link = 'Pmenu' })
hi('PmenuExtraSel',  { link = 'PmenuSel' })
hi('ComplMatchIns',  {})
hi('Substitute',     { link = 'Search' })
hi('Whitespace',     { link = 'NonText' })
hi('MsgSeparator',   { link = 'StatusLine' })
hi('NormalFloat',    { link = 'Pmenu' })
hi('FloatBorder',    { link = 'WinSeparator' })
hi('FloatTitle',     { link = 'Title' })
hi('FloatFooter',    { link = 'Title' })

hi('FloatShadow',          { bg = uv_black, blend=80 })
hi('FloatShadowThrough',   { bg = uv_black, blend=100 })
hi('RedrawDebugNormal',    { reverse = true})
hi('RedrawDebugClear',     { bg = uv_yellow})
hi('RedrawDebugComposed',  { bg = uv_green})
hi('RedrawDebugRecompose', { bg = uv_red})
hi('Error',                { fg = uv_white, bg = uv_red})
hi('Todo',                 { fg = uv_blue, bg = uv_yellow})

hi('String',         { link = 'Constant' })
hi('Character',      { link = 'Constant' })
hi('Number',         { link = 'Constant' })
hi('Boolean',        { link = 'Constant' })
hi('Float',          { link = 'Number' })
hi('Function',       { link = 'Identifier' })
hi('Conditional',    { link = 'Statement' })
hi('Repeat',         { link = 'Statement' })
hi('Label',          { link = 'Statement' })
hi('Operator',       { link = 'Statement' })
hi('Keyword',        { link = 'Statement' })
hi('Exception',      { link = 'Statement' })
hi('Include',        { link = 'PreProc' })
hi('Define',         { link = 'PreProc' })
hi('Macro',          { link = 'PreProc' })
hi('PreCondit',      { link = 'PreProc' })
hi('StorageClass',   { link = 'Type' })
hi('Structure',      { link = 'Type' })
hi('Typedef',        { link = 'Type' })
hi('Tag',            { link = 'Special' })
hi('SpecialChar',    { link = 'Special' })
hi('Delimiter',      { link = 'Special' })
hi('SpecialComment', { link = 'Special' })
hi('Debug',          { link = 'Special' })

hi('DiagnosticError',            { fg = uv_red})
hi('DiagnosticWarn',             { fg = 'Orange'})
hi('DiagnosticInfo',             { fg = uv_brightBlue})
hi('DiagnosticHint',             { fg = 'LightGrey'})
hi('DiagnosticOk',               { fg = uv_lightGreen})
hi('DiagnosticUnderlineError',   { sp = uv_red, underline = true})
hi('DiagnosticUnderlineWarn',    { sp = 'Orange', underline = true})
hi('DiagnosticUnderlineInfo',    { sp = uv_brightBlue, underline = true})
hi('DiagnosticUnderlineHint',    { sp = 'LightGrey', underline = true})
hi('DiagnosticUnderlineOk',      { sp = uv_lightGreen, underline = true})
hi('DiagnosticVirtualTextError', { link = 'DiagnosticError' })
hi('DiagnosticVirtualTextWarn',  { link = 'DiagnosticWarn' })
hi('DiagnosticVirtualTextInfo',  { link = 'DiagnosticInfo' })
hi('DiagnosticVirtualTextHint',  { link = 'DiagnosticHint' })
hi('DiagnosticVirtualTextOk',    { link = 'DiagnosticOk' })
hi('DiagnosticFloatingError',    { link = 'DiagnosticError' })
hi('DiagnosticFloatingWarn',     { link = 'DiagnosticWarn' })
hi('DiagnosticFloatingInfo',     { link = 'DiagnosticInfo' })
hi('DiagnosticFloatingHint',     { link = 'DiagnosticHint' })
hi('DiagnosticFloatingOk',       { link = 'DiagnosticOk' })
hi('DiagnosticSignError',        { link = 'DiagnosticError' })
hi('DiagnosticSignWarn',         { link = 'DiagnosticWarn' })
hi('DiagnosticSignInfo',         { link = 'DiagnosticInfo' })
hi('DiagnosticSignHint',         { link = 'DiagnosticHint' })
hi('DiagnosticSignOk',           { link = 'DiagnosticOk' })
hi('DiagnosticDeprecated',       { sp = uv_red, strikethrough = true})

hi('DiagnosticUnnecessary', { link = 'Comment' })
hi('LspInlayHint',          { link = 'NonText' })
hi('SnippetTabstop',        { link = 'Visual' })

-- Text
hi('@markup.raw',       { link = 'Comment' })
hi('@markup.link',      { link = 'Identifier' })
hi('@markup.heading',   { link = 'Title' })
hi('@markup.link.url',  { link = 'Underlined' })
hi('@markup.underline', { link = 'Underlined' })
hi('@comment.todo',     { link = 'Todo' })

-- Miscs
hi('@comment',     { link = 'Comment' })
hi('@punctuation', { link = 'Delimiter' })

-- Constants
hi('@constant',          { link = 'Constant' })
hi('@constant.builtin',  { link = 'Special' })
hi('@constant.macro',    { link = 'Define' })
hi('@keyword.directive', { link = 'Define' })
hi('@string',            { link = 'String' })
hi('@string.escape',     { link = 'SpecialChar' })
hi('@string.special',    { link = 'SpecialChar' })
hi('@character',         { link = 'Character' })
hi('@character.special', { link = 'SpecialChar' })
hi('@number',            { link = 'Number' })
hi('@boolean',           { link = 'Boolean' })
hi('@number.float',      { link = 'Float' })

-- Functions
hi('@function',                   { link = 'Function' })
hi('@function.builtin',           { link = 'Special' })
hi('@function.macro',             { link = 'Macro' })
hi('@function.method',            { link = 'Function' })
hi('@variable.parameter',         { link = 'Identifier' })
hi('@variable.parameter.builtin', { link = 'Special' })
hi('@variable.member',            { link = 'Identifier' })
hi('@property',                   { link = 'Identifier' })
hi('@attribute',                  { link = 'Macro' })
hi('@attribute.builtin',          { link = 'Special' })
hi('@constructor',                { link = 'Special' })

-- Keywords
hi('@keyword.conditional', { link = 'Conditional' })
hi('@keyword.repeat',      { link = 'Repeat' })
hi('@keyword.type',        { link = 'Structure' })
hi('@label',               { link = 'Label' })
hi('@operator',            { link = 'Operator' })
hi('@keyword',             { link = 'Keyword' })
hi('@keyword.exception',   { link = 'Exception' })

hi('@variable',          { link = 'Identifier' })
hi('@type',              { link = 'Type' })
hi('@type.definition',   { link = 'Typedef' })
hi('@module',            { link = 'Identifier' })
hi('@keyword.import',    { link = 'Include' })
hi('@keyword.directive', { link = 'PreProc' })
hi('@keyword.debug',     { link = 'Debug' })
hi('@tag',               { link = 'Tag' })
hi('@tag.builtin',       { link = 'Special' })

-- LSP semantic tokens
hi('@lsp.type.class',         { link = 'Structure' })
hi('@lsp.type.comment',       { link = 'Comment' })
hi('@lsp.type.decorator',     { link = 'Function' })
hi('@lsp.type.enum',          { link = 'Structure' })
hi('@lsp.type.enumMember',    { link = 'Constant' })
hi('@lsp.type.function',      { link = 'Function' })
hi('@lsp.type.interface',     { link = 'Structure' })
hi('@lsp.type.macro',         { link = 'Macro' })
hi('@lsp.type.method',        { link = 'Function' })
hi('@lsp.type.namespace',     { link = 'Structure' })
hi('@lsp.type.parameter',     { link = 'Identifier' })
hi('@lsp.type.property',      { link = 'Identifier' })
hi('@lsp.type.struct',        { link = 'Structure' })
hi('@lsp.type.type',          { link = 'Type' })
hi('@lsp.type.typeParameter', { link = 'TypeDef' })
hi('@lsp.type.variable',      { link = 'Identifier' })

-- Default colors only used with a dark background.
hi('ColorColumn',      { bg = uv_red})
hi('CursorColumn',     { bg = 'Grey40'})
hi('CursorLine',       { bg = 'Grey40'})
hi('CursorLineNr',     { fg = uv_yellow, bold = true})
hi('DiffAdd',          { bg = uv_blue})
hi('DiffChange',       { bg = 'DarkMagenta'})
hi('DiffDelete',       { fg = uv_blue, bg = uv_cyan, bold = true})
hi('Directory',        { fg = uv_brightCyan})
hi('FoldColumn',       { fg = uv_brightCyan, bg = 'Grey'})
hi('Folded',           { fg = uv_brightCyan, bg = 'DarkGrey'})
hi('LineNr',           { fg = uv_yellow})
hi('MatchParen',       { bg = uv_brightBlack, bold = true, reverse = true})
hi('MoreMsg',          { fg = 'SeaGreen', bold = true})
hi('Pmenu',            { fg = uv_black, bg = uv_brightPurple})
hi('PmenuSel',         { bg = 'DarkGrey'})
hi('PmenuThumb',       { bg = uv_white})
hi('Question',         { fg = uv_green, bold = true})
hi('Search',           { fg = uv_black, bg = uv_yellow})
hi('SignColumn',       { fg = uv_brightCyan, bg = 'Grey'})
hi('SpecialKey',       { fg = uv_brightCyan})
hi('SpellBad',         { sp = uv_red, undercurl = true})
hi('SpellCap',         { sp = uv_blue, undercurl = true})
hi('SpellLocal',       { sp = uv_brightCyan, undercurl = true})
hi('SpellRare',        { sp = 'Magenta', undercurl = true})
hi('StatusLineTerm',   { fg = uv_black, bg = uv_lightGreen, bold = true})
hi('StatusLineTermNC', { fg = uv_black, bg = uv_lightGreen})
hi('TabLine',          { bg = 'DarkGrey', underline = true})
hi('Title',            { fg = 'Magenta', bold = true})
hi('Visual',           { fg = 'LightGrey', bg = '#575757'})
hi('WarningMsg',       { fg = uv_red})
hi('Comment',          { fg = uv_blue})
hi('Constant',         { fg = uv_red})
hi('Special',          { fg = 'Orange'})
hi('Identifier',       { fg = uv_cyan})
hi('Statement',        { fg = uv_yellow, bold = true})
hi('PreProc',          { fg = uv_brightPurple})
hi('Type',             { fg = uv_green, bold = true})
hi('Underlined',       { fg = '#80a0ff', underline = true})
--stylua: ignore end
