## This module creates all the Armors in the game

import ../objects/Item

var armors: seq[Armor]

let ironArmor = Item.Armor(name: "Iron Armor", value: 10, armor: 2)

proc createArmors*() =
  armors.add(ironArmor)

proc findArmorByName*(name: string): Armor =
  for armor in armors:
    if armor.name == name:
      result = armor
