## This module contains several miscellaneous functions and constants

import osproc

proc clearScreen*() =
  discard osproc.execCmd "clear"
