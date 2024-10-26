run_index += 0.35
global.combo = 0
if (obj_player.character == "P")
{
    playerpal = 19
    playerhpicon = 2621
}
else if (obj_player.character == "N")
{
    playerpal = 307
    playerhpicon = 2418
}
else if (obj_player.character == "V")
{
    playerpal = 2286
    playerhpicon = 2214
}
else if (obj_player.character == "D")
{
    playerpal = 307
    playerhpicon = 2418
}
if (playerhp > 6)
    playerhp = 6
if (room == tower_2 || room == Titlescreen || room == tower_1)
    instance_destroy()
