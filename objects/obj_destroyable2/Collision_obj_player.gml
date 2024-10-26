if (other.state != states.chainsaw && other.state != states.grabbed && other.state != states.hit && other.state != states.gotoplayer)
    instance_destroy()
var val = heat_calculate(10)
if (other.object_index == obj_player1)
    global.collect += val
else
    global.collectN += val
create_collect(x, y, sprite_index)
with (instance_create((x + 16), y, obj_smallnumber))
    number = string(val)
