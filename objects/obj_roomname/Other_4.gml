if (room != rank_room && room != timesuproom)
{
    message = global.roommessage
    showtext = 1
    alarm[0] = 100
}
if (global.panic == false && room != Titlescreen && room != rank_room)
    visible = true
else
    visible = false
yincrease = 1
yincrease2 = 0
yi = 500
