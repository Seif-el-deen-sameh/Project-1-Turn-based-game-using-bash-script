# Define beast random data generation parameters

ghoul_power_min=10
ghoul_power_max=15

ghoul_toughness_min=8
ghoul_toughness_max=10

spider_power_min=5
spider_power_max=7

spider_toughness_min=5
spider_toughness_max=6

zombie_power_min=9
zombie_power_max=17

zombie_toughness_min=2
zombie_toughness_max=8

dragon_power_min=15
dragon_power_max=20

dragon_toughness_min=20
dragon_toughness_max=45


# Define beast data's inital value
beast_power=0
beast_toughness=0

beast_hitpoints=0
beast_attackpower=0

beast_selector=0
beast_name=""

beast_modifier=2

# Define player's data's inital value
player_hitpoints=100
player_attackpower=10
player_action=""
sheild_enable=1


# Generate random beast and calculate the beast's parameters
beast_selector=$(shuf -i 1-4 -n 1)
#echo "beast_selector: $beast_selector" #For testing purposes

case $beast_selector in
1)
beast_name="ghoul"
#echo "beast_name: $beast_name" #For testing purposes
beast_power=$(shuf -i $ghoul_power_min-$ghoul_power_max -n 1)
#echo "beast_power: $beast_power" #For testing purposes
beast_toughness=$(shuf -i $ghoul_toughness_min-$ghoul_toughness_max -n 1)
#echo "beast_toughness: $beast_toughness" #For testing purposes
beast_hitpoints=$(( $beast_power * $beast_modifier + $beast_toughness))
#echo "beast_hitpoints: $beast_hitpoints" #For testing purposes
beast_attackpower=$(( $beast_power + $beast_toughness + 10))
#echo "beast_attackpower: $beast_attackpower" #For testing purposes
;;

2)
beast_name="spider"
#echo "beast_name: $beast_name" #For testing purposes
beast_power=$(shuf -i $spider_power_min-$spider_power_max -n 1)
#echo "beast_power: $beast_power" #For testing purposes
beast_toughness=$(shuf -i $spider_toughness_min-$spider_toughness_max -n 1)
#echo "beast_toughness: $beast_toughness" #For testing purposes
beast_hitpoints=$(( $beast_power * $beast_modifier + $beast_toughness))
#echo "beast_hitpoints: $beast_hitpoints" #For testing purposes
beast_attackpower=$(( $beast_power + $beast_toughness + 10))
#echo "beast_attackpower: $beast_attackpower" #For testing purposes
;;
3)
beast_name="zombie"
#echo "beast_name: $beast_name" #For testing purposes
beast_power=$(shuf -i $zombie_power_min-$zombie_power_max -n 1)
#echo "beast_power: $beast_power" #For testing purposes
beast_toughness=$(shuf -i $zombie_toughness_min-$zombie_toughness_max -n 1)
#echo "beast_toughness: $beast_toughness" #For testing purposes
beast_hitpoints=$(( $beast_power * $beast_modifier + $beast_toughness))
#echo "beast_hitpoints: $beast_hitpoints" #For testing purposes
beast_attackpower=$(( $beast_power + $beast_toughness + 10))
#echo "beast_attackpower: $beast_attackpower" #For testing purposes
;;  
4)
beast_name="dragon"
#echo "beast_name: $beast_name" #For testing purposes
beast_power=$(shuf -i $dragon_power_min-$dragon_power_max -n 1)
#echo "beast_power: $beast_power" #For testing purposes
beast_toughness=$(shuf -i $dragon_toughness_min-$dragon_toughness_max -n 1)
#echo "beast_toughness: $beast_toughness" #For testing purposes
beast_hitpoints=$(( $beast_power * $beast_modifier + $beast_toughness))
#echo "beast_hitpoints: $beast_hitpoints" #For testing purposes
beast_attackpower=$(( $beast_power + $beast_toughness + 10))
#echo "beast_attackpower: $beast_attackpower" #For testing purposes
;; 
*)     
echo "invalid option" #For testing purposes
esac

# The start of the game
echo "Hello adventurer today's challange will be: $beast_name"
echo "Adventurer, your base attack power is: $player_attackpower"
echo "Adventurer, your base hitpoints are: $player_hitpoints"
echo "however, you don't know anything about the monster"

while (( $beast_hitpoints > 0));
do
echo "====================================================="
echo "Adventurer to attack type a"
echo "Adventurer to block type b"
echo "Adventurer to enhance your attack type e"
echo "Adventurer to counter the monster's attack type c"
echo "Adventurer to recover some of your hitpoints type r"
read -p "Adventurer, what will you do : " player_action
#echo "Adventurer you chose :$player_action" #For testing purposes
echo "====================================================="
case $player_action in
a)
echo "You choose to attack,good hunt it down"
beast_hitpoints=$(($beast_hitpoints - $player_attackpower))
player_hitpoints=$(($player_hitpoints - ($beast_attackpower * sheild_enable) ))
if ((sheild_enable<=0));then
sheild_enable=$(($sheild_enable + 1))
#echo "sheild_enable: $sheild_enable" #For testing purposes
fi;;

b)
echo "You choose to block,I hope you survive"
player_hitpoints=$(($player_hitpoints - ($beast_attackpower * sheild_enable) / 2))
echo "Since you chose to block,you are immune to the next hit unless you chose to block again which will disable your sheild"
if ((sheild_enable<=0));then
sheild_enable=$(($sheild_enable + 1))
echo "Since you chose to block again,your sheild is disabled"
#echo "sheild_enable: $sheild_enable" #For testing purposes
else
sheild_enable=$(($sheild_enable - 1))
#echo "sheild_enable: $sheild_enable" #For testing purposes
fi;;

e)
echo "You choose to enhance your attack,the monster is attacking"
player_hitpoints=$(($player_hitpoints - ($beast_attackpower * sheild_enable) ))
player_attackpower=$(($player_attackpower + 10 ))
echo "Adventurer, Your current attack power is: $player_attackpower"
if ((sheild_enable<=0));then
sheild_enable=$(($sheild_enable + 1))
#echo "sheild_enable: $sheild_enable" #For testing purposes
fi;;

c)
echo "You choose to counter the monster's attack,the damage dealt to the monster is doubled and damage dealt to you is doubled"
player_hitpoints=$(($player_hitpoints - ($beast_attackpower * sheild_enable)* 2))
beast_hitpoints=$(($beast_hitpoints - ($player_attackpower * 2) ))
if ((sheild_enable<=0));then
sheild_enable=$(($sheild_enable + 1))
#echo "sheild_enable: $sheild_enable" #For testing purposes
fi;;

r)
echo "You choose to recover some of your lost hitpoints, you will recover 30 hp but not more than your maximum hitpoints "
player_hitpoints=$(($player_hitpoints - ($beast_attackpower * sheild_enable) / 2))

player_hitpoints=$(($player_hitpoints + 30))
if ((player_hitpoints > 100));then
player_hitpoints=100
fi

if ((sheild_enable<=0));then
sheild_enable=$(($sheild_enable + 1))
#echo "sheild_enable: $sheild_enable" #For testing purposes
fi;;

*)
echo "invalid option"
player_hitpoints=$(($player_hitpoints - ($beast_attackpower * sheild_enable) ))
if ((sheild_enable<=0));then
sheild_enable=$(($sheild_enable + 1))
#echo "sheild_enable: $sheild_enable" #For testing purposes
fi;;
esac
echo "====================================================="
if ((player_hitpoints<=0)) && ((beast_hitpoints<=0));then
	echo "Adventurer,you and the monster are both defeated"
	break
elif ((player_hitpoints<=0));then

	echo "Adventurer,you have been defeated by the monster"
	break
elif ((beast_hitpoints<=0));then
	echo "Adventurer,your current hit points: $player_hitpoints"
	echo "Adventurer,you have beaten the monster"
	break

else
	echo "Adventurer,the monster current hit points: $beast_hitpoints"
	echo "Adventurer,your current hit points: $player_hitpoints"
	echo "Adventurer,the monster is still standing"
fi

done


