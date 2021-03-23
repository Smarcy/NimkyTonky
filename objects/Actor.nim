type Actor = ref object of RootObj
  name*: string
  healthpoints*: int

type Player = ref object of Actor
  npc: bool
