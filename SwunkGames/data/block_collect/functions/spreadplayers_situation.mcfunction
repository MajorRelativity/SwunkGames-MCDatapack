#Cooldown
scoreboard players set Global_Cool situation_cool 1
scoreboard players add Spread_Cool situation_cool 1

#Playsound:
execute in minecraft:overworld run playsound entity.wither.death master @a[tag=!notparticipant] ~ ~ ~ 10000 

#Bossbar:
bossbar set block_collect:time_left name {"text":"--SPREADPLAYERS EVENT--","color":"blue","bold": true}
bossbar set block_collect:time_left value 40
bossbar set block_collect:time_left style progress
bossbar set block_collect:time_left color blue

#Schedule Spread:
kill @e[tag=Block_Collect_Center]
execute as @r[tag=!notparticipant] at @s run summon area_effect_cloud ~ ~ ~ {Duration:19999980,Tags:["Block_Collect_Center"]}
schedule function block_collect:spreadplayers 30s