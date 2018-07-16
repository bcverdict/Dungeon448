/// @description Insert description here

if(inst_4F75CE06.player_speed != 0)
{
	_tempSpeed = inst_4F75CE06.player_speed;
}
if(gamepad_is_connected(1))
{
	if(inst_78C8041E.player_speed != 0)
	{
		_tempSpeed = inst_78C8041E.player_speed;
	}
	inst_78C8041E.player_speed = 0;
}
inst_4F75CE06.player_speed = 0;

fadeOut = true;
if(drop)
{
	/*
	room_goto(targetRoom);
	inst_4F75CE06.x=targetX;
	inst_4F75CE06.y=targetY;
			
	inst_78C8041E.x=targetX+200;
	inst_78C8041E.y=targetY;
	*/
}
else
{
	if(warp)
	{
		//show_message(_tempSpeed);
		
		room_goto(targetRoom);
		inst_4F75CE06.x=targetX;
		inst_4F75CE06.y=targetY;
		if(gamepad_is_connected(1))
		{
			inst_78C8041E.x=targetX+200;
			inst_78C8041E.y=targetY;
		}
	}
}
