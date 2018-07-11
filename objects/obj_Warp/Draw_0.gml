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
			NearestPlayer.x=targetX;
			NearestPlayer.y=targetY;
		}
		NearestPlayer = instance_nearest(self.x, self.y, obj_Player);
		NearestPlayer.player_speed = NearestPlayer.MaxPlayerSpeed;
		
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