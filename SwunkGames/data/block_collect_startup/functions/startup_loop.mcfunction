#This runs the countdown until the Block_Game starts and it runs the start one the time left reaches 0.
schedule function block_collect_startup:startup_loop 60s

#Participating:
scoreboard players enable @a participating
scoreboard players enable @a notparticipating
execute as @a if score @s participating matches 1.. run tag @s remove notparticipant
execute as @a if score @s notparticipating matches 1.. unless score @s participating matches 1.. run tag @s add notparticipant
execute as @a if score @s participating matches 1.. run tellraw @s {"text":"(Block_Collect): You are now a participant.","color": "green"}
execute as @a if score @s notparticipating matches 1.. unless score @s participating matches 1.. run tellraw @s {"text":"(Block_Collect): You are no longer a participant.","color": "green"}
scoreboard players set @a participating 0
scoreboard players set @a notparticipating 0


#TimeLeft/Warnings:
scoreboard players remove Time_Left time_left 1

execute if score Time_Left time_left matches 1..3 run tellraw @a {"text":" "}
execute if score Time_Left time_left matches 1..3 run tellraw @a {"text":"(Block_Collect): Will you be participating in the Block Collect Event? Please Click One! If you can't click, run either /trigger participating or /trigger notparticipating","color":"dark_green"}
execute if score Time_Left time_left matches 1..3 run tellraw @a {"text":"Yes, I am Participating","color":"green","underlined": true,"clickEvent": {"action":"run_command","value":"/trigger participating"}}
execute if score Time_Left time_left matches 1..3 run tellraw @a {"text":"No, I am NOT Participating","color":"green","underlined": true,"clickEvent": {"action":"run_command","value":"/trigger notparticipating"}}
execute if score Time_Left time_left matches 1..3 run tellraw @a {"text":" "}

execute if score Time_Left time_left matches 2 unless entity @e[type=area_effect_cloud,tag=Block_Collect_Center] run tellraw @a[tag=GameMaster] [{"text":"It appears you haven't set the game_center yet, you better get on that one chief.","color": "dark_purple"},{"text": " Click Here to Set the Center","color":"green","underlined":true,"clickEvent": {"action":"run_command","value":"/execute at @s as @s run function block_collect_startup:select_center"}}]

#Bossbar:
execute store result bossbar block_collect:time_left value run scoreboard players get Time_Left time_left
execute unless score Time_Left time_left matches 0 run bossbar set block_collect:time_left name [{"text":"Block Collect - Starting in ","color":"dark_green","bold":true},{"score":{"name":"Time_Left","objective":"time_left"},"color":"dark_green"},{"text":" minutes","color":"dark_green","bold":true}]
execute if score Time_Left time_left matches 0 run bossbar set block_collect:time_left name {"text":"Block Collect - Starting Soon","color":"dark_green"}

#Reaches Zero
execute if score Time_Left time_left matches 0 run schedule clear block_collect_startup:startup_loop
execute if score Time_Left time_left matches 0 run function block_collect_startup:initiate_start