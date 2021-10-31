# NIDE - The Nvim IDE

![screen](/media/screenshot.png)

[Neovim](https://github.com/neovim/neovim) configuration that takes full advantage
of language server protocol, treesitter, and Lua scripting (available since Neovim version `0.5`).

## Philosophy

While this configuration includes a lot of plugins and aims to provide feature rich development
environment I try to keep the amount of configuration under control and remove everything
that's unnecessary. 

This configuration is heavily opinionated and made to my liking.

## Plugins

### [packer.nvim](https://github.com/wbthomason/packer.nvim)

Package manager written in lua the supports expressive config, dependency graph, lazy loading and much more.

### [Catppuccino.nvim](https://github.com/Pocco81/Catppuccino.nvim)

My (currently) favorite theme that supports all plugins, has high contract, and stands out.
Catpuccino comes with 3 themes, I personally use `neon_latter` but if you are considering
switching from material theme `dark_catppuccino` might be more to your liking.

## TODO

- Consider using https://github.com/kristijanhusak/vim-dadbod-ui for database access.
- https://github.com/pechorin/any-jump.vim
- https://github.com/kosayoda/nvim-lightbulb - lightbulb in sign column for lsp code actions

## Plugins to watch

- [rcarriga/nvim-notify](https://github.com/rcarriga/nvim-notify) provides nice notifications but I didn't find much
  use for it yet. Will be interesting to see what people come up with when it comes to integrating this plugin.

## Inspiration

- [LunarVim](https://github.com/LunarVim/LunarVim)
- [NvChad](https://github.com/NvChad/NvChad)
- [nvim-ide](https://github.com/johnsci911/nvim-ide)

