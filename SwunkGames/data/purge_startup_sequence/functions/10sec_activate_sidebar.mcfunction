scoreboard objectives setdisplay sidebar purge_score
scoreboard players set Time_Left time_left 60
scoreboard players set The_Number_Two the_number_2 2
scoreboard players set @a deaths_purge 1
scoreboard players set @a kills_purge 0
scoreboard players set @a 2kills_purge 0
scoreboard players set @a purge_score 0
execute in overworld run playsound entity.wither.break_block master @a ~ ~ ~ 10000
tellraw @a {"text": "The Purge will be starting in 10 seconds.","color":"dark_purple"}