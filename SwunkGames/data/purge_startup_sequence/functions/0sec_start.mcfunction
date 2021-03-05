tellraw @a {"text": "Let the games BEGIN!","color":"dark_purple"}
execute in overworld run playsound entity.wither.spawn master @a ~ ~ ~ 10000
worldborder set 15000 2400
function the_purge:loop_60
schedule function purge_startup_sequence:pigstep 1s