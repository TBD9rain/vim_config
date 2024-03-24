# Quick deploy

**Deployment after gvim installation:**
- `git clone` this repository
- move all files and directories to the vim location
including **.git** invisible directory
- install *yarn* and *node.js*
- run `:PlugInstallation` in vim command line


# Install gvim for windows

The current gvim version is 9.0.1897 (x64) and the executable installation link is [vim\_9.0.1897](https://github.com/vim/vim-win32-installer/releases/download/v9.0.1897/gvim_9.0.1897_x64_signed.exe).

The installation should be `C:\Program Files\Vim`.

For more info, check [vim on github](https://github.com/vim/vim).


# Install vim-plug

vim-plug is a vim plugin manager.
The vim-plug is **with the vimfiles**. And can be got with `git clone` command.

To **explicitly** install vim-plug with the following command in powershell.
```
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "./vimfiles/autoload/plug.vim" -Force
```

For more info, check [vim-plug](https://github.com/junegunn/vim-plug).


# Install markdown preview plugin

*markdown-preview.nvim* plugin from github is applied to preview markdown files with default web browser.
The ***yarn*** and ***node.js*** are needed for *markdown-preview.nvim* installation.

*markdown-preview.nvim* is installed through vim-plug command in gvim command line `:PlugInstallation` after adding the following command in vim-plug block in _vimrc:
```
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
```

For more info, check [mark-preview.nvim](https://github.com/iamcco/markdown-preview.nvim).


## Install chocolatey

*chocolatey* is a package manager on windows. And it's a good choice for *yarn* and *node.js* installation.
It can be installed with the following command in powershell with **administrative mode**.
```
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
iwr https://community.chocolatey.org/install.ps1 -UseBasicParsing | iex
```
For more info, check [choco setup](https://docs.chocolatey.org/en-us/choco/setup).


## Install yarn and nodejs

After chocolatey installation, use the following commands to install ***yarn*** and ***node.js***.

```
choco install yarn
choco install nodejs
```

For more info about chocolatey, check [Choco docs](https://docs.chocolatey.org/en-us/).


# Install NERDTree

> The NERDTree is a file system explorer for the Vim editor.

The installation could be completed by Plug-in with an extra command:
```
Plug 'preservim/nerdtree'
```

For more info, check [NERDTree](https://github.com/preservim/nerdtree).


