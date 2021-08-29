# NIDE - The Nvim IDE

![screen](/media/screenshot.png)

[Neovim](https://github.com/neovim/neovim) configuration that takes full advantage
of language server protocol and Lua scripting (available since version `0.5`).

## Philosophy

While this configuration includes a lot of plugins and aims to provide feature rich development
environment I try to keep the amount of configuration under control and remove everything
that is not necessary.

This configuration is heavily opinionated and made to my liking.

## What's included

- LSP based completion, highlight, code actions, diagnostics, navigation, and more
- adjusted look with material theme, bufferline, and lualine
- integrated terminal
- file system tree and symbols outline for easy navigation
- fuzzy searching over almost anything using [telescope](https://github.com/nvim-telescope/telescope.nvim)
- ...

### Supported languages

- LSP:
  - bash
  - css
  - deno
  - docker
  - go
  - html
  - json
  - python
  - rust
  - terraform
  - typescript
  - vim
  - yaml
- other:
  - jsonnet
  - rego
  - toml

## Bindings

- `<leader>t*` for **t**oggling things such as git blame, file tree, symbols outline, etc.
- `<leader>s*` for **s**howing available actions for code such as code actions, diagnostics, definition preview,
  and more
- `<leader>c*` for code a**c**tions such as formatting, renaming, and more
- `<leader>f*` for **f**inding stuff such as files, commands, code, commits, buffers, etc.
- ...

## TODO

- Consider using https://github.com/kristijanhusak/vim-dadbod-ui for database access.
- https://github.com/brooth/far.vim for replacing accross multiple files.
- https://github.com/ray-x/lsp_signature.nvim

