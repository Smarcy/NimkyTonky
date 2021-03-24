type
  Actor = ref object of RootObj
    name*: string
    healthpoints*: int

  Player = ref object of Actor
    npc: bool

method printInfo(this: Player) =
  echo "Name: "
