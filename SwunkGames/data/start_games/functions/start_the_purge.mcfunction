tellraw @s {"text": "Starting Purge","color": "dark_purple","bold": true}
schedule function purge_startup_sequence:purge_statement 1s
schedule function purge_startup_sequence:10sec_activate_sidebar 21s
schedule function purge_startup_sequence:20sec_activate_bossbar 11s
schedule function purge_startup_sequence:3sec_start 28s
schedule function purge_startup_sequence:2sec_start 29s
schedule function purge_startup_sequence:1sec_start 30s
schedule function purge_startup_sequence:0sec_start 31s
