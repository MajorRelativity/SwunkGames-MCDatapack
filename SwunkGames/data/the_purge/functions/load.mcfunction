#Schedule Clear:
schedule clear the_purge:loop_60
schedule clear purge_startup_sequence:purge_statement
schedule clear purge_startup_sequence:10sec_activate_sidebar
schedule clear purge_startup_sequence:20sec_activate_bossbar
schedule clear purge_startup_sequence:3sec_start
schedule clear purge_startup_sequence:2sec_start
schedule clear purge_startup_sequence:1sec_start
schedule clear purge_startup_sequence:0sec_start

#Create Scoreboards:
scoreboard objectives setdisplay sidebar
scoreboard objectives add kills_purge playerKillCount
scoreboard objectives add 2kills_purge dummy
scoreboard objectives add deaths_purge deathCount 
scoreboard objectives add the_number_2 dummy
scoreboard objectives add purge_score dummy {"text":"Score (2k/(d+1)):","color":"red","bold":true,"underlined":false}
scoreboard objectives add time_left dummy {"text":"Time Left","color":"dark_purple","bold":true,"underlined":true}
scoreboard objectives add got_lowest_buff dummy

#ScoreBoard Values:
scoreboard players set Time_Left time_left 60
scoreboard players set The_Number_Two the_number_2 2
scoreboard players set @a deaths_purge 1
scoreboard players set @a kills_purge 0
scoreboard players set @a 2kills_purge 0
scoreboard players set @a purge_score 0


#BossBar:
bossbar add the_purge:time_left [{"text":"The Purge - ","color":"dark_purple","bold":true},{"score":{"name":"Time_Left","objective":"time_left"},"color":"dark_purple","bold":true},{"text":" minutes left!","color":"dark_purple","bold":true}]
bossbar set the_purge:time_left color white
bossbar set the_purge:time_left max 60
bossbar set the_purge:time_left value 60
bossbar set the_purge:time_left style notched_6
bossbar set the_purge:time_left visible false

#Load:
tellraw @a {"text": "The Purge has loaded.","color": "dark_purple","bold": true}
execute in overworld run playsound entity.wither.spawn master @a ~ ~ ~ 10000