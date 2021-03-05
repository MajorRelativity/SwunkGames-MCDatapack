#Schedule:
schedule function block_collect_startup:3sec_start 5s
schedule function block_collect_startup:2sec_start 6s
schedule function block_collect_startup:1sec_start 7s
schedule function block_collect_startup:0sec_start 8s

#Bossbar:
bossbar set block_collect:time_left color white
bossbar set block_collect:time_left max 40
bossbar set block_collect:time_left value 40

#Scores:
scoreboard players set @a[tag=!notparticipant] trackm_block_1 0
scoreboard players set @a[tag=!notparticipant] trackm_block_2 0
scoreboard players set @a[tag=!notparticipant] trackm_block_3 0
scoreboard players set @a[tag=!notparticipant] trackm_block_4 0
scoreboard players set @a[tag=!notparticipant] trackm_block_5 0
scoreboard players set @a[tag=!notparticipant] trackp_block_1 0
scoreboard players set @a[tag=!notparticipant] trackp_block_2 0
scoreboard players set @a[tag=!notparticipant] trackp_block_3 0
scoreboard players set @a[tag=!notparticipant] trackp_block_4 0
scoreboard players set @a[tag=!notparticipant] trackp_block_5 0
scoreboard players set @a[tag=!notparticipant] total_blocks 0
scoreboard players set @a[tag=!notparticipant] deaths_block 0
scoreboard players reset @a removeplayer

scoreboard players set Time_Left time_left 40
scoreboard players set High_Score d1_total_blocks -1
scoreboard players set Low_Score d2_total_blocks -1
scoreboard players set Global_Cool situation_cool 0
scoreboard players set Spread_Cool situation_cool 0
scoreboard players set Frenzy_Cool situation_cool 0
scoreboard players set Hunt_Cool situation_cool 0

scoreboard objectives setdisplay sidebar total_blocks

#Playsound:
playsound entity.wither.break_block master @a ~ ~ ~ 100000 