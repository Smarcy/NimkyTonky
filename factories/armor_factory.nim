## This module creates all the Armors in the game
## Written in Singleton Design Pattern accessible by getInstance()

import ../model/item

type armor_factory = object
  armors*: seq[Armor]

var instance* = armor_factory()

proc createArmors*() =

  let ironArmor = item.Armor(name: "Iron Armor", value: 10, armor: 2,
    armorType: ArmorType.iron)

  instance.armors.add(ironArmor)

## May return nil if no match was found
proc findArmorByName*(name: string): Armor =
  for armor in instance.armors:
    if armor.name == name:
      result = armor
