alpha = 1
depth = -8
tiles[0] = array_create(0)
tiles[1] = array_create(0)
tiles[2] = array_create(0)
for (var i = 0; i < 3; i++)
{
    var lay_id = layer_get_id(concat("Tiles_Secret", (i + 1)))
    tilemap_sprite[i] = -4
    if (lay_id != -1)
    {
        var map_id = layer_tilemap_get_id(lay_id)
        var ts = tilemap_get_tileset(map_id)
        var t = -4
        switch ts
        {
            case 6:
                t = spr_tile_ruin1
                break
            case 61:
                t = spr_tile_ruin2
                break
            case 10:
                t = spr_tile_chateau1
                break
            case 32:
                t = spr_tile_desert
                break
            case 55:
                t = spr_tile_ufo
                break
            case 54:
                t = spr_tile_cavern
                break
            case 62:
                t = spr_tile_dungeon1
                break
            case 36:
                t = spr_tile_dungeon2
                break
            case 76:
                t = spr_tile_dungeon3
                break
            case 83:
                t = spr_tile_entrance
                break
            case 39:
                t = spr_tile_tower
                break
            case 59:
                t = spr_tile_farm
                break
            case 5:
                t = spr_tile_forest1
                break
            case 20:
                t = spr_kentukybomber_attack
                break
            case 30:
                t = spr_tile_freezer2
                break
            case 12:
                t = spr_tile_wasteyard1
                break
            case 41:
                t = spr_tile_wasteyard2
                break
            case 70:
                t = spr_tile_wasteyardmine
                break
            case 68:
                t = spr_tile_interior
                break
            case 31:
                t = spr_tile_kidsparty
                break
            case 29:
                t = spr_tile_space1
                break
            case 73:
                t = spr_tile_medieval
                break
            case 56:
                t = spr_tile_medievalcheese
                break
            case 60:
                t = spr_tile_secret
                break
            case 13:
                t = spr_tile_medievalinterior
                break
            case 50:
                t = spr_tile_medievallibrary
                break
        }

        tilemap_sprite[i] = t
        var _w32 = sprite_get_width(t) / 32
        for (var yy = 0; yy < image_yscale; yy++)
        {
            for (var xx = 0; xx < image_xscale; xx++)
            {
                var _x = x + xx * 32
                var _y = y + yy * 32
                var data = tilemap_get_at_pixel(map_id, _x, _y)
                var _id = tile_get_index(data)
                var xi = 0
                var yi = 0
                for (var j = 0; j < _id; j++)
                {
                    xi++
                    if (xi >= _w32)
                    {
                        xi = 0
                        yi++
                    }
                }
                array_push(tiles[i], [_x, _y, (xi * 32), (yi * 32)])
                data = tile_set_empty(data)
                tilemap_set_at_pixel(map_id, data, _x, _y)
            }
        }
    }
}
trace(tilemap_sprite)
if (array_length(tiles[0]) <= 0 && array_length(tiles[1]) <= 0 && array_length(tiles[2]) <= 0)
    instance_destroy()
