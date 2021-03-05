kill @e[type=area_effect_cloud,tag=Block_Collect_Center]
summon area_effect_cloud ~ ~ ~ {Duration:19999980,Tags:["Block_Collect_Center"]}
execute anchored eyes run particle cloud ^1 ^ ^ 0 0 0 1 50 normal
playsound block.note_block.pling master @s ~ ~ ~ 100 2