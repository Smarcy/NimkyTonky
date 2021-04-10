## This is the main module

import misc/misc
import objects/actor
from factories/weapon_factory as wepFac import createWeapons
from factories/armor_factory as armorFac import createArmors
from factories/room_factory as roomFac import createRooms
from factories/door_factory as doorFac import createDoors
from strutils import parseInt

# Init World ||| Use include maybe?
wepFac.createWeapons()
armorFac.createArmors()
roomFac.createRooms()
doorFac.createDoors()

# Set Starting Gear
let startingRoom = roomFac.findRoomByName("Living Room")
let startingWeapon = wepFac.findWeaponByName("Shortsword")
let startingArmor = armorFac.findArmorByName("Iron Armor")

var runIntro = true

# Intro Menu Loop
while runIntro:
  clearScreen()

  echo """Welcome to NimkyTonky!

    [1] New Game
    [2] Quit"""

  var option: int
  try:
    option = parseInt(readLine(stdin))
  except ValueError:
    echo "Please enter a (valid) number!"
    discard readLine(stdin)

  case option:
    of 1:
      runIntro = false
      break
    of 2:
      quit()
    else:
      continue

clearScreen()

# Player creation
echo "Enter a name:\n"
let player = Player(
  name: readLine(stdin),
  healthpoints: 100,
  manapoints: 15,
  level: 1,
  experience: 0,
  weapon: startingWeapon,
  armor: startingArmor,
  currentRoom: startingRoom)

# Game Loop
var runGame = true
while runGame:
  clearScreen()

  echo """
  What to do?

  [1] Move
  [2] Player Status
  [3] Quit
  """

  var option: int
  try:
    option = parseInt(readLine(stdin))
    case option:
      of 1: player.move(doorFac.getInstance().doors)
      of 2:
        clearScreen()
        player.printInfo()
        discard readLine(stdin)
      of 3: quit()
      else: continue
  except ValueError:
    echo "Please enter a (valid) number!"
    discard readLine(stdin)

