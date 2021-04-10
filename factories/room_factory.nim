## This module creates all the Rooms in the game
## Written in Singleton Design Pattern accessible by getInstance()

import ../objects/room

type room_factory = object
  rooms*: seq[Room]

var instance = room_factory()

proc getInstance*(): room_factory =
  return instance

proc createRooms*() =

  # Create the Rooms (TODO: outsource to a file or something)
  let livingRoom = Room(name: "Living Room", hasMonster: false,
    hasMerchant: false)
  let hall = Room(name: "Hall", hasMonster: false, hasMerchant: false)
  let storage = Room(name: "Storage", hasMonster: true, hasMerchant: false)

  instance.rooms.add(livingRoom)
  instance.rooms.add(hall)
  instance.rooms.add(storage)

# May return nil(?) if nothing was found
proc findRoomByName*(name: string): Room =
  for r in instance.rooms:
    if r.name == name:
      result = r
