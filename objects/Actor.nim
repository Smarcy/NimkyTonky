## This module contains all Actors

import math
import ../misc/exptable
import ../objects/Item

type
  Actor = ref object of RootObj
    name*: string
    healthpoints*: int
    manapoints*: int
    armor*: Item.Armor
    weapon*: Item.Weapon
    level*: int
    experience*: int

  Player* = ref object of Actor

  Enemy* = ref object of Actor

proc calcExpPercentage(self: Player): float =
  result = float(self.experience / exptable.table[0]) * 100

method printInfo*(self: Player) {.base.} =
  echo "Name:   ", self.name
  echo "HP:     ", self.healthpoints
  echo "MP:     ", self.manapoints
  echo "Level:  ", self.level, " (", round(calcExpPercentage(self), 2), "%)"
  echo "XP:     ", self.experience
  echo "Weapon: ", self.weapon.name
  echo "Armor:  ", self.armor.name
