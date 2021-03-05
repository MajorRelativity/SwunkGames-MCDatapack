schedule function the_purge:loop_60 60s

#Score Calculations
execute as @a run scoreboard players operation @s 2kills_purge = @s kills_purge
execute as @a store result score @s 2kills_purge run scoreboard players operation @s 2kills_purge *= The_Number_Two the_number_2
execute as @a store result score @s purge_score run scoreboard players operation @s 2kills_purge /= @s deaths_purge
scoreboard players remove Time_Left time_left 1

#BossBar Progression
execute store result bossbar the_purge:time_left value run scoreboard players get Time_Left time_left
execute if score Time_Left time_left matches 1..60 run bossbar set the_purge:time_left name [{"text":"The Purge - ","color":"dark_purple","bold":true},{"score":{"name":"Time_Left","objective":"time_left"},"color":"dark_purple","bold":true},{"text":" minutes left!","color":"dark_purple","bold":true}]
execute if score Time_Left time_left matches 20..60 run bossbar set the_purge:time_left color green
execute if score Time_Left time_left matches 10..19 run bossbar set the_purge:time_left color yellow
execute if score Time_Left time_left matches 2..9 run bossbar set the_purge:time_left color red
execute if score Time_Left time_left matches 1 run bossbar set the_purge:time_left color pink

#WorldBoarder:
execute if score Time_Left time_left matches 19 run worldborder set 1000 600
execute if score Time_Left time_left matches 19 run tellraw @a {"text":"*The Worldboarder Begins to Shrink Faster*","color":"dark_purple"}

#Lower Player Buffs:
execute as @a run attribute @s generic.movement_speed base set .1
execute as @a run attribute @s generic.max_health base set 20
execute as @r[scores={purge_score=0}] run function the_purge:lowest_player_buff

#End Of Purge
execute if score Time_Left time_left matches 0 run bossbar set the_purge:time_left name [{"text":"The Purge Is Over!","color":"red","bold":true}]
execute if score Time_Left time_left matches 0 run schedule clear the_purge:loop_60
execute if score Time_Left time_left matches 0 run function the_purge:purge_end