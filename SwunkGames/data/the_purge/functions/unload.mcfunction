#Removing all Scoreboards
scoreboard objectives setdisplay sidebar
scoreboard objectives remove kills_purge
scoreboard objectives remove 2kills_purge
scoreboard objectives remove deaths_purge
scoreboard objectives remove the_number_2
scoreboard objectives remove purge_score
scoreboard objectives remove time_left
scoreboard objectives remove got_lowest_buff

#Reset Buffs:
execute as @a run attribute @s generic.max_health base set 20
execute as @a run attribute @s generic.movement_speed base set .1

#Remove Bossbar:
bossbar remove the_purge:time_left

#Schedule Clear:
schedule clear the_purge:loop_60
schedule clear purge_startup_sequence:purge_statement
schedule clear purge_startup_sequence:10sec_activate_sidebar
schedule clear purge_startup_sequence:20sec_activate_bossbar
schedule clear purge_startup_sequence:3sec_start
schedule clear purge_startup_sequence:2sec_start
schedule clear purge_startup_sequence:1sec_start
schedule clear purge_startup_sequence:0sec_start

#UnLoad:
tellraw @a {"text": "The Purge has been unloaded.","color": "dark_purple","bold": true}
execute in overworld run playsound entity.wither.death master @a ~ ~ ~ 10000