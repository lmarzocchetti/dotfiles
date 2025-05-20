# dotfiles

![2025-05-20-172721_3840x1080_scrot](https://github.com/user-attachments/assets/7ac67375-63d8-4aa6-9ad7-03b3d76b5a54)

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

#### Picom Settings
You want to setup some picom settings i use (for other things check picom.conf (to insert in .config/)):
- frame-opacity = 0.9
- corner-radius = 10
