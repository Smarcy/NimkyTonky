## This is the main module

import misc/misc
import objects/Actor
from factories/weaponFactory as wepFac import createWeapons
from factories/armorFactory as armorFac import createArmors
from strutils import parseInt
import terminal

var runIntro = true

# Intro Menu Loop
while runIntro:
  wepFac.createWeapons()
  armorFac.createArmors()
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
  armor: armorFac.findArmorByName("Iron Armor"))

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
