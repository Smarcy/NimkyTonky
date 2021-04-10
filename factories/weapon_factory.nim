## This module creates all the Weapons in the game
## Written in Singleton Design Pattern accessible by getInstance()

import ../objects/item

type weapon_factory = object
  weapons*: seq[Weapon]

var instance = weapon_factory()

proc getInstance*(): weapon_factory =
  return instance # we can leave out the 'return' but I like it actually

proc createWeapons*() =

  let shortsword = item.Weapon(name: "Shortsword", value: 10, damage: 2,
    weaponType: WeaponType.oneHandSword)

  instance.weapons.add(shortsword)

# May return nil if no match was found
proc findWeaponByName*(name: string): Weapon =
  for wep in instance.weapons:
    if wep.name == name:
      result = wep
