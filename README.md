*Still under development for closest experience to the original VSCode theme.*

# Poimandres for Neovim

Neovim version of [poimandres vscode theme](https://github.com/drcmda/poimandres-theme), written in Lua with treesitter support. 

All variants of the theme will be available for use.

Plugin support will be added as I personally need it, or when it is requested.

## 📸 Screenshots:

### Lua
![Poimandres Lua](https://user-images.githubusercontent.com/47901349/180630938-34f3359d-f894-4bbf-a866-4db5959a58a6.png)

### TypeScript
![Poimandres Typescript](https://user-images.githubusercontent.com/47901349/180630895-0f4c894e-ebad-482a-8884-bdc71e53e4de.png)

## ⬇️ Installation

**Packer**: 

```lua
use 'olivercederborg/poimandres.nvim'
```

## 🚀 Usage:

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

## 🙌 Related

- [poimandres-theme](https://github.com/drcmda/poimandres-theme): VSCode version
- [poimandres-alacritty](https://github.com/z0al/poimandres-alacritty): Alacritty version
- [poimandres-iterm](https://github.com/alii/poimandres-iterm): Iterm version
- [poimandres-wezterm](https://github.com/olivercederborg/poimandres-wezterm): Wezterm version

### Hyper theme

```bash
hyper i hyper-pmndrs
```
