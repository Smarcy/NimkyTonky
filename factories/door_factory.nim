## This module creates all the Doors in the game

import ../objects/door
import room_factory

var doors* {.global.}: seq[Door]

room_factory.createRooms()

let livingToHall = Door(name: "LivingToHall", sourceRoom: room_factory.rooms[0],
    targetRoom: room_factory.rooms[1])

let livingToStorage = Door(name: "LivingToStorage",
    sourceRoom: room_factory.rooms[0], targetRoom: room_factory.rooms[2])

proc createDoors*() =
  doors.add(livingToHall)
  doors.add(livingToStorage)
