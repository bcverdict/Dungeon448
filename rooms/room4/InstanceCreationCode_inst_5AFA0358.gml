if(gamepad_is_connected(0))
{
	Message = "Climb Broken Wall (A)";
}
else
{
	Message = "Climb Broken Wall (E)";
}
_room = room1;
_x = self.x;
_y = self.y;