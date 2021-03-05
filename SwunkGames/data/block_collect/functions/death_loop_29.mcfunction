#Scheduling:
schedule function block_collect:death_loop_29 29s
execute if score Time_Left time_left matches ..0 run schedule clear block_collect:death_loop_29

#Spreadplayers:
execute at @e[type=area_effect_cloud,tag=Block_Collect_Center] as @a[tag=dead] run spreadplayers ~ ~ 25 2000 false @s
execute as @a[tag=dead] at @s run playsound entity.enderman.teleport master @s ~ ~ ~ 10

#Tag:
tag @a remove dead
execute as @a[scores={deaths_block=1..},tag=!notparticipant] run tag @s add dead

#Scoreboards and Scheduling:
tellraw @a[tag=dead] {"text": "You will be teleported back in 30 seconds","color":"dark_green"}
scoreboard players set @a deaths_block 0