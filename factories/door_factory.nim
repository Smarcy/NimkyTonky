## This module creates all the Doors in the game
## Written in Singleton Design Pattern accessible by getInstance()

import ../model/door
import room_factory as roomFac

type door_factory = object
  doors*: seq[Door]

var instance = door_factory()

proc getInstance*(): door_factory =
  return instance

proc createDoors*() =

  # Create Doors (TODO: outsource to a file or something)
  let livingToHall = Door(name: "LivingToHall",
    sourceRoom: roomFac.getInstance().rooms[0],
    targetRoom: roomFac.getInstance().rooms[1], locked: false)
  let livingToStorage = Door(name: "LivingToStorage",
    sourceRoom: roomFac.getInstance().rooms[0],
      targetRoom: roomFac.getInstance().rooms[2], locked: true)
  let hallToLiving = Door(name: "hallToLiving",
    sourceRoom: roomFac.getInstance().rooms[1],
      targetRoom: roomFac.getInstance().rooms[0], locked: false)

  instance.doors.add(livingToHall)
  instance.doors.add(livingToStorage)
  instance.doors.add(hallToLiving)
