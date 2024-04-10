# Quick deploy

**Deployment after gvim installation:**
- `git clone` this repository into vim installation directory
- run `:PlugInstall` in vim command line to download plugins


# Install gvim for windows

The current gvim version is 9.0.1897 (x64) and the executable installation link is [vim\_9.0.1897](https://github.com/vim/vim-win32-installer/releases/download/v9.0.1897/gvim_9.0.1897_x64_signed.exe).

For more info, check [vim on github](https://github.com/vim/vim).


# vim-plug

> A minimalist Vim plugin manager.

The vim-plug is built with vimscript.
[Download the plug.vim](https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim),
put it in the vim autoload directory,
and the vim-plug will be ready to use after vim restarting.

For more info, check [vim-plug](https://github.com/junegunn/vim-plug).


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

## Nerd Fonts

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


# markdown-preview.nvim

*markdown-preview.nvim* plugin is applied to preview markdown files with default web browser.
The ***yarn*** and ***node.js*** are needed for *markdown-preview.nvim* installation.

Add the following command in vim-plug block in _vimrc:
```
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
```

For more info, check [mark-preview.nvim](https://github.com/iamcco/markdown-preview.nvim).


## chocolatey

*chocolatey* is a package manager on windows. And it's a good choice for *yarn* and *node.js* installation.
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


