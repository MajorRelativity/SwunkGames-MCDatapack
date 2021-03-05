#Scoreboard:
scoreboard players set Global_Cool situation_cool 1

#Effects:
execute as @s run effect give @s haste 57 4
execute as @s run effect give @s speed 57 1

#Bossbar:
bossbar set block_collect:time_left style progress
bossbar set block_collect:time_left color pink
bossbar set block_collect:time_left name {"text":"--FRENZY EVENT--","color":"pink","bold": true}
bossbar set block_collect:time_left value 40

#Playsound: 
execute in overworld run playsound block.beacon.activate master @a[tag=!participant] ~ ~ ~ 100000 2
