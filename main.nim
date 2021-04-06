## This is the main module

import misc/misc
import objects/Actor
from factories/weaponFactory as wepFac import createWeapons
from factories/armorFactory as armorFac import createArmors
from strutils import parseInt
import terminal

var run = true

# Intro Menu Loop
while run:
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
      run = false
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
  experience: 30,
  weapon: wepFac.findWeaponByName("Shortsword"),
  armor: armorFac.findArmorByName("Iron Armor"))

player.printInfo()
