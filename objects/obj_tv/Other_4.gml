if (special_prompts == -4 && room != Realtitlescreen && room != characterselect)
{
    special_prompts = ds_map_create()
    ini_open(concat("saveData", global.currentsavefile, ".ini"))
    ds_map_set(special_prompts, "knight", ini_read_real("Prompts", "knight", 0))
    ds_map_set(special_prompts, "boxxedpep", ini_read_real("Prompts", "boxxedpep", 0))
    ds_map_set(special_prompts, "mort", ini_read_real("Prompts", "mort", 0))
    ds_map_set(special_prompts, "squished", ini_read_real("Prompts", "squished", 0))
    ds_map_set(special_prompts, "skateboard", ini_read_real("Prompts", "skateboard", 0))
    ds_map_set(special_prompts, "cheeseball", ini_read_real("Prompts", "cheeseball", 0))
    ds_map_set(special_prompts, "shotgun", ini_read_real("Prompts", "shotgun", 0))
    ds_map_set(special_prompts, "ghost", ini_read_real("Prompts", "ghost", 0))
    ds_map_set(special_prompts, "firemouth", ini_read_real("Prompts", "firemouth", 0))
    ds_map_set(special_prompts, "fireass", ini_read_real("Prompts", "fireass", 0))
    ds_map_set(special_prompts, "bombpep", ini_read_real("Prompts", "bombpep", 0))
    ds_map_set(special_prompts, "rocket", ini_read_real("Prompts", "rocket", 0))
    ini_close()
}
if (room == Realtitlescreen)
{
    if (special_prompts != -4)
        ds_map_destroy(special_prompts)
    special_prompts = -4
}
if (room == entrance_1)
{
    global.rankworks = 1
    global.srank = 26500
    global.arank = global.srank - global.srank / 4
    global.brank = global.srank - global.srank / 4 * 2
    global.crank = global.srank - global.srank / 4 * 3
    global.rank = "d"
    rank_ix = 0
}
else if (room == medieval_1R)
{
    global.rankworks = 1
    global.srank = 24500
    global.arank = global.srank - global.srank / 4
    global.brank = global.srank - global.srank / 4 * 2
    global.crank = global.srank - global.srank / 4 * 3
    global.rank = "d"
    rank_ix = 0
}
else if (room == ruin_1)
{
    global.rankworks = 1
    global.srank = 20000
    global.arank = global.srank - global.srank / 4
    global.brank = global.srank - global.srank / 4 * 2
    global.crank = global.srank - global.srank / 4 * 3
    global.rank = "d"
    rank_ix = 0
}
else if (room == dungeon_1)
{
    global.rankworks = 1
    global.srank = 21500
    global.arank = global.srank - global.srank / 4
    global.brank = global.srank - global.srank / 4 * 2
    global.crank = global.srank - global.srank / 4 * 3
    global.rank = "d"
    rank_ix = 0
}
else if (room == badland_1)
{
    global.rankworks = 1
    global.srank = 23600
    global.arank = global.srank - global.srank / 4
    global.brank = global.srank - global.srank / 4 * 2
    global.crank = global.srank - global.srank / 4 * 3
    global.rank = "d"
    rank_ix = 0
}
else if (room == cove_1)
{
    global.rankworks = 1
    global.srank = 25300
    global.arank = global.srank - global.srank / 4
    global.brank = global.srank - global.srank / 4 * 2
    global.crank = global.srank - global.srank / 4 * 3
    global.rank = "d"
    rank_ix = 0
}
else if (room == industrial_1)
{
    global.rankworks = 1
    global.srank = 22000
    global.arank = global.srank - global.srank / 4
    global.brank = global.srank - global.srank / 4 * 2
    global.crank = global.srank - global.srank / 4 * 3
    global.rank = "d"
    rank_ix = 0
}
else if (global.rankworks == 0)
{
    global.srank = 22000
    global.arank = global.srank - global.srank / 4
    global.brank = global.srank - global.srank / 4 * 2
    global.crank = global.srank - global.srank / 4 * 3
    global.rank = "d"
    rank_ix = 0
}
