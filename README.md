Project 1: Turn-based game using bash script
By: Seif El Deen Sameh Mohamed

Project description:
- This project aims to create a turn-based game inspired by the text based game  "Colossal Cave Adventure," that was developed in 1976 by William Crowther for the PDP-10 mainframe computer.
- This project is developed using bash script for Linux-based operating systems.
- The player in this game faces a monster which tries to defeat the player by constantly attacking the player regardless of the player’s action
- In order to win, the player have to defeat the monster using various actions in a turn-based fashion where the player has to choose an action to preform followed by the monster’s attack
- Both the player and the monster have two elements:
    1.Hit points: an integer value that represent their health ,whoever gets to zero hit points is declared as the loser
    2.Attack power: an integer value that represent their power and is used to reduce each other’s hit points
- The actions that the player choose from are the following:
    1.Attack the monster: Both the player and monster attack each other  by subtracting their attack power from their hit points
    2.Block the monster: The player losses a portion of the player’s hit points by half of the monster’s attack in order to create a shield that makes the player losses no hit points on the next attack preformed by the monster 
    3.Enhance the player’s attack:The player losses hit points equals the monster’s attack power in order to gain extra attack power.
    4.Counter the monster’s attack:Both the player and monster attack each other by subtracting their double attack power from their hit points.
    5.Recover some of the lost hit points:The player losses a portion of the player’s hit points by half of the monster’s attack in order to recover some of the lost hit points.
- The monster data is generated randomly starting by selecting the monster that the player will be facing followed by calculation it’s statistics aka monster’s hit points and attack power however each monster has a range of values that determine the maximum and minimum possible hit points and attack power.
- The monsters that the player may face are a zombie , ghoul , spider and a dragon.
- The player has starting statistics of 100 hit points and 10 attack power.

Project files:
1.beast_atk_game_final.sh ( the project’s bash script)
2.Project_1_recording.gif (a screen recording of the project converted to gif)
