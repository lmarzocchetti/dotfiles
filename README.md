# dotfiles

![2025-05-12-131329_3840x1080_scrot](https://github.com/user-attachments/assets/c2076464-0ed8-46c6-af8c-4551446fa18f)


My personal dotfiles, include:

Window Manager:
- Dwm: patched with support for double monitor, fullscreen, autostart, and vanitygaps
- Dwm-bar: simple bar for dwm written in bash
- Slock: simple lock manager (need to create the systemd service for that, read Slock repo)

Text Editor:    
- Emacs: With some customization, including support for: C/C++, Zig, Common Lisp, Ocaml, Haskell.
- NeoVim: Not my main editor but have support for: C/C++, python, Zig (optional you can enable rust uncommenting some lines in "nvim/lua/custom/configs/lspconfig.lua")

### Installation
#### Window Manager
- For Dwm and Slock, put where you want these folders and simply do "make", "sudo make install" (for Slock there are additional steps to create the service, see Slock repo)
- Dwm-Bar is a shell script so put the folder where you want. Create in $HOME a folder ".dwm" and create a file called autostart.sh containing 
```
#!/bin/sh
# Statusbar
/path/to/dwm_bar.sh
```

#### Text Editors
- Emacs: put .emacs and .emacs-rc in $HOME
- NeoVim: put the nvim folder in .conf
