## This module contains the Item Interface

type
  Item = ref object of RootObj
    name*: string
    value*: int

  Weapon* = ref object of Item
    damage*: int

  Armor* = ref object of Item
    armor*: int


