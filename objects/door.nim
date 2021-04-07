## This module contains a single Door connecting two Rooms

import room

type
  Door* = ref object of RootObj
    name*: string
    sourceRoom*: room.Room
    targetRoom*: room.Room
    locked: bool

proc isLocked(self: Door): bool =
  self.locked
