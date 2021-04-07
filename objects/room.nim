## This module is a single Room

type
  Room* = ref object of RootObj
    name*: string
    hasMonster*: bool
    hasMerchant*: bool
    # monster: Monster
