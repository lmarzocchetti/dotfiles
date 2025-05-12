#!/bin/bash

# Comando per bloccare lo schermo (modifica se usi qualcosa di diverso)
LOCK_CMD="slock"

# Mostra il menu
choice=$(echo -e "Shutdown\nReboot\nLock" | dmenu -i -p "Power menu:")

case "$choice" in
  "Shutdown")
    #systemctl poweroff
    shutdown now
    ;;
  "Reboot")
    #systemctl reboot
    shutdown -r now
    ;;
  "Lock")
    $LOCK_CMD
    ;;
  *)
    # Niente o scelta annullata
    ;;
esac
