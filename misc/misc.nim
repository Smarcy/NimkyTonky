## This module contains several miscellaneous functions and constants

import osproc

## Clear Terminal Screen
proc clearScreen*() =
  discard osproc.execCmd "clear"

## Reset Terminal to origin color
proc resetColor*() =
  echo "\e[0m"
