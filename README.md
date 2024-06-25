# Quick deploy

**Deployment after gvim installation:**
- `git clone` this repository into vim installation directory
- install dependencies
- install plugins with vim-plug


# Install gvim for windows

The current gvim version is 9.0.1897 (x64) and the executable installation link is [vim\_9.0.1897](https://github.com/vim/vim-win32-installer/releases/download/v9.0.1897/gvim_9.0.1897_x64_signed.exe).

For other versions or more info, check [vim on github](https://github.com/vim/vim).


# Dependencies


## \_vimfiles

Files in [\_vimfiles](https://github.com/TBD9rain/_vimfiles) are necessary,
including:

- spell file
- templates
- icon configuration for Vim-DevIcons
- language server

The `g:my_vimfiles_path` in `_vimrc` should be the path of `_vimfiles` directory.
The paths in `coc-setting.json` should be aligned with the paths in `_vimfiles`.


## chocolatey

chocolatey is a package manager on windows. And it's a good choice for *yarn* and *node.js* installation.
It can be installed with the following command in powershell with **administrative mode**.
```
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
iwr https://community.chocolatey.org/install.ps1 -UseBasicParsing | iex
```
For more info, check [choco setup](https://docs.chocolatey.org/en-us/choco/setup).


## yarn and nodejs

After chocolatey installation, use the following commands to install ***yarn*** and ***node.js***.

```
choco install yarn
choco install nodejs
```

For more info about chocolatey, check [Choco docs](https://docs.chocolatey.org/en-us/).


# vim-plug

> A minimalist Vim plugin manager.

The vim-plug is built with vimscript.
[Download the plug.vim](https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim),
put it in the vim autoload directory,
and the vim-plug will be ready to use after vim restarting.

For more info, check [vim-plug](https://github.com/junegunn/vim-plug).


# Nerd Fonts

> Nerd Fonts is a project that patches developer targeted fonts
with a high number of glyphs (icons).

To display vim-airline symbols,
Nerd Fonts are needed in vim.
Nerd Fonts could be downloaded from
[Nerd Fonts Download](https://www.nerdfonts.com/font-downloads).
The [DejaVuSansMono Nerd Font](https://github.com/dejavu-fonts/dejavu-fonts),
[JetBrainsMono Nerd Font](https://github.com/JetBrains/JetBrainsMono),
or [Meslo Nerd Font](https://github.com/andreberg/Meslo-Font)
is recommended.


# NERDTree

> The NERDTree is a file system explorer for the Vim editor.

NERDTree could be loaded by vim-plug with an extra command in the \_vimrc file:
```
Plug 'preservim/nerdtree'
```

For more info, check [NERDTree](https://github.com/preservim/nerdtree).


# vim-airline

> vim-airline is a fast and lightweight alternative to powerline, written
in 100% vimscript with no outside dependencies.

vim-airline could be loaded by vim-plug with an extra command in the \_vimrc file:
```
Plug 'vim-airline/vim-airline'
```

For more info, check [vim-airline](https://github.com/vim-airline/vim-airline)


# Vim-DevIcons

> Adds Icons to Your Plugins

Vim-DevIcons could be loaded by vim-plug with an extra command in the \_vimrc file:
```
Plug 'ryanoasis/vim-devicons'
```

The icon configuration file is under `<_vimfiles>/dev_icons`.

The icons for different filetype could be customized.
For more info, check [Vim-DevIcons](https://github.com/ryanoasis/vim-devicons).


# markdown-preview.nvim

*markdown-preview.nvim* plugin is applied to preview markdown files with default web browser.
The ***yarn*** and ***node.js*** are needed for *markdown-preview.nvim* installation.

Add the following command in vim-plug block in \_vimrc:
```
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
```

For more info, check [mark-preview.nvim](https://github.com/iamcco/markdown-preview.nvim).


# coc.nvim

coc.nvim provides a rich extension ecosystem and implemented
the client features specified by Language Server Protocol (lsp).

The coc.nvim (including coc extensions and language server) can be configured
with the `coc-setting.json` file with json style.

Add the following command in coc.nvim block in \_vimrc:
```
Plug 'neoclide/coc.nvim', {'branch': 'release'}
```

For more info, check [coc.nvim](https://github.com/neoclide/coc.nvim).


## Extensions

- [**coc-json**](https://github.com/neoclide/coc-json), for json file editting
- [**coc-vimlsp**](https://github.com/iamcco/coc-vimlsp), for vimscript
- [**coc-pyright**](https://github.com/fannheyward/coc-pyright), for python


## Language Server

### Verible

> Verible is a suite of SystemVerilog developer tools,
> including a parser, style-linter, formatter and language server

The verible language server and configurations are under `<_vimfiles>/languageserver/verible/`.

To configure the linter on style checking,
modify the "verible-verilog-lint.config" file according to
[Linter Rules](https://chipsalliance.github.io/verible/verilog_lint.html)

To configure the formatter,
modify the `args` in "coc-settings.json" for verible lsp and
use `<path/to/verible-verilog-ls> --helpfull` for help.

For more info, checkout [Verible](https://github.com/chipsalliance/verible)


# Spell Checking

User spell files are under `<_vimfiles>/spell/`
for modifying without administrative access.

The `*.add` file with good words could be changed manually.
After modifying `*.add`, use the following command in gvim to make it work:
```
:mkspell! <path_to/*.add>
```


# UltiSnips

> UltiSnips provides snippet management for the Vim editor.

A snippet is a short piece of text that is either re-used often or contains a lot of redundant text.

The UltiSnips has following features:
- tabstop with optional default text, predefined text items
- tabstop mirror with text transformation
- regular expression trigger
- shell, vim script, or python invocation

Add the following command in vim-plug block in \_vimrc:
```
Plug 'SirVer/ultisnips'
```

The snippets are under `<_vimfiles>/ultisnips`.

For more info, check [UltiSnipts](https://github.com/SirVer/ultisnips).


