## This Module contains all Actors

type
  Actor = ref object of RootObj
    name*: string
    healthpoints*: int
    manapoints*: int
    armor*: int
    damage*: int

  Player* = ref object of Actor
    npc*: bool

  Player = ref object of Actor
    npc: bool

method printInfo*(this: Player) {.base.} =
  echo "Name: "
