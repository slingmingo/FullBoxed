function scr_ghostcollectible() //gml_Script_scr_ghostcollectible
{
    var q = -4
    var b = id
    with (obj_ghostcollectibles)
    {
        q = 
        {
            x: b.xstart,
            y: b.ystart,
            sprite_index: b.sprite_index,
            image_speed: b.image_speed,
            image_number: b.image_number,
            image_alpha: 0.5,
            image_index: 0,
            image_xscale: b.image_xscale,
            image_yscale: b.image_yscale
        }

        trace(q)
        ds_list_add(collectiblelist, q)
    }
    return q;
}

