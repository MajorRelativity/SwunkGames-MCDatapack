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

kill @e[type=area_effect_cloud,tag=Block_Collect_Center]
tag @a remove GameMaster
tag @a remove notparticipant

#Create Scoreboards:
scoreboard objectives setdisplay sidebar
scoreboard objectives add trackm_block_1 mined:stone
scoreboard objectives add trackm_block_2 mined:andesite
scoreboard objectives add trackm_block_3 mined:granite
scoreboard objectives add trackm_block_4 mined:barrier
scoreboard objectives add trackm_block_5 mined:barrier
scoreboard objectives add trackp_block_1 used:stone
scoreboard objectives add trackp_block_2 used:andesite
scoreboard objectives add trackp_block_3 used:granite
scoreboard objectives add trackp_block_4 used:barrier
scoreboard objectives add trackp_block_5 used:barrier
scoreboard objectives add total_blocks dummy {"text":"Block Score: ","color":"green","bold":true}
scoreboard objectives add time_left dummy {"text":"Time Left","color":"dark_purple","bold":true,"underlined":true}

scoreboard objectives add d1_total_blocks dummy
scoreboard objectives add d2_total_blocks dummy
scoreboard objectives add situation_cool dummy

scoreboard objectives add deaths_block deathCount

scoreboard objectives add participating trigger
scoreboard objectives add notparticipating trigger
scoreboard objectives add removeplayer dummy

#Scoreboard Values:
scoreboard players reset @a trackm_block_1
scoreboard players reset @a trackm_block_2
scoreboard players reset @a trackm_block_3
scoreboard players reset @a trackm_block_4
scoreboard players reset @a trackm_block_5
scoreboard players reset @a trackp_block_1
scoreboard players reset @a trackp_block_2
scoreboard players reset @a trackp_block_3
scoreboard players reset @a trackp_block_4
scoreboard players reset @a trackp_block_5
scoreboard players reset @a total_blocks
scoreboard players reset @a deaths_block
scoreboard players reset @a removeplayer

scoreboard players set Time_Left time_left 40
scoreboard players set High_Score d1_total_blocks -1
scoreboard players set Low_Score d2_total_blocks -1
scoreboard players set Global_Cool situation_cool 0
scoreboard players set Spread_Cool situation_cool 0
scoreboard players set Frenzy_Cool situation_cool 0
scoreboard players set Hunt_Cool situation_cool 0

scoreboard players set @a participating 0
scoreboard players set @a notparticipating 0

#Bossbar:
bossbar add block_collect:time_left {"text":"SwunkGames - Block Collect","color":"dark_green","bold":true}
bossbar set block_collect:time_left style notched_10
bossbar set block_collect:time_left visible false
bossbar set block_collect:time_left color white
bossbar set block_collect:time_left max 40
bossbar set block_collect:time_left value 40

#Load:
tellraw @a {"text": "Block Collect has loaded.","color": "dark_green","bold": true}
execute in overworld run playsound entity.horse.saddle master @a ~ ~ ~ 10000
