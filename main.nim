## This is the main module

import misc/misc
import objects/actor
from factories/weapon_factory as wepFac import createWeapons
from factories/armor_factory as armorFac import createArmors
from factories/room_factory as roomFac import createRooms
from strutils import parseInt

var runIntro = true

# Intro Menu Loop
while runIntro:
  wepFac.createWeapons()
  armorFac.createArmors()
  roomFac.createRooms()
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
  weapon: wepFac.findWeaponByName("Shortsword"),
  armor: armorFac.findArmorByName("Iron Armor"),
  currentRoom: roomFac.findRoomByName("Living Room"))

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
  except ValueError:
    echo "Please enter a (valid) number!"
    discard readLine(stdin)

  case option:
    of 1: player.move()
    of 2:
      clearScreen()
      player.printInfo()
      discard readLine(stdin)
    of 3: quit()
    else: continue
