###Project Zombie
In this challenge we will get to play with some zombies. Zombies carry the zombie plague which turns ordinary humans into more zombies.

Zombies thrive in enclosed spaces where escape is difficult if not impossible. Create a grid to simulate an enclosed space, 15 x 15 seems like a good size but if you want to make it larger or smaller, that is fine too.

Humans and zombies will move around in this space, moving one space in any direction for each turn. But, make sure that they do not escape the edges of the room.

Have your program start with a single zombie and ten humans. Humans and zombies will take turns moving until all of the humans have become zombies.

Here is what the room might look like on turn 1.

##############
#  H    H  Z #
#   H        #
#            #
#            #
# H      H H #
# H H        #
# H H        #
##############
Notice that there is a single zombie and many humans. Zombie plague is highly contagious, if a zombie and a human come into contact the human will become a zombie. Soon the room will be overrun with zombies.

##############
#      ZZ    #
#  H         #
#       Z    #
#          Z #
#  ZZ    H   #
# H          #
# H     H    #
##############
Have your program start with a single zombie and ten humans. Humans and zombies will take turns moving until all of the humans have become zombies.

##Stretch Goals
Here are some additional features you can add to make your zombie attack more challenging:

Humans may be able to escape a zombie attack. If a zombie comes close to a human, the human can attempt to move away from it.
Zombies are suspected to be able to smell the brains of their victims. If a zombie is close enough to a human to smell it’s brain, it could pursue them.

##To Do
Design the board -- one time thing during beginning
  Randomize the humans and zombie
Create Players
  is the user a zombie or human?
  if zombie then everyone else a human
  if a human then everyone but one a zombie

Gameplay
  print board
  access user's class
    print menu where to move
      up, down, left, right if available
  if last human then have count down (optional)
      if countdown = 0 then human wins
      if human = 0 and countdown >=0 then zombie wins
      playagain