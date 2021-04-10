## This module contains all Actors

import math
import terminal
import ../misc / [exptable, misc]
import item
import room
import door
import ../factories/door_factory
from strformat import fmt
from strutils import parseInt

type
  Actor = ref object of RootObj
    name*: string
    healthpoints*: int
    manapoints*: int
    armor*: item.Armor
    weapon*: item.Weapon
    currentRoom*: room.Room
    level*: int
    experience*: int

  Player* = ref object of Actor

  Enemy* = ref object of Actor

proc calcExpPercentage(self: Player): float =
  result = float(self.experience / exptable.table[0]) * 100

proc printInfo*(self: Player) =
  setForegroundColor(stdout, fgBlue)
  echo "Name:     ", self.name
  echo "HP:       ", self.healthpoints
  echo "MP:       ", self.manapoints
  echo "Level:    ", self.level, " (", round(calcExpPercentage(self), 2), "%)"
  echo "XP:       ", self.experience
  echo "Location: ", self.currentRoom.name
  echo "Weapon:   ", self.weapon.name
  echo "Armor:    ", self.armor.name
  resetColor()

## List all available Doors in player.currentRoom
# TODO: Refactor this so it always starts with 1 and not the position
# in the doors seq
proc move*(self: Player) =
  clearScreen()

  let allDoors = door_factory.getInstance().doors

  # i is a counter, d is a Door (<counter, item>,<iterator> in range)-syntax
  for i, d in allDoors:
    # Found a Door!
    if d.sourceRoom.name == self.currentRoom.name:
      # Add a "(locked)" suffix if a Door is locked
      if d.isLocked:
        echo fmt"[{i+1}] {d.targetRoom.name} (locked)"
      else:
        echo fmt"[{i+1}] {d.targetRoom.name}"

  try:
    let option = parseInt(readLine(stdin)) # Contains the users choice as string
    self.currentRoom = allDoors[option - 1].targetRoom
  except ValueError:
    echo "Please make a valid choice!"
    discard readLine(stdin)

  # TODO: check Room for Monster and Merchant
