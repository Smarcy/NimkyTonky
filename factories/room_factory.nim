## This module creates all the Rooms in the game

import ../objects/room

# global pragma could be superflous?
var rooms* {.global.}: seq[Room]

let livingRoom = Room(name: "Living Room", hasMonster: false,
    hasMerchant: false)

let hall = Room(name: "Hall", hasMonster: false, hasMerchant: false)

let storage = Room(name: "Storage", hasMonster: true, hasMerchant: false)

proc createRooms*() =
  rooms.add(livingRoom)
  rooms.add(hall)
  rooms.add(storage)

# May return nil(?) if nothing was found
proc findRoomByName*(name: string): Room =
  for r in rooms:
    if r.name == name:
      result = r
