# Install gvim for windows
The current gvim version is 9.0.1897 (x64) and the executable installation link is [vim\_9.0.1897](https://github.com/vim/vim-win32-installer/releases/download/v9.0.1897/gvim_9.0.1897_x64_signed.exe).

For more information, check [vim on github](https://github.com/vim/vim).

# Install vim-plug
vim-plug is a vim plugin manager.
The vim-plug is **with the vimfiles**. And can be got with `git clone` command.

To **explicitly** install vim-plug with the following command in powershell.
```
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "./vimfiles/autoload/plug.vim" -Force
```

For more information, check [vim-plug](https://github.com/junegunn/vim-plug).
