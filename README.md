# Quick deploy


- Install gvim from [vim](https://www.vim.org)
    or [vim on github](https://github.com/vim/vim).
- `git clone` this repository.
    The local path could be arbitrary, such as `<usr>/vim_config`.
- Create a ".vimrc" file under **user directory**, which contains:
    ```
    source path\to\vim_config\.vimrc
    ```
- Download `plug.vim` into `<usr>/vimfiles/autoload/`.
- Install following dependencies.
- Install plugins with vim-plug.
- Install extensions and language servers for coc.nvim.


# vim-plug

> A minimalist Vim plugin manager.

The vim-plug is built with vimscript.
[Download the plug.vim](https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim),
put it into `<usr>/vimfiles/autoload/`,
and the vim-plug will be ready to use after vim restarting.

For more info, visit [vim-plug](https://github.com/junegunn/vim-plug).


# Dependencies

`yarn` and `node.js` are necessary for some plugins.
And `vim_files` is necessary for some vim functions.


## vim\_files

Files in [vim\_files](https://github.com/TBD9rain/vim_files) are necessary,
including:

- spell file
- templates
- icon configuration for Vim-DevIcons
- language server configuration

The `g:my_vimfiles_path` in `.vimrc` should be the path of `_vimfiles` directory.
The paths in `coc-setting.json` should be aligned with the paths in `_vimfiles`.
By default, `vim_files` could be under `<usr>/`.


## chocolatey

chocolatey is a package manager on windows. And it's a good choice for *yarn* and *node.js* installation.
It can be installed with the following command in powershell with **administrative mode**.
```
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
iwr https://community.chocolatey.org/install.ps1 -UseBasicParsing | iex
```
For more info, visit [choco setup](https://docs.chocolatey.org/en-us/choco/setup).


## yarn and nodejs

After chocolatey installation, use the following commands to install ***yarn*** and ***node.js***.

```
choco install yarn
choco install nodejs
```


# markdown-preview.nvim

*markdown-preview.nvim* plugin is applied to preview markdown files with default web browser.
The ***yarn*** and ***node.js*** are needed for *markdown-preview.nvim* installation.

Add the following command in vim-plug block in .vimrc:
```
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
```

For more info, visit [mark-preview.nvim](https://github.com/iamcco/markdown-preview.nvim).


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

NERDTree could be loaded by vim-plug with an extra command in the .vimrc file:
```
Plug 'preservim/nerdtree'
```

For more info, visit [NERDTree](https://github.com/preservim/nerdtree).


# vim-airline

> vim-airline is a fast and lightweight alternative to powerline, written
in 100% vimscript with no outside dependencies.

vim-airline could be loaded by vim-plug with an extra command in the .vimrc file:
```
Plug 'vim-airline/vim-airline'
```

For more info, visit [vim-airline](https://github.com/vim-airline/vim-airline)


# Vim-DevIcons

> Adds Icons to Your Plugins

Vim-DevIcons could be loaded by vim-plug with an extra command in the .vimrc file:
```
Plug 'ryanoasis/vim-devicons'
```

The icon configuration file is under `<vim_files>/dev_icons`.

The icons for different filetype could be customized.
For more info, visit [Vim-DevIcons](https://github.com/ryanoasis/vim-devicons).


# coc.nvim

coc.nvim provides a rich extension ecosystem and implemented
the client features specified by Language Server Protocol (lsp).

The coc.nvim (including coc extensions and language server) can be configured
with the `coc-setting.json` file with json style.

Add the following command in coc.nvim block in .vimrc:
```
Plug 'neoclide/coc.nvim', {'branch': 'release'}
```

Use `:CocCommand workspace.showOutput <extension>/<languageserver>` to check corresponding log info.

For more info, visit [coc.nvim](https://github.com/neoclide/coc.nvim).


## Automatically Installed Extensions

There are automatically installed extensions by `let g:coc_global_extensions=` in .vimrc:

- [**coc-json**](https://github.com/neoclide/coc-json), for json file editting
- [**coc-vimlsp**](https://github.com/iamcco/coc-vimlsp), for vimscript
- [**coc-pyright**](https://github.com/fannheyward/coc-pyright), for python


## Language Server

Language servers path is set to the `<usr>/vim_files/languageserver` by default.


### Verible

> Verible is a suite of SystemVerilog developer tools,
> including a parser, style-linter, formatter and language server

Download Verible from [Verible Release](https://github.com/chipsalliance/verible/releases).
It is suggested to install Verible in the path: `/~language_server/verible/`.

The configuration file are under `<vim_files>/languageserver/verible/` by default.

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

Add the following command in vim-plug block in .vimrc:
```
Plug 'SirVer/ultisnips'
```

The snippets are under `<_vimfiles>/ultisnips`.

For more info, check [UltiSnipts](https://github.com/SirVer/ultisnips).


