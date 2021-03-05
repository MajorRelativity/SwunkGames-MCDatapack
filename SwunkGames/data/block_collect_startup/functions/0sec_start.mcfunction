#Schedule:
function block_collect:loop_60
schedule function block_collect:death_loop_29 5s

#Playsound:
playsound entity.wither.spawn master @a ~ ~ ~ 10000
execute in overworld run playsound music_disc.blocks record @a[tag=!notparticipant] ~ ~ ~ 

#Spreadplayers:
execute at @e[type=area_effect_cloud,tag=Block_Collect_Center] run spreadplayers ~ ~ 50 1000 false @a[tag=!notparticipant]

#Tellraw: 
tellraw @a {"text":"(Block_Collect): Let the collection, BEGIN!","color": "dark_green","bold": true}

