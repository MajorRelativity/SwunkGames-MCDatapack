#Scoreboards:
scoreboard players set Global_Cool situation_cool 1

#Summon Mob:
execute at @s run summon vex ~ ~ ~ {Health:100f,LifeTicks:2000,Tags:["hunter_one"],Attributes:[{Name:"generic.max_health",Base:100},{Name:"generic.follow_range",Base:100},{Name:"generic.attack_damage",Base:20}]}
execute at @s run summon vex ~ ~ ~ {Health:100f,LifeTicks:2000,Tags:["hunter_one"],Attributes:[{Name:"generic.max_health",Base:100},{Name:"generic.follow_range",Base:100},{Name:"generic.attack_damage",Base:20}]}
execute at @a[tag=!notparticipant] run execute as @e[distance=..6,tag=hunter_one] run spreadplayers ~ ~ 1 10 false @s
execute at @a[tag=!notparticipant] run execute as @e[distance=..6,tag=hunter_two] run spreadplayers ~ ~ 1 10 false @s

#Bossbar:
bossbar set block_collect:time_left style progress
bossbar set block_collect:time_left color purple
bossbar set block_collect:time_left name {"text":"--HUNT EVENT--","color":"dark_purple","bold": true}
bossbar set block_collect:time_left value 40

#Playsound:
execute in overworld run playsound entity.wither.spawn master @a[tag=!notparticipant] ~ ~ ~ 100000 2

#Schedule:
schedule function block_collect:hunt_end 120s