## This Module contains all Actors

import math
import ../misc/exptable

type
  Actor = ref object of RootObj
    name*: string
    healthpoints*: int
    manapoints*: int
    armor*: int
    damage*: int
    level*: int
    experience*: int

  Player* = ref object of Actor

  Enemy* = ref object of Actor
    
proc calcExpPercentage(this: Player): float =
  return float(this.experience / exptable.table[0]) * 100

method printInfo*(this: Player) {.base.} =
  echo "Name:   ", this.name
  echo "HP:     ", this.healthpoints
  echo "MP:     ", this.manapoints
  echo "Level:  ", this.level, " (", round(calcExpPercentage(this), 2), "%)"
  echo "XP:     ", this.experience
  echo "Damage: ", this.damage
  echo "Armor:  ", this.armor
