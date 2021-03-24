import osproc
include objects/Actor
from strutils import parseInt

discard execCmd "clear" # clear screen (outsource later on maybe?)

var run = true

while run:
  echo """Welcome to NimkyTonky!

    [1] New Game
    [2] Quit"""

  var option: int

  try:
    option = parseInt(readLine(stdin))
    run = false
  except ValueError:
    echo "Please enter a (valid) number!"
    quit()


discard execCmd "clear"

echo "Enter a name:\n"
var name = readLine(stdin)
var player = Player(name: name, healthpoints: 100, npc: false)

player.printInfo()
