#Reschedule Function:
schedule function block_collect:loop_60 60s
scoreboard players remove Time_Left time_left 1

#Block_Collect_Center:
kill @e[tag=Block_Collect_Center]
execute as @r[tag=!notparticipant] at @s run summon area_effect_cloud ~ ~ ~ {Duration:19999980,Tags:["Block_Collect_Center"]}

#General Bossbar:
bossbar set block_collect:time_left name [{"text":"Block Collect - ","color":"dark_green","bold":true},{"score":{"name":"Time_Left","objective":"time_left"},"color":"dark_green","bold":true},{"text":" minutes left!","color":"dark_green","bold":true}]
execute store result bossbar block_collect:time_left value run scoreboard players get Time_Left time_left
execute if score Time_Left time_left matches 25..40 run bossbar set block_collect:time_left color green
execute if score Time_Left time_left matches 5..24 run bossbar set block_collect:time_left color yellow
execute if score Time_Left time_left matches 0..4 run bossbar set block_collect:time_left color red
bossbar set block_collect:time_left style notched_10

#RemovePlayer:
execute as @a[scores={removeplayer=1}] run function block_collect:remove_player

#Basic Score Calculations:
execute as @a[tag=!notparticipant] run scoreboard players operation @s total_blocks = @s trackm_block_1
execute as @a[tag=!notparticipant] run scoreboard players operation @s total_blocks += @s trackm_block_2
execute as @a[tag=!notparticipant] run scoreboard players operation @s total_blocks += @s trackm_block_3
execute as @a[tag=!notparticipant] run scoreboard players operation @s total_blocks += @s trackm_block_4
execute as @a[tag=!notparticipant] run scoreboard players operation @s total_blocks += @s trackm_block_5
execute as @a[tag=!notparticipant] run scoreboard players operation @s total_blocks -= @s trackp_block_1
execute as @a[tag=!notparticipant] run scoreboard players operation @s total_blocks -= @s trackp_block_2
execute as @a[tag=!notparticipant] run scoreboard players operation @s total_blocks -= @s trackp_block_3
execute as @a[tag=!notparticipant] run scoreboard players operation @s total_blocks -= @s trackp_block_4
execute as @a[tag=!notparticipant] run scoreboard players operation @s total_blocks -= @s trackp_block_5

#High/Low Score Calculations. The Players with the Highest or Lowest score will end with a d1 / d2_total_blocks of 0.
scoreboard players reset High_Score d1_total_blocks
scoreboard players reset Low_Score d2_total_blocks

execute as @a[tag=!notparticipant] run scoreboard players operation @s d1_total_blocks = @s total_blocks
execute as @a[tag=!notparticipant] run scoreboard players operation High_Score d1_total_blocks > @s d1_total_blocks
execute as @a[tag=!notparticipant] run scoreboard players operation @s d1_total_blocks -= High_Score d1_total_blocks

scoreboard players operation Low_Score d2_total_blocks = High_Score d1_total_blocks
execute as @a[tag=!notparticipant] run scoreboard players operation @s d2_total_blocks = @s total_blocks
execute as @a[tag=!notparticipant] run scoreboard players operation Low_Score d2_total_blocks < @s d2_total_blocks
execute as @a[tag=!notparticipant] run scoreboard players operation @s d2_total_blocks -= Low_Score d2_total_blocks

#Balance based on High/Low:
execute as @a[scores={d1_total_blocks=0},tag=!notparticipant] if predicate block_collect:random75 run execute if score Time_Left time_left matches 5..35 run function block_collect:balance_high
execute as @a[scores={d2_total_blocks=0},tag=!notparticipant] if score Time_Left time_left matches 5..35 run function block_collect:balance_low

#Spreadplayers Situation (This one MUST stay first in the situation list):
execute if score Time_Left time_left matches 18..23 unless score Spread_Cool situation_cool matches 1.. run execute if predicate block_collect:random25 run schedule function block_collect:spreadplayers_situation 1s
execute if score Time_Left time_left matches 17 unless score Spread_Cool situation_cool matches 1.. run schedule function block_collect:spreadplayers_situation 1s

#Frenzy Situation:
execute if score Time_Left time_left matches 10..30 unless score Frenzy_Cool situation_cool matches 2.. run execute if predicate block_collect:random15 run schedule function block_collect:frenzy_situation 3s

#Hunt Situation:
execute if score Time_Left time_left matches 5..24 unless score Hunt_Cool situation_cool matches 2.. run execute if predicate block_collect:random15 run schedule function block_collect:hunt_situation 5s

#Last 5 Min Boost:
execute as @a[tag=!notparticipant] if score Time_Left time_left matches 1..4 run effect give @s haste 60 1
execute as @a[tag=!notparticipant] if score Time_Left time_left matches 1..4 run effect give @s speed 60 1

#Reset Global Cooldown:
execute if score Global_Cool situation_cool matches 1 run scoreboard players set Global_Cool situation_cool 0

#End of Game:
execute if score Time_Left time_left matches 0 run function block_collect:block_collect_end
execute if score Time_Left time_left matches 0 run schedule clear block_collect:loop_60