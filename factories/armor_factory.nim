## This module creates all the Armors in the game

import ../objects/item

var armors: seq[Armor]

let ironArmor = item.Armor(name: "Iron Armor", value: 10, armor: 2,
    armorType: ArmorType.iron)

proc createArmors*() =
  armors.add(ironArmor)

proc findArmorByName*(name: string): Armor =
  for armor in armors:
    if armor.name == name:
      result = armor
