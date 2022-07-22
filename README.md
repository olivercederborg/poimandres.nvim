*Still under development for closest experience to the original VSCode theme.*

# Poimandres for Neovim

Neovim version of [poimandres vscode theme](https://github.com/drcmda/poimandres-theme), written in Lua with treesitter support. 

All variants of the theme will be available for use.

Plugin support will be added as I personally need it, or when it is requested.

## Screenshots

![Poimandres Base Theme](https://user-images.githubusercontent.com/47901349/180445055-92480553-0652-4155-8d41-835fec27245b.png)

## Installation

**Packer**: 

```lua
use 'olivercederborg/poimandres.nvim'
```

## Usage:

**Lua setup**: 

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
To enable Poimandres for `Lualine`, just set the theme in your Lualine configuration:

```lua
require('lualine').setup {
  options = {
    -- ... your lualine config
    theme = 'poimandres'
    -- ... your lualine config
  }
}
```

## Related

- [poimandres-theme](https://github.com/drcmda/poimandres-theme): VSCode version
- [poimandres-alacritty](https://github.com/z0al/poimandres-alacritty): Alacritty version
- [poimandres-iterm](https://github.com/alii/poimandres-iterm): Iterm version
- [poimandres-wezterm](https://github.com/olivercederborg/poimandres-wezterm): Wezterm version

### Hyper theme

```bash
hyper i hyper-pmndrs
```
