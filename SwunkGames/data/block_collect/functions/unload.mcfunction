#Schedule Clear:
schedule clear block_collect_startup:startup_loop
schedule clear block_collect_startup:rules_message
schedule clear block_collect_startup:0sec_start
schedule clear block_collect_startup:1sec_start
schedule clear block_collect_startup:2sec_start
schedule clear block_collect_startup:3sec_start
schedule clear block_collect_startup:initiate_start
schedule clear block_collect:loop_60
schedule clear block_collect:spreadplayers_situation
schedule clear block_collect:spreadplayers
schedule clear block_collect:frenzy
schedule clear block_collect:frenzy_situation
schedule clear block_collect:hunt_situation
schedule clear block_collect:hunt
schedule clear block_collect:death_loop_29

#Reset Tags:
tag @a remove notparticipant
tag @a remove GameMaster
kill @e[type=area_effect_cloud,tag=Block_Collect_Center] 
tag @a remove dead

#Bossbar Remove:
bossbar remove block_collect:time_left

#Score Reset
scoreboard objectives setdisplay sidebar
scoreboard objectives remove trackm_block_1 
scoreboard objectives remove trackm_block_2 
scoreboard objectives remove trackm_block_3 
scoreboard objectives remove trackm_block_4 
scoreboard objectives remove trackm_block_5 
scoreboard objectives remove trackp_block_1 
scoreboard objectives remove trackp_block_2 
scoreboard objectives remove trackp_block_3 
scoreboard objectives remove trackp_block_4 
scoreboard objectives remove trackp_block_5 
scoreboard objectives remove total_blocks
scoreboard objectives remove time_left
scoreboard objectives remove deaths_block

scoreboard objectives remove d1_total_blocks
scoreboard objectives remove d2_total_blocks
scoreboard objectives remove situation_cool 

scoreboard objectives remove participating
scoreboard objectives remove notparticipating

#Tellraw:
tellraw @a {"text": "Block Collect has unloaded.","color": "dark_green","bold": true}
execute in overworld run playsound entity.horse.saddle master @a ~ ~ ~ 10000