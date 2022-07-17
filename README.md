*Still under development for closest experience to the original VSCode theme.*

# poimandres.nvim

Neovim version of the amazing [Poimandres theme](https://github.com/drcmda/poimandres-theme)

## Installation

**Packer**: 

```lua
use 'olivercederborg/poimandres.nvim'
```

## Configuration

**Lua**: 

```lua
-- lua/user/colorscheme.lua

local poimandres = require 'poimandres'

-- default setup values
poimandres.setup {
  bold_vert_split = false,
  dim_nc_background = false,
  disable_background = false,
  disable_float_background = false,
  disable_italics = false,
}

-- remember to set the colorscheme
vim.cmd('colorscheme poimandres')
```
