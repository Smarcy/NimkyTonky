## This module creates all the Weapons in the game
import ../objects/Item

var weapons {.global.}: seq[Weapon]

let shortsword = Item.Weapon(name: "Shortsword", value: 10, damage: 2)

proc createWeapons*() =
  weapons.add(shortsword)

# May return nil if no match was found
proc findWeaponByName*(name: string): Weapon =
  for wep in weapons:
    if wep.name == name:
      result = wep
