## This module contains all Actors

import math
import terminal
import ../misc / [exptable, misc]
import item
import room
import door
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

## List all available Doors from player.currentRoom
# TODO: make _doors_ global/static or something so it does not need to be an argument
proc move*(self: Player, allDoors: seq[Door]) =
  clearScreen()

  var i = 1 # To count and output correct numeric option values. Start with 1 for User Experience
  for d in allDoors:
    if d.sourceRoom.name == self.currentRoom.name:
      echo fmt"[{i}] {d.targetRoom.name}"
      i += 1

  let option = parseInt(readLine(stdin)) # Contains the users choice as string
  try:
    self.currentRoom = allDoors[option - 1].targetRoom
  except ValueError:
    echo "Please make a valid choice!"
    discard readLine(stdin)
