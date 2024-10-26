if (state != states.grabbed && state != states.pummel && state != states.hit && state != states.clown && ((!(place_meeting(x, y, obj_destructibles))) || place_meeting(x, y, obj_onewaybigblock)))
    instance_destroy()
