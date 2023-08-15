local blend = require('poimandres.utils').blend

local M = {}

function M.get(config)
  local p = require 'poimandres.palette'

  local theme = {}
  local groups = config.groups or {}
  local styles = {
    italic = (config.disable_italics and p.none) or 'italic',
    vert_split = (config.bold_vert_split and groups.border) or p.none,
    background = (config.disable_background and p.none) or groups.background,
    float_background = (config.disable_float_background and p.none) or groups.panel,
  }
  styles.nc_background = (config.dim_nc_background and not config.disable_background and groups.panel)
    or styles.background

  theme = {
    ColorColumn = { bg = p.blueGray1 },
    Conceal = { bg = p.none },
    CurSearch = { link = 'IncSearch' },
    Cursor = { fg = p.background3, bg = p.blueGray1 },
    CursorColumn = { bg = p.background1 },
    -- CursorIM = {},
    CursorLine = { bg = p.background1 },
    CursorLineNr = { fg = p.text },
    DarkenedPanel = { bg = groups.panel },
    DarkenedStatusline = { bg = groups.panel },
    DiffAdd = { bg = blend(groups.git_add, groups.background, 0.5) },
    DiffChange = { bg = p.blueGray1 },
    DiffDelete = { bg = blend(groups.git_delete, groups.background, 0.5) },
    DiffText = { bg = blend(groups.git_text, groups.background, 0.5) },
    diffAdded = { link = 'DiffAdd' },
    diffChanged = { link = 'DiffChange' },
    diffRemoved = { link = 'DiffDelete' },
    Directory = { fg = p.blue3, bg = p.none },
    -- EndOfBuffer = {},
    ErrorMsg = { fg = p.pink3, style = 'bold' },
    FloatBorder = { fg = groups.border },
    FloatTitle = { fg = p.blueGray2 },
    FoldColumn = { fg = p.blueGray2 },
    Folded = { fg = p.text, bg = groups.panel },
    IncSearch = { fg = p.background3, bg = p.blue2 },
    LineNr = { fg = p.blueGray3 },
    MatchParen = { fg = p.background3, bg = p.blueGray3 },
    ModeMsg = { fg = p.blue3 },
    MoreMsg = { fg = p.blue3 },
    NonText = { fg = p.blue4 },
    Normal = { fg = p.text, bg = styles.background },
    NormalFloat = { fg = p.text, bg = styles.float_background },
    NormalNC = { fg = p.text, bg = styles.nc_background },
    NvimInternalError = { fg = '#ffffff', bg = p.pink3 },
    Pmenu = { fg = p.blueGray1, bg = styles.float_background },
    PmenuSbar = { bg = p.blueGray2 },
    PmenuSel = { fg = p.text, bg = p.background1 },
    PmenuThumb = { bg = p.blueGray3 },
    Question = { fg = p.yellow },
    -- QuickFixLine = {},
    -- RedrawDebugNormal = {}
    RedrawDebugClear = { fg = '#ffffff', bg = p.yellow },
    RedrawDebugComposed = { fg = '#ffffff', bg = p.teal2 },
    RedrawDebugRecompose = { fg = '#ffffff', bg = p.pink3 },
    Search = { fg = p.white, bg = p.blueGray3 },
    SpecialKey = { fg = p.teal1 },
    SpellBad = { sp = p.pink3, style = 'undercurl' },
    SpellCap = { sp = p.blue1, style = 'undercurl' },
    SpellLocal = { sp = p.yellow, style = 'undercurl' },
    SpellRare = { sp = p.blue1, style = 'undercurl' },
    SignColumn = { fg = p.text, bg = p.none },
    StatusLine = { fg = p.blue3, bg = styles.float_background },
    StatusLineNC = { fg = p.blue3, bg = styles.background },
    StatusLineTerm = { link = 'StatusLine' },
    StatusLineTermNC = { link = 'StatusLineNC' },
    TabLine = { fg = p.blue3, bg = styles.float_background },
    TabLineFill = { bg = styles.float_background },
    TabLineSel = { fg = p.text, bg = p.background1 },
    Title = { fg = p.text },
    VertSplit = { fg = groups.border, bg = styles.vert_split },
    Visual = { fg = p.text, bg = p.blueGray3 },
    -- VisualNOS = {},
    WarningMsg = { fg = p.yellow },
    Whitespace = { fg = p.blueGray3 },
    WildMenu = { link = 'IncSearch' },

    -- These groups are not listed as default vim groups,
    -- but they are defacto standard group names for syntax highlighting.
    -- commented out groups should chain up to their "preferred" group by
    -- default,
    -- Uncomment and edit if you want more specific syntax highlighting.

    Constant = { fg = p.text }, -- (preferred) any constant
    String = { fg = p.teal1 }, --   a string constant: "this is a string"
    Character = { fg = p.pink3 }, --  a character constant: 'c', '\n'
    Number = { fg = p.teal1 }, --   a number constant: 234, 0xff
    Boolean = { fg = p.teal1 }, --  a boolean constant: TRUE, false
    Float = { fg = p.teal1 }, --    a floating point constant: 2.3e10

    Identifier = { fg = p.blueGray1 }, -- (preferred) any variable name
    Function = { fg = p.blue2 }, -- function name (also: methods for classes)

    Statement = { fg = p.text }, -- (preferred) any statement
    Conditional = { fg = p.blueGray1 }, --  if, then, else, endif, switch, etc.
    Repeat = { fg = p.blue3 }, --   for, do, while, etc.
    Label = { fg = p.text }, --    case, default, etc.
    Operator = { fg = p.blue2 }, -- "sizeof", "+", "*", etc.
    Keyword = { fg = p.blue3 }, --  any other keyword
    Exception = { fg = p.blue3 }, --  try, catch, throw

    PreProc = { fg = p.text }, -- (preferred) generic Preprocessor
    Include = { fg = p.blueGray1 }, --  preprocessor #include
    -- Define        = { }, --   preprocessor #define
    -- Macro         = { }, --    same as Define
    -- PreCondit     = { }, --  preprocessor #if, #else, #endif, etc.

    Type = { fg = p.blueGray1 }, -- (preferred) int, long, char, etc.
    --[[ Structure = { fg = p.blueGray1 }, --  struct, union, enum, etc. ]]
    -- StorageClass  = { }, -- static, register, volatile, etc.
    -- Typedef = { fg = p.blueGray1 }, --  A typedef

    Special = { fg = p.blueGray2 }, -- (preferred) any special symbol
    -- SpecialChar   = { }, --  special character in a constant
    Tag = { fg = p.text }, --    you can use CTRL-] on this
    Delimiter = { fg = p.blueGray1 }, --  character that needs attention
    SpecialComment = { fg = p.blueGray1 }, -- special things inside a comment
    -- Debug         = { }, --    debugging statements

    Comment = { fg = p.blueGray1 }, -- (preferred) any special symbol

    Underlined = { style = 'underline' }, -- (preferred) text that stands out, HTML links
    Bold = { style = 'bold' },
    Italic = { style = 'italic' },

    -- ("Ignore", below, may be invisible...)
    -- Ignore = { }, -- (preferred) left blank, hidden  |hl-Ignore|

    Error = { fg = p.pink3 }, -- (preferred) any erroneous construct
    Todo = { bg = p.yellow, fg = p.background3 }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    qfLineNr = { fg = p.blueGray3 },
    qfFileName = { fg = p.blueGray2 },

    htmlH1 = { fg = p.teal1, style = 'bold' },
    htmlH2 = { fg = p.teal1, style = 'bold' },

    -- mkdHeading = { fg = c.orange, style = "bold" },
    -- mkdCode = { bg = c.terminal_black, fg = c.fg },
    mkdCodeDelimiter = { bg = p.background3, fg = p.text },
    mkdCodeStart = { fg = p.teal2, style = 'bold' },
    mkdCodeEnd = { fg = p.teal2, style = 'bold' },
    mkdLink = { fg = p.blue1, style = 'underline' },

    markdownHeadingDelimiter = { fg = p.blue4, style = 'bold' },
    markdownCode = { fg = p.blueGray1 },
    markdownCodeBlock = { fg = p.teal2 },
    markdownH1 = { fg = p.blue2, style = 'bold' },
    markdownH2 = { fg = p.blue2, style = 'bold' },
    markdownH3 = { fg = p.blue2, style = 'bold' },
    markdownH4 = { fg = p.blue2, style = 'bold' },
    markdownLinkText = { fg = p.blue1, style = 'underline' },

    debugPC = { bg = p.background1 }, -- used for highlighting the current line in terminal-debug
    debugBreakpoint = { bg = p.background2, fg = p.pink3 }, -- used for breakpoint colors in terminal-debug
    DiagnosticError = { fg = groups.error },
    DiagnosticHint = { fg = groups.hint },
    DiagnosticInfo = { fg = groups.info },
    DiagnosticWarn = { fg = groups.warn },
    DiagnosticDefaultError = { fg = groups.error },
    DiagnosticDefaultHint = { fg = groups.hint },
    DiagnosticDefaultInfo = { fg = groups.info },
    DiagnosticDefaultWarn = { fg = groups.warn },
    DiagnosticFloatingError = { fg = groups.error },
    DiagnosticFloatingHint = { fg = groups.hint },
    DiagnosticFloatingInfo = { fg = groups.info },
    DiagnosticFloatingWarn = { fg = groups.warn },
    DiagnosticSignError = { fg = groups.error },
    DiagnosticSignHint = { fg = groups.hint },
    DiagnosticSignInfo = { fg = groups.info },
    DiagnosticSignWarn = { fg = groups.warn },
    DiagnosticStatusLineError = { fg = groups.error, bg = groups.panel },
    DiagnosticStatusLineHint = { fg = groups.hint, bg = groups.panel },
    DiagnosticStatusLineInfo = { fg = groups.info, bg = groups.panel },
    DiagnosticStatusLineWarn = { fg = groups.warn, bg = groups.panel },
    DiagnosticUnderlineError = { sp = groups.error, style = 'undercurl' },
    DiagnosticUnderlineHint = { sp = groups.hint, style = 'undercurl' },
    DiagnosticUnderlineInfo = { sp = groups.info, style = 'undercurl' },
    DiagnosticUnderlineWarn = { sp = groups.warn, style = 'undercurl' },
    DiagnosticVirtualTextError = { fg = groups.error },
    DiagnosticVirtualTextHint = { fg = groups.hint },
    DiagnosticVirtualTextInfo = { fg = groups.info },
    DiagnosticVirtualTextWarn = { fg = groups.warn },

    -- Treesitter
    ['@variable'] = { fg = p.text },
    -- TSAttribute = {},
    -- TSKeywordReturn = { fg = p.teal2 },
    ['@boolean'] = { link = 'Boolean' },
    -- TSCharacter = { link = 'Character' },
    ['@comment'] = { link = 'Comment' },
    -- TSConditional = { link = 'Conditional' },
    ['@variable.builtin'] = { fg = p.blue2 },
    ['@constant.builtin'] = { fg = p.blue2 },
    ['@constant.falsy'] = { fg = p.pink3 },
    -- TSConstMacro = {},
    -- TSConstant = { fg = p.text },
    ['@constructor'] = { fg = p.teal1 },
    -- TSEmphasis = {},
    -- TSError = {},
    -- TSException = {},
    ['field'] = { fg = p.text },
    -- TSFloat = {},
    ['@function.builtin'] = { fg = p.blue2 },
    -- TSFuncMacro = {},
    ['@function'] = { link = 'Function' },
    ['@function.call'] = { fg = p.blueGray1 },
    TSInclude = { fg = p.blue2 },
    ['@keyword'] = { link = 'Keyword' },
    ['@keyword.return'] = { fg = p.teal2 },
    ['@keyword.function'] = { fg = p.blue2 },
    ['@keyword.operator'] = { fg = p.teal1 },
    ['@label'] = { fg = p.blue3 },
    -- TSLiteral = {},
    ['@method'] = { fg = p.teal1 },
    -- TSNamespace = {},
    -- TSNone = {},
    -- TSNumber = { link = 'Number' },
    ['@operator'] = { link = 'Operator' },
    ['@parameter'] = { fg = p.text },
    -- TSParameterReference = {},
    ['@property'] = { fg = p.blue2 },
    ['@punctuation.delimiter'] = { fg = groups.punctuation },
    ['@punctuation.special'] = { fg = groups.punctuation },
    ['@punctuation.bracket'] = { fg = p.text },
    -- TSRepeat = {},
    -- TSStrike = {},
    ['@string'] = { link = 'String' },
    ['@string.escape'] = { fg = p.pink3 },
    -- TSStringRegex = {},
    -- TSStringSpecial = { fg = p.teal1 },
    -- TSSymbol = {},
    ['@tag'] = { fg = p.teal1 },
    ['@tag.delimiter'] = { fg = p.text },
    ['@tag.attribute'] = { fg = p.blue3, style = styles.italic },
    ['@text'] = { fg = p.text },
    ['@title'] = { fg = groups.headings.h1, style = 'bold' },
    ['@type'] = { link = 'Type' },
    ['@type.builtin'] = { link = 'Type' },
    TSURI = { fg = groups.link },
    -- TSUnderline = {},

    -- tsx
    ['@keyword.export.tsx'] = { fg = p.teal1 },
    ['@keyword.import.tsx'] = { fg = p.teal1 },
    ['@import.identifier.tsx'] = { fg = p.blue2 },

    -- typescript
    ['@keyword.export.typescript'] = { fg = p.teal1 },
    ['@keyword.import.typescript'] = { fg = p.teal1 },
    ['@import.identifier.typescript'] = { fg = p.blue2 },
    typescriptVariable = { fg = p.blue2 },
    typescriptExport = { fg = p.teal1 },
    typescriptDefault = { fg = p.teal1 },
    typescriptConstraint = { fg = p.teal1 },
    typescriptBlock = { fg = p.text },
    typescriptIdentifierName = { fg = p.blueGray2 },
    typescriptTSInclude = { fg = p.teal1 },
    typescriptCastKeyword = { fg = p.blueGray2 },
    typescriptEnum = { fg = p.blue4 },
    typescriptTypeCast = { fg = p.blueGray2 },
    typescriptParenExp = { fg = p.blueGray2 },
    typescriptObjectType = { fg = p.blueGray1 },

    -- lua
    luaTSConstructor = { fg = p.blueGray1 },

    -- css
    cssTSFunction = { fg = p.blueGray1 },
    cssTSProperty = { fg = p.blue2 },
    cssTSType = { fg = p.teal1 },
    cssTSKeyword = { fg = p.blueGray1 },
    cssClassName = { fg = p.teal2, style = styles.italic },
    cssPseudoClass = { fg = p.blue3, style = styles.italic },
    cssDefinition = { fg = p.blue2 },
    cssTSError = { link = 'cssClassName' },

    -- vim.lsp.buf.document_highlight()
    LspReferenceText = { bg = p.blue2 },
    LspReferenceRead = { bg = p.blue2 },
    LspReferenceWrite = { bg = p.blue2 },

    -- lsp-highlight-codelens
    LspCodeLens = { fg = p.blueGray1 }, -- virtual text of code lens
    LspCodeLensSeparator = { fg = p.blueGray3 }, -- separator between two or more code lens

    -- nvim-ts-rainbow
    rainbowcol1 = { fg = p.blue1 },
    rainbowcol2 = { fg = p.teal1 },
    rainbowcol3 = { fg = p.yellow },
    rainbowcol4 = { fg = p.blue2 },
    rainbowcol5 = { fg = p.teal2 },
    rainbowcol6 = { fg = p.pink3 },
    rainbowcol7 = { fg = p.blue3 },

    -- romgrk/barbar.nvim
    BufferCurrent = { fg = p.text, bg = p.background2 },
    BufferCurrentIndex = { fg = p.text, bg = p.background2 },
    BufferCurrentMod = { fg = p.teal1, bg = p.background2 },
    BufferCurrentSign = { fg = p.blueGray1, bg = p.background2 },
    BufferCurrentTarget = { fg = p.yellow, bg = p.background2 },
    BufferInactive = { fg = p.blueGray1 },
    BufferInactiveIndex = { fg = p.blueGray1 },
    BufferInactiveMod = { fg = p.teal1 },
    BufferInactiveSign = { fg = p.blueGray2 },
    BufferInactiveTarget = { fg = p.yellow },
    BufferTabpageFill = { fg = groups.background, bg = groups.background },
    BufferVisible = { fg = p.blueGray1 },
    BufferVisibleIndex = { fg = p.blueGray1 },
    BufferVisibleMod = { fg = p.teal1 },
    BufferVisibleSign = { fg = p.blueGray2 },
    BufferVisibleTarget = { fg = p.yellow },

    -- lewis6991/gitsigns.nvim
    GitSignsAdd = { fg = groups.git_add },
    GitSignsChange = { fg = groups.git_change },
    GitSignsDelete = { fg = groups.git_delete },
    SignAdd = { link = 'GitSignsAdd' },
    SignChange = { link = 'GitSignsChange' },
    SignDelete = { link = 'GitSignsDelete' },

    -- mvllow/modes.nvim
    ModesCopy = { bg = p.yellow },
    ModesDelete = { bg = p.pink3 },
    ModesInsert = { bg = p.teal1 },
    ModesVisual = { bg = p.yellow },

    -- kyazdani42/nvim-tree.lua
    NvimTreeEmptyFolderName = { fg = p.blueGray3 },
    NvimTreeFileDeleted = { fg = p.pink3 },
    NvimTreeFileDirty = { fg = p.blue4 },
    NvimTreeFileMerge = { fg = p.blue2 },
    NvimTreeFileNew = { fg = p.teal1 },
    NvimTreeFileRenamed = { fg = p.blueGray3 },
    NvimTreeFileStaged = { fg = p.blue1 },
    NvimTreeFolderIcon = { fg = p.blue3 },
    NvimTreeFolderName = { fg = p.blue3 },
    NvimTreeGitDeleted = { fg = groups.git_delete },
    NvimTreeGitDirty = { fg = groups.git_dirty },
    NvimTreeGitIgnored = { fg = groups.git_ignore },
    NvimTreeGitMerge = { fg = groups.git_merge },
    NvimTreeGitNew = { fg = groups.git_add },
    NvimTreeGitRenamed = { fg = groups.git_rename },
    NvimTreeGitStaged = { fg = groups.git_stage },
    NvimTreeImageFile = { fg = p.text },
    NvimTreeNormal = { fg = p.text },
    NvimTreeOpenedFile = { fg = p.text, bg = p.background1 },
    NvimTreeOpenedFolderName = { link = 'NvimTreeFolderName' },
    NvimTreeRootFolder = { fg = p.teal1 },
    NvimTreeSpecialFile = { link = 'NvimTreeNormal' },
    NvimTreeWindowPicker = { fg = groups.bg, bg = p.blueGray1 },

    -- folke/which-key.nvim
    WhichKey = { fg = p.text },
    WhichKeyGroup = { fg = p.text },
    WhichKeySeparator = { fg = p.text },
    WhichKeyDesc = { fg = p.text },
    WhichKeyFloat = { bg = groups.panel },
    WhichKeyValue = { fg = p.text },

    -- luka-reineke/indent-blankline.nvim
    IndentBlanklineChar = { fg = p.background1 },
    IndentBlanklineContextChar = { fg = p.yellow, gui = 'nocombine' },
    IndentBlanklineContextStart = { fg = p.yellow, gui = 'underline' },
    IndentBlanklineSpaceChar = { link = 'Whitespace' },
    IndentBlanklineSpaceCharBlankline = { link = 'Whitespace' },

    -- hrsh7th/nvim-cmp
    CmpItemAbbr = { fg = p.blueGray2 },
    CmpItemAbbrDeprecated = { fg = p.pink3, style = 'strikethrough' },
    CmpItemAbbrMatch = { fg = p.text, style = 'bold' },
    CmpItemAbbrMatchFuzzy = { fg = p.teal1, style = 'bold' },
    CmpItemKind = { fg = p.blue3 },
    CmpItemKindClass = { fg = p.yellow },
    CmpItemKindFunction = { fg = p.blue1 },
    CmpItemKindInterface = { fg = p.blue2 },
    CmpItemKindMethod = { fg = p.pink3 },
    CmpItemKindSnippet = { fg = p.blueGray1 },
    CmpItemKindVariable = { fg = p.teal1 },

    -- ray-x/lsp_signature.nvim
    LspSignatureActiveParameter = { bg = p.blueGray1 },

    -- rlane/pounce.nvim
    PounceAccept = { fg = p.pink3, bg = p.text },
    PounceAcceptBest = { fg = p.text, bg = p.text },
    PounceGap = { link = 'Search' },
    PounceMatch = { link = 'Search' },

    -- nvim-telescope/telescope.nvim
    TelescopeMatching = { fg = p.teal1 },
    TelescopeNormal = { fg = p.text },
    TelescopeSelection = { fg = p.text, bg = p.background1 },
    TelescopeTitle = { fg = p.blueGray2 },
    TelescopeBorder = { fg = p.background1 },
    TelescopePromptBorder = { fg = p.background1 },
    TelescopePromptNormal = { fg = p.text },
    TelescopePromptPrefix = { fg = p.blueGray2 },
    TelescopePreviewTitle = { fg = p.background2, bg = p.teal1 },
    TelescopePromptTitle = { fg = p.background2, bg = p.blue1 },
    TelescopeResultsDiffAdd = { fg = p.teal1 },
    TelescopeResultsDiffChange = { fg = p.yellow },
    TelescopeResultsDiffDelete = { fg = p.pink3 },

    -- phaazon/hop.nvim
    HopNextKey = { fg = p.blue1 },
    HopNextKey1 = { fg = p.teal1 },
    HopNextKey2 = { fg = p.teal2 },
    HopUnmatched = { fg = p.blueGray3 },
    HopCursor = { fg = p.blue3 },

    -- ggandor/leap.nvim
    LeapMatch = { fg = p.background2, bg = p.pink2 },
    LeapLabelPrimary = { fg = p.background2, bg = p.teal1 },
    LeapLabelSecondary = { fg = p.background2, bg = p.blue1 },
    LeapLabelSelected = { fg = p.background2, bg = p.yellow },
    LeapBackground = { bg = p.background1 },

    -- rcarriga/nvim-notify
    NotifyINFOBorder = { fg = p.teal1 },
    NotifyINFOTitle = { link = 'NotifyINFOBorder' },
    NotifyINFOIcon = { link = 'NotifyINFOBorder' },
    NotifyWARNBorder = { fg = p.yellow },
    NotifyWARNTitle = { link = 'NotifyWARNBorder' },
    NotifyWARNIcon = { link = 'NotifyWARNBorder' },
    NotifyDEBUGBorder = { fg = p.blue1 },
    NotifyDEBUGTitle = { link = 'NotifyDEBUGBorder' },
    NotifyDEBUGIcon = { link = 'NotifyDEBUGBorder' },
    NotifyTRACEBorder = { fg = p.blue1 },
    NotifyTRACETitle = { link = 'NotifyTRACEBorder' },
    NotifyTRACEIcon = { link = 'NotifyTRACEBorder' },
    NotifyERRORBorder = { fg = p.pink3 },
    NotifyERRORTitle = { link = 'NotifyERRORBorder' },
    NotifyERRORIcon = { link = 'NotifyERRORBorder' },

    -- glepnir/lspsaga.nvim
    TitleString = { fg = p.blue2 },
    TitleIcon = { fg = p.blue2 },
    SagaBorder = { bg = p.background2, fg = p.blueGray2 },
    SagaNormal = { bg = p.background2 },
    SagaExpand = { fg = p.teal2 },
    SagaCollapse = { fg = p.teal2 },
    SagaBeacon = { bg = p.yellow },
    -- code action
    ActionPreviewNormal = { link = 'SagaNormal' },
    ActionPreviewBorder = { link = 'SagaBorder' },
    ActionPreviewTitle = { fg = p.blueGray2, bg = p.background2 },
    CodeActionNormal = { link = 'SagaNormal' },
    CodeActionBorder = { link = 'SagaBorder' },
    CodeActionText = { fg = p.yellow },
    CodeActionNumber = { fg = p.blue3 },
    -- finder
    FinderSelection = { fg = p.blueGray2, bold = true },
    FinderFileName = { fg = p.white },
    FinderCount = { link = 'Label' },
    FinderIcon = { fg = p.yellow },
    FinderType = { fg = p.teal1 },
    --finder spinner
    FinderSpinnerTitle = { fg = p.pink3, bold = true },
    FinderSpinner = { fg = p.pink3, bold = true },
    FinderPreviewSearch = { link = 'Search' },
    FinderVirtText = { fg = p.blue1 },
    FinderNormal = { link = 'SagaNormal' },
    FinderBorder = { link = 'SagaBorder' },
    FinderPreviewBorder = { link = 'SagaBorder' },
    -- definition
    DefinitionBorder = { link = 'SagaBorder' },
    DefinitionNormal = { link = 'SagaNormal' },
    DefinitionSearch = { link = 'Search' },
    -- hover
    HoverNormal = { link = 'SagaNormal' },
    HoverBorder = { link = 'SagaBorder' },
    -- rename
    RenameBorder = { link = 'SagaBorder' },
    RenameNormal = { fg = p.white, p.background2 },
    RenameMatch = { link = 'Search' },
    -- diagnostic
    DiagnosticBorder = { link = 'SagaBorder' },
    DiagnosticSource = { fg = p.blueGray2 },
    DiagnosticNormal = { link = 'SagaNormal' },
    DiagnosticErrorBorder = { link = 'DiagnosticError' },
    DiagnosticWarnBorder = { link = 'DiagnosticWarn' },
    DiagnosticHintBorder = { link = 'DiagnosticHint' },
    DiagnosticInfoBorder = { link = 'DiagnosticInfo' },
    DiagnosticPos = { fg = p.blueGray2 },
    DiagnosticWord = { fg = p.white },
    -- Call Hierachry
    CallHierarchyNormal = { link = 'SagaNormal' },
    CallHierarchyBorder = { link = 'SagaBorder' },
    CallHierarchyIcon = { fg = p.pink2 },
    CallHierarchyTitle = { fg = p.pink2 },
    -- lightbulb
    LspSagaLightBulb = { link = 'DiagnosticSignHint' },
    -- shadow
    SagaShadow = { bg = p.background3 },
    -- Outline
    OutlineIndent = { fg = p.blue2 },
    OutlinePreviewBorder = { link = 'SagaNormal' },
    OutlinePreviewNormal = { link = 'SagaBorder' },
    -- Float term
    TerminalBorder = { link = 'SagaBorder' },
    TerminalNormal = { link = 'SagaNormal' },
  }

  vim.g.terminal_color_0 = p.background3 -- black
  vim.g.terminal_color_8 = p.background3 -- bright black
  vim.g.terminal_color_1 = p.pink3 -- red
  vim.g.terminal_color_9 = p.pink3 -- bright red
  vim.g.terminal_color_2 = p.teal1 -- green
  vim.g.terminal_color_10 = p.teal1 -- bright green
  vim.g.terminal_color_3 = p.yellow -- yellow
  vim.g.terminal_color_11 = p.yellow -- bright yellow
  vim.g.terminal_color_4 = p.blue1 -- blue
  vim.g.terminal_color_12 = p.blue2 -- bright blue
  vim.g.terminal_color_5 = p.pink2 -- magenta
  vim.g.terminal_color_13 = p.pink2 -- bright magenta
  vim.g.terminal_color_6 = p.blue1 -- cyan
  vim.g.terminal_color_14 = p.blue2 -- bright cyan
  vim.g.terminal_color_7 = p.white -- white
  vim.g.terminal_color_15 = p.white -- bright white

  return theme
end

return M
