#Rules/info:
tellraw @a {"text":"(Block_Collect): Welcome to Block Collect Games! Your goal is to collect as many of the target block as possible in 40 minutes. The game will be starting in 5 minutes. Here's how it works:","color":"dark_green"}
tellraw @a {"text":"  1) No Teaming, you will start on your own.","color":"green"}
tellraw @a {"text":"  2) Placing a block your're supposed to be collecting subtracts from your total score","color":"green"}
tellraw @a {"text":"  3) There will be random 'situations' that will be announced on the boss bar, watch out for those.","color":"green"}
tellraw @a [{"text":"  4) The GameMaster for this round is ","color":"green"},{"selector":"@a[tag=GameMaster]","color":"green"}]

#Bossbar:
bossbar set block_collect:time_left name {"text":"SwunkGames - Block Collect","color":"dark_green","bold":true}
bossbar set block_collect:time_left style notched_10
bossbar set block_collect:time_left visible true
bossbar set block_collect:time_left color white
bossbar set block_collect:time_left max 5
bossbar set block_collect:time_left value 5
bossbar set block_collect:time_left players @a

#Scoreboards:
scoreboard players set @a trackm_block_1 0
scoreboard players set @a trackm_block_2 0
scoreboard players set @a trackm_block_3 0
scoreboard players set @a trackm_block_4 0
scoreboard players set @a trackm_block_5 0
scoreboard players set @a trackp_block_1 0
scoreboard players set @a trackp_block_2 0
scoreboard players set @a trackp_block_3 0
scoreboard players set @a trackp_block_4 0
scoreboard players set @a trackp_block_5 0
scoreboard players set Time_Left time_left 6

tag @a add notparticipant

#Playsound:
execute in overworld run playsound ambient.cave master @a ~ ~ ~ 100000