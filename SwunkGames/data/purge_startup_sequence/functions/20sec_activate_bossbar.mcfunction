bossbar set the_purge:time_left name [{"text":"The Purge - Starting Soon","color":"dark_purple","bold":true}]
bossbar set the_purge:time_left color white
bossbar set the_purge:time_left max 60
bossbar set the_purge:time_left value 60
bossbar set the_purge:time_left style notched_6
bossbar set the_purge:time_left visible true
bossbar set the_purge:time_left players @a
tellraw @a {"text": "The Purge will be starting in 20 seconds.","color":"dark_purple"}
execute in overworld run playsound entity.wither.break_block master @a ~ ~ ~ 10000
