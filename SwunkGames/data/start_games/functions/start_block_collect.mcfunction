#Notify GameMaster:
kill @e[type=area_effect_cloud,tag=Block_Collect_Center]
tag @s add GameMaster
tellraw @s [{"text":"(Block_Collect): The Block Collect startup sequence will be starting in 30 seconds. Make sure to give everyone who is not participating the 'notparticipant' tag. ","color": "dark_green","bold": true},{"text":"The currently participating players are: ","color": "blue","bold": true},{"selector":"@a[tag=!notparticipating]","color": "blue","bold": true},{"text":".","color": "blue","bold": true}]
tellraw @s [{"text": "Click Here to set the center of the game (will be used to spreadplayers around).","color":"green","underlined":true,"clickEvent": {"action":"run_command","value":"/execute at @s as @s run function block_collect_startup:select_center"}}]

#Schedule:
schedule function block_collect_startup:rules_message 5s
schedule function block_collect_startup:startup_loop 10s