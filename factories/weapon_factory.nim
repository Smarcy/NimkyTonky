## This module creates all the Weapons in the game

import ../objects/item

# global pragma could be superflous?
var weapons {.global.}: seq[Weapon]

let shortsword = item.Weapon(name: "Shortsword", value: 10, damage: 2,
    weaponType: WeaponType.oneHandSword)

proc createWeapons*() =
  weapons.add(shortsword)

# May return nil if no match was found
proc findWeaponByName*(name: string): Weapon =
  for wep in weapons:
    if wep.name == name:
      result = wep
