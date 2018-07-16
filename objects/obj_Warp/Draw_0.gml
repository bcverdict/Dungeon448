/// @description Insert description here
if(fadeOut)
{
	if(_fadeStartTime == 0)
	{
		_fadeStartTime = current_time;	
	}
	global.dim = (current_time - _fadeStartTime)/1000 / 0.4;
	scr_room_transition();
	if(global.dim >=1)
	{
		fadeOut = false;
		fadeIn = true;
		_fadeStartTime = 0;
		
		room_goto(targetRoom);
		if(!drop)
		{
			inst_4F75CE06.x=targetX;
			inst_4F75CE06.y=targetY;
			if(gamepad_is_connected(1))
			{
				inst_78C8041E.x=targetX+200;
				inst_78C8041E.y=targetY;
			}
		}
		inst_4F75CE06.player_speed = inst_4F75CE06.MaxPlayerSpeed;
		if(gamepad_is_connected(1))
			inst_78C8041E.player_speed = inst_78C8041E.MaxPlayerSpeed;
	}
}

if(fadeIn)
{

	if(_fadeStartTime == 0)
	{
		_fadeStartTime = current_time+ 500;	
	}
	global.dim = (_fadeStartTime - current_time)/1000 / 0.4;
	scr_room_transition();
	
	if(global.dim <=0)
	{
		fadeIn = false;
		_fadeStartTime = 0;
		global.dim = 0.01;
		//instance_destroy(self);
	}
}