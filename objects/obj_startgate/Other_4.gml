switch targetRoom
{
    case entrance_1:
    case medieval_1R:
    case ruin_1:
    case dungeon_1:
        world = 1
        break
    case wasteyard_1:
        world = 2
        break
    case forest_1:
    case minigolf_1:
        world = 3
        break
    case space_1:
    case sewer_1:
    case war_1:
        world = 4
        break
}

ini_open("LevelData")
highscore = ini_read_real("Highscore", string(level), 0)
secret_count = ini_read_string("Secret", string(level), 0)
toppin[0] = ini_read_real("Toppin", (string(level) + "1"), 0)
toppin[1] = ini_read_real("Toppin", (string(level) + "2"), 0)
toppin[2] = ini_read_real("Toppin", (string(level) + "3"), 0)
toppin[3] = ini_read_real("Toppin", (string(level) + "4"), 0)
toppin[4] = ini_read_real("Toppin", (string(level) + "5"), 0)
rank = ini_read_string("Ranks", string(level), "none")
ini_close()
switch level
{
    case "entrance":
        msg = "ENTRANCE"
        break
    case "medieval":
        msg = "PIZZASCAPE"
        break
    case "chateau":
        msg = "PIZZASCARE"
        break
    case "ruin":
        msg = "TEH ANCIENT CHEESE"
        break
    case "dungeon":
        msg = "BLOODSAUCE DUNGEON"
        break
    case "floorroom":
        msg = "OREGANO DESERT"
        break
    case "graveyard":
        msg = "THE WASTEYARD"
        break
    case "farm":
        msg = "FUN FARM"
        break
    case "ufo":
        msg = "SPACE PINBALL"
        break
    case "strongcold":
        msg = "STRONGCOLD"
        break
    case "forest":
        msg = "GNOME FOREST"
        break
    case "beach":
        msg = "PINEAPPLE BEACH"
        break
    case "dragonlair":
        msg = "DRAGON LAIR"
        break
    case "snickchallenge":
        msg = "SNICK CHALLENGE"
        break
}

scr_reinit_levelgatebg(x, y)
