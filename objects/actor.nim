## This module contains all Actors

import math
import terminal
import ../misc / [exptable, misc]
import item
import room

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

proc move*(self: Player) =
  discard nil
