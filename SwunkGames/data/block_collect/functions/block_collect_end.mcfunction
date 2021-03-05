#Teleport
execute as @r[tag=!notparticipant] at @s run summon area_effect_cloud ~ ~ ~ {Duration:19999980,Tags:["Block_Collect_Center"]}
execute at @e[type=area_effect_cloud,tag=Block_Collect_Center] run spreadplayers ~ ~ 0 20 false @a[tag=!notparticipant]
execute in overworld run playsound entity.enderman.teleport master @a[tag=!notparticipant] ~ ~ ~ 100000

#Bossbar: 
bossbar set block_collect:time_left color white
bossbar set block_collect:time_left max 40
bossbar set block_collect:time_left value 40
bossbar set block_collect:time_left name {"text":"Block Collect - Game Finished","color":"dark_green","bold":true}

#Playsound:
execute in overworld run playsound entity.enderman.teleport master @a[tag=!notparticipant] ~ ~ ~ 100000
execute in overworld run playsound music_disc.mellohi record @a[tag=!notparticipant] ~ ~ ~ 100000
 
#Reset Tags / Entities / schedule:
kill @e[tag=hunger_golem]
kill @e[tag=hunger_skeleton]
kill @e[tag=Block_Collect_Center]

tag @a remove GameMaster
tag @a remove notparticipant
tag @a remove dead

schedule clear block_collect:death_loop_29