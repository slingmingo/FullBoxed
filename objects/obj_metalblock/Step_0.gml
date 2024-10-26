with (obj_player1)
{
    if ((place_meeting((x + 4 * xscale), y, other) || place_meeting((x + xscale), y, other)) && (obj_player1.state == states.mach3 || obj_player1.state == states.rocket || obj_player1.state == states.knightpepslopes || obj_player1.state == states.Sjump || obj_player1.state == states.shoulderbash || obj_player1.state == states.hypersoar || (obj_player1.state == states.mach2 && obj_player1.character == "D" && obj_player1.movespeed >= 12)))
    {
        playerindex = 0
        instance_destroy(other)
    }
}
if (place_meeting(x, (y + 4), obj_player1) || place_meeting(x, (y - 4), obj_player1) || place_meeting((x - 4), y, obj_player1) || place_meeting((x + 4), y, obj_player1))
{
    if (place_meeting(x, (y - 1), obj_player1) && obj_player1.state == states.freefall && obj_player1.freefallsmash >= 10)
    {
        playerindex = 0
        instance_destroy()
    }
    if (place_meeting(x, (y - 4), obj_player1) && (obj_player1.state == states.knightpep || obj_player1.state == states.Sjump || obj_player1.state == states.hookshot || obj_player1.state == states.hypersoar))
    {
        playerindex = 0
        instance_destroy()
        tile_layer_delete_at(1, x, y)
    }
}
with (obj_player2)
{
    if ((place_meeting((x + hsp), y, other) || place_meeting((x + xscale), y, other)) && (obj_player2.state == states.mach3 || obj_player2.state == states.knightpepslopes || obj_player2.state == states.Sjump || obj_player2.state == states.shoulderbash || obj_player1.state == states.hypersoar || (obj_player1.state == states.mach2 && obj_player1.character == "D" && obj_player1.movespeed >= 12)))
    {
        playerindex = 1
        instance_destroy(other)
    }
}
if (place_meeting(x, (y + 1), obj_player2) || place_meeting(x, (y - 1), obj_player2) || place_meeting((x - 1), y, obj_player2) || place_meeting((x + 1), y, obj_player2))
{
    if (place_meeting(x, (y - 1), obj_player2) && obj_player2.state == states.freefall && obj_player2.freefallsmash >= 10)
    {
        playerindex = 1
        instance_destroy()
    }
    if (place_meeting(x, (y - 1), obj_player2) && (obj_player2.state == states.knightpep || obj_player2.state == states.hookshot))
    {
        playerindex = 1
        instance_destroy()
        tile_layer_delete_at(1, x, y)
    }
}
